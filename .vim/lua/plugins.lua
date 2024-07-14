disable_file_type = {
  'help',
  'packer',
  'lspsagafinder',
  'TelescopePrompt',
  'moving.lua',
  'HopChar',
  'NeogitPopup',
  'NeogitStatus',
  'mason',
}

lsp_servers = {
  'lua_ls',
  'bashls',
  'denols',
  'dockerls',
  'gopls',
  'jsonls',
  'tsserver',
  'intelephense'
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  -- Configurations for Nvim LSP
  {
    'neovim/nvim-lspconfig',
    config = function()
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', 'gD', [[<cmd>:lua vim.lsp.buf.declaration()<cr>]], opts)
        vim.keymap.set('n', 'gd', [[<cmd>:lua vim.lsp.buf.definition()<cr>]], opts)
        vim.keymap.set('n', 'K', [[<cmd>:lua vim.lsp.buf.hover()<cr>]], opts)
        -- vim.keymap.set('n', 'gr', [[<cmd>:lua vim.lsp.buf.references()<cr>]], opts)
        -- vim.keymap.set('n', 'gi', [[<cmd>:lua vim.lsp.buf.implementation()<cr>]], opts)
        vim.keymap.set('n', leader .. 'K', [[<cmd>:lua vim.lsp.buf.signature_help()<cr>]], opts)
        vim.keymap.set('n', leader .. 'a', [[<cmd>:lua vim.lsp.buf.code_action()<cr>]], opts)
        vim.keymap.set('n', leader .. 'rn', [[<cmd>:lua vim.lsp.buf.rename()<cr>]], opts)
        vim.keymap.set('n', leader .. 'f', [[<cmd>:lua vim.lsp.buf.format()<cr>]], opts)
      end
      -- Set up lspconfig.
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require('lspconfig')
      local servers = lsp_servers
      local lsp_flags = {
        debounce_text_changes = 100,
      }

      for _, lsp in ipairs(servers) do
        if lsp == 'lua_ls' then
          lspconfig[lsp].setup {
            flags = lsp_flags,
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' },
                }
              }
            }
          }
        else
          lspconfig[lsp].setup {
            flags = lsp_flags,
            capabilities = capabilities,
            on_attach = on_attach,
          }
        end
      end

      local function go_org_imports(wait_ms)
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
        for cid, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
              vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
          end
        end
      end

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          go_org_imports()
        end
      })
    end,
  },

  -- linter/formatter
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        -- lua
        null_ls.builtins.formatting.stylua,
        -- spell
        null_ls.builtins.completion.spell,
        -- shell
        null_ls.builtins.diagnostics.shellcheck,
      })
    end,
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- Nvim Package manager
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })

      require('mason-lspconfig').setup({
        ensure_installed = lsp_servers
      })
    end
  },

  -- Completion engine
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-vsnip',   dependencies = 'hrsh7th/vim-vsnip' },
      { 'petertriho/cmp-git',  dependencies = 'nvim-lua/plenary.nvim' },
    },
    config = function()
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
      end

      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },
        window = {},
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
              feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
              cmp.complete()
            else
              fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
              feedkey("<Plug>(vsnip-jump-prev)", "")
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
          { name = 'buffer' },
          { name = 'path' }
        }, {
          { name = 'buffer' },
        })
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end
  },

  { 'golang/vscode-go' },

  -- Go
  {
    'ray-x/go.nvim',
    config = function()
      require('go').setup()
    end
  },

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'lua',
          'go',
          'toml',
          'php',
          'phpdoc',
          'javascript',
          'html',
          'css'
        },
        highlight = {
          enable = true,
          disable = {}
        },
        indent = {
          enable = true,
        },
      }
    end
  },

  -- debug
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "leoluz/nvim-dap-go",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require('dap-go').setup()
      require('dapui').setup()

      local opts = { silent = true }
      vim.keymap.set('n', leader .. 'dc', [[:lua require ]dap'.continue()<CR>]], opts)
      vim.keymap.set('n', leader .. 'dn', [[:lua require'dap'.step_over()<CR>]], opts)
      vim.keymap.set('n', leader .. 'di', [[:lua require'dap'.step_into()<CR>]], opts)
      vim.keymap.set('n', leader .. 'do', [[:lua require'dap'.step_out()<CR>]], opts)
      vim.keymap.set('n', leader .. 'db', [[:lua require'dap'.toggle_breakpoint()<CR>]], opts)
      vim.keymap.set('n', leader .. leader .. 'd', [[:lua require'dapui'.toggle()<CR>]], opts)
      vim.keymap.set('n', leader .. leader .. 'df', [[:lua require'dapui'.eval()<CR>]], opts)

      -- debug が開始したらdapui を起動
      require 'dap'.listeners.before['event_initialized']['custom'] = function(session, body)
        require("dapui").open()
      end
      -- debug が終了したらdapui を終了
      require 'dap'.listeners.before['event_terminated']['custom'] = function(session, body)
        require 'dapui'.close()
      end

      local dap = require("dap")
      dap.adapters.go = function(callback, config)
        local stdout = vim.loop.new_pipe(false)
        local handle
        local pid_or_err
        local port = 38697
        local opts = {
          stdio = { nil, stdout },
          args = { "dap", "-l", "127.0.0.1:" .. port },
          detached = true
        }
        handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
          stdout:close()
          handle:close()
          if code ~= 0 then
            print('dlv exited with code', code)
          end
        end)
        assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
        stdout:read_start(function(err, chunk)
          assert(not err, err)
          if chunk then
            vim.schedule(function()
              require('dap.repl').append(chunk)
            end)
          end
        end)
        -- Wait for delve to start
        vim.defer_fn(
          function()
            callback({ type = "server", host = "127.0.0.1", port = port })
          end,
          100)
      end
      dap.configurations.go = {
        {
          type = "go",
          name = "Debug",
          request = "launch",
          mode = "debug",
          program = "${file}",
        },
        {
          type = "go",
          name = "Debug(args)",
          request = "launch",
          mode = "debug",
          program = "${file}",
          args = function()
            local args_string = vim.fn.input('Arguments: ')
            return vim.split(args_string, " +")
          end,
        }
      }

      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { "~/ghq/github.com/xdebug/vscode-php-debug/out/phpDebug.js" }
      }
      dap.configurations.php = {
        {
          type = 'php',
          request = 'launch',
          name = 'Listen for Xdebug',
          port = 9000
        }
      }
    end,
  },

  -- Search
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ['<esc>'] = actions.close
            },
          },
        },
      })
      local opts = { silent = true }
      vim.keymap.set('n', '<c-p>',
        [[<cmd>lua require('telescope.builtin').find_files({find_command = {'rg', '--files', '--hidden', '--glob', '!.git'}})<cr>]]
        , opts)
      vim.keymap.set('n', '<c-t>', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], opts)
      vim.keymap.set('n', '<c-g>', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], opts)
      vim.keymap.set('n', leader .. 'c', [[<cmd>lua require('telescope.builtin').commands()<cr>]], opts)
      vim.keymap.set('n', leader .. 'dig', [[<cmd>lua require('telescope.builtin').diagnostics()<cr>]], opts)
      -- git
      vim.keymap.set('n', leader .. 'gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], opts)
      -- lsp
      vim.keymap.set('n', 'gr', [[<cmd>lua require('telescope.builtin').lsp_references({include_current_line=true})<cr>]]
      , opts)
      vim.keymap.set('n', 'gi', [[<cmd>lua require('telescope.builtin').lsp_implementations()<cr>]], opts)
    end
  },

  -- 置換のプレビュー
  { 'markonm/traces.vim' },
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup()
    end
  },

  -- git
  { 'tpope/vim-fugitive' },
  { 'airblade/vim-gitgutter' },
  {
    'lambdalisue/gin.vim',
    dependencies = { 'vim-denops/denops.vim' }
  },
  {
    'TimUntersberger/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      local neogit = require('neogit')
      neogit.setup {}
    end
  },

  -- Colorscheme
  {
    --'olimorris/onedarkpro.nvim',
    'sainnhe/gruvbox-material',
    config = function()
      -- require("onedarkpro").setup({
      --   dark_theme = "onedark_dark", -- The default dark theme
      -- })
      vim.cmd [[ colorscheme gruvbox-material ]]
    end
  },
  -- color
  { 'gko/vim-coloresque' },

  -- Filer plugin
  {
    'lambdalisue/fern.vim',
    config = function()
      local opts = { silent = true }
      local exclude_files = {
        [[\.DS_Store]],
        [[\.git]],
      }
      vim.g["fern#default_exclude"] = [[^\%(]] .. table.concat(exclude_files, [[\|]]) .. [[\)$]]
      vim.g['fern#default_hidden'] = 1
      vim.keymap.set('n', leader .. 'e', [[:<C-u>Fern . -drawer -toggle -reveal=% <cr>]], opts)
    end
  },
  -- 末尾の空白スペース可視化
  {
    'bronson/vim-trailing-whitespace',
    config = function()
      vim.g.extra_whitespace_ignored_filetypes = disable_file_type
    end
  },

  -- tab
  {
    'akinsho/bufferline.nvim',
    config = function()
      require('bufferline').setup {
        options = {
          view = "default",
          numbers = "none",
          buffer_close_icon = '',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          max_name_length = 18,
          max_prefix_length = 15,
          tab_size = 18,
          diagnostics = "nvim_lsp",
          show_buffer_close_icons = false,
          persist_buffer_sort = true,
          separator_style = "thin",
          enforce_regular_tabs = false,
          always_show_bufferline = true,
        }
      }
    end,
    dependencies = {
      'kyazdani42/nvim-web-devicons'
    }
  },

  -- tmux
  {
    'christoomey/vim-tmux-navigator',
    cnfig = function()
      local api = vim.api
      vim.g.tmux_navigator_no_mappings = 1
      vim.g.tmux_navigator_save_on_switch = 2
      vim.g.tmux_navigator_no_mappings = 1

      local opts = { silent = true }
      vim.keymap.set('n', '<C-S-h>', [[:<C-u>TmuxNavigateLeft <CR>]], opts)
      vim.keymap.set('n', '<C-S-j>', [[:<C-u>TmuxNavigateDown <CR>]], opts)
      vim.keymap.set('n', '<C-S-k>', [[:<C-u>TmuxNavigateUp <CR>]], opts)
      vim.keymap.set('n', '<C-S-l>', [[:<C-u>TmuxNavigateRight <CR>]], opts)
      vim.keymap.set('n', '<C-S-\\>', [[:<C-u>TmuxNavigatePrevious <CR>]], opts)
    end
  },

  -- Delibiters
  -- カッコを自動的に閉じる
  { 'jiangmiao/auto-pairs' },
  -- カッコの編集を便利するプラグイン
  { 'tpope/vim-surround' },

  -- editing
  { 'tpope/vim-commentary' },
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup({})
    end
  },

  --{
  --  'nathanaelkane/vim-indent-guides',
  --  config = function()
  --    vim.g.indent_guides_enable_on_vim_startup = 1
  --    vim.g.indent_guides_start_level = 2
  --    vim.g.indent_guides_guide_size = 1
  --    vim.cmd('hi IndentGuidesOdd  ctermbg=black')
  --    vim.cmd('hi IndentGuidesEven ctermbg=darkgrey')
  --    vim.g.indent_guides_exclude_filetypes = disable_file_type
  --  end
  --},

  -- Window
  {
    'simeji/winresizer',
    cmd = 'WinResizerStartResize',
    setup = function()
      local opts = { silent = true }
      vim.keymap.set('n', '<C-e>', ':WinResizerStartResize<CR>', opts)
      vim.g.winresizer_vert_resize = 5
      vim.g.winresizer_horiz_resize = 5
    end
  },

  -- markdown
  {
    'previm/previm',
    ft = { 'md', 'markdown' },
    dependencies = {
      'tyru/open-browser.vim'
    }
  },

  -- moving
  -- 括弧移動強化
  { 'andymass/vim-matchup' },
  -- カーソル移動
  { 'mg979/vim-visual-multi' },
  {
    'phaazon/hop.nvim',
    config = function()
      require('hop').setup {}
      local opts = { silent = true }
      vim.keymap.set('n', 'fs', "<cmd>lua require'hop'.hint_char1()<cr>", opts)
      vim.cmd([[ highlight default HopNextKey1 guifg=#fff200 gui=bold blend=0 ]])
      vim.cmd([[ highlight default HopNextKey2 guifg=#ede8eb blend=0 ]])
    end
  },

  -- statusline
  {
    'hoob3rt/lualine.nvim',
    config = function()
      local lualine = require('lualine')
      lualine.setup {
        options = {
          theme = 'gruvbox-material',
          section_separators = { '', '' },
          component_separators = { '', '' },
          icons_enabled = true,
        },
        sections = {
          lualine_a = { { 'mode', upper = true } },
          lualine_b = { { 'branch', icon = '' } },
          lualine_c = { { 'filename', file_status = true } },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        extensions = { 'fzf' }
      }
    end,
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      lazy = true
    }
  },

  -- support
  {
    'reireias/vim-cheatsheet',
    config = function()
      vim.g['cheatsheet#cheat_file'] = vim.env.DOTFILES_PATH .. '/Doc/cheetsheet.md'
    end
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
   },

  -- help の日本語化
  { 'vim-jp/vimdoc-ja' },

  -- database
  {
    'tpope/vim-dadbod',
    dependencies = {
      {
        'kristijanhusak/vim-dadbod-ui',
        config = function()
          vim.cmd([[ autocmd FileType dbui nmap <buffer> o <Plug>(DBUI_SelectLine) ]])
          vim.g.dbs = {}
        end
      }
    }
  }
})
