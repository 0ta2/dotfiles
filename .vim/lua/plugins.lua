-- install packer.nvim
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

--Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Autocompletion
  use {'prabirshrestha/asyncomplete.vim',
    config = function()
      vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { noremap = true, expr = true })
      vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { noremap = true, expr = true})
      vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? asyncomplete#close_popup() : "<CR>"', { noremap = true, expr = true})
      vim.cmd [[ call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({ 'name': 'buffer', 'allowlist': ['*'], 'blocklist': ['go'], 'completor': function('asyncomplete#sources#buffer#completor'), 'config': { 'max_buffer_size': 5000000, }, })) ]]
      vim.cmd [[ call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({ 'name': 'file', 'allowlist': ['*'], 'completor': function('asyncomplete#sources#file#completor'), 'config': { 'max_buffer_size': 5000000, }, })) ]]
      vim.cmd [[ call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({ 'name': 'ultisnips', 'allowlist': ['*'], 'completor': function('asyncomplete#sources#ultisnips#completor'), })) ]]
      -- asyncomplete
      vim.g.asyncomplete_auto_popup = 1
      vim.g.asyncomplete_auto_completeopt = 0
      -- Snippet
      vim.g.UltiSnipsExpandTrigger = "<C-j>"
      vim.g.UltiSnipsJumpForwardTrigger = "<C-n>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<C-p>"
    end,
    requires = {
      {'prabirshrestha/asyncomplete-lsp.vim'},
      {'prabirshrestha/asyncomplete-buffer.vim'},
      {'prabirshrestha/asyncomplete-file.vim'},
      {'prabirshrestha/asyncomplete-ultisnips.vim'},
      {'wellle/tmux-complete.vim'}
    }
  }

  -- Lsp
  use {'prabirshrestha/vim-lsp',
    config = function()
      vim.cmd('autocmd BufWritePre *.go LspDocumentFormatSync')

      vim.cmd('set omnifunc=lsp#complete')
      vim.api.nvim_set_keymap('n', 'gd', '<Plug>(lsp-definition)', { noremap = false, silent = true })
      vim.api.nvim_set_keymap('n', 'gr', '<Plug>(lsp-references)', { noremap = false, silent = true })
      vim.api.nvim_set_keymap('n', 'gi', '<Plug>(lsp-implementation)', { noremap = false,  silent = true })
      vim.api.nvim_set_keymap('n', 'gt', '<Plug>(lsp-type-definition)', { noremap = false, silent = true })
      vim.api.nvim_set_keymap('n', leader .. 'rn', '<Plug>(lsp-rename)', { noremap = false,  silent = true })
      vim.api.nvim_set_keymap('n', '[g', '<Plug>(lsp-previous-diagnostic)', { noremap = false,  silent = true })
      vim.api.nvim_set_keymap('n', ']g', '<Plug>(lsp-next-diagnostic)', { noremap = false,  silent = true })
      vim.api.nvim_set_keymap('n', 'K', '<Plug>(lsp-hover)',   { noremap = false, silent = true })
    end,
    requires = {
      {'mattn/vim-lsp-settings'}
    }
  }

  -- Golnag
  use {'mattn/vim-goimports'}

  -- Snippet
  use {'SirVer/ultisnips'}
  use {'honza/vim-snippets'}

  -- カッコを自動的に閉じる
  use {'jiangmiao/auto-pairs'}

  -- フォルダツリーの表示
  use {
    'lambdalisue/fern.vim',
    setup = function()
      vim.g['fern#default_hidden'] = 1,
      vim.api.nvim_set_keymap('n', leader .. 'e', ':<C-u> Fern . -reveal=% <CR>',
        { noremap = true, silent = true  })
    end
  }

  -- コメントアウト
  use {'tpope/vim-commentary'}

  -- 各種言語の設定集
  use {'sheerun/vim-polyglot'}

  -- インデント表示
  use {
    'nathanaelkane/vim-indent-guides',
    config = function()
      vim.g.indent_guides_enable_on_vim_startup = 1
      vim.g.indent_guides_start_level = 2
      vim.g.indent_guides_guide_size = 1
      vim.cmd('hi IndentGuidesOdd  ctermbg=black')
      vim.cmd('hi IndentGuidesEven ctermbg=darkgrey')
      vim.g.indent_guides_exclude_filetypes = {'help', 'startify'}
    end
  }

  -- 末尾の空白スペースの表示
  use {
    'bronson/vim-trailing-whitespace',
    config = function()
      vim.g.extra_whitespace_ignored_filetypes = {'help', 'startify', 'packer'}
    end
  }

  -- 画面サイズ変更
  use {
    'simeji/winresizer',
    cmd = 'WinResizerStartResize',
    setup = function()
      vim.api.nvim_set_keymap('n', '<C-e>', ':WinResizerStartResize<CR>',
        { noremap = true, silent = true })
      vim.g.winresizer_vert_resize = 5
      vim.g.winresizer_horiz_resize = 5
    end
  }

  -- Markdown
  use {
    'previm/previm',
    ft = {'md', 'markdown'},
    requires = 'tyru/open-browser.vim'
  }

  -- カーソル操作
  use {'terryma/vim-multiple-cursors'}

  -- カッコの編集を便利するプラグイン
  use {'tpope/vim-surround'}

  -- help の日本語化
  use {'vim-jp/vimdoc-ja'}

  -- チートシート
  use {
    'reireias/vim-cheatsheet',
    config = function()
      vim.g['cheatsheet#cheat_file'] = vim.env.DOTFILES_PATH .. '/Doc/cheetsheet.md'
    end
  }

  -- カラーのプレビュー
  use {'gko/vim-coloresque'}

  -- Git
  use {'tpope/vim-fugitive'}
  use {'airblade/vim-gitgutter'}
  use {'tpope/vim-rhubarb'}

  -- Tmux
  use {
    'christoomey/vim-tmux-navigator',
    cnfig = function()
      vim.g.tmux_navigator_no_mappings = 1
      vim.g.tmux_navigator_save_on_switch = 2
      vim.g.tmux_navigator_no_mappings = 1

      vim.api.nvim_set_keymap('n', '<C-S-h>', ':TmuxNavigateLeft <CR>',
        { noremap = true, silent = true  })
      vim.api.nvim_set_keymap('n', '<C-S-j>', ':TmuxNavigateDown <CR>',
        { noremap = true, silent = true  })
      vim.api.nvim_set_keymap('n', '<C-S-k>', ':TmuxNavigateUp <CR>',
        { noremap = true, silent = true  })
      vim.api.nvim_set_keymap('n', '<C-S-l>', ':TmuxNavigateRight <CR>',
        { noremap = true, silent = true  })

      vim.api.nvim_set_keymap('n', '<C-S-\\>', ':TmuxNavigatePrevious <CR>',
        { noremap = true, silent = true  })
    end
  }

  -- ファイル検索
  use {
    'ctrlpvim/ctrlp.vim',
    config = function()
      vim.g.ctrlp_map = '<Nop>'
      vim.g.ctrlp_extensions = {'tag', 'buffertag', 'quickfix', 'dir', 'rtscript', 'undo', 'line', 'changes', 'mixed', 'bookmarkdir', 'filetype'}
      -- vim.g.ctrlp_user_command = [[ rg %s --files --hidden --color=never --glob "" ]]
      vim.g.ctrlp_user_command = {'.git', 'rg %s --files --hidden --color=never' }
      vim.g.ctrlp_use_caching = 0

      -- keymap
      vim.api.nvim_set_keymap('n', leader .. leader, ':<C-u> CtrlPMixed <CR>', { noremap = true, silent = true  })
      vim.api.nvim_set_keymap('n', leader .. 'b', ':<C-u> CtrlPBuffer <CR>', { noremap = true, silent = true  })
      vim.api.nvim_set_keymap('n', leader .. 'l', ':<C-u> CtrlPLine <CR>', { noremap = true, silent = true  })
      vim.api.nvim_set_keymap('n', leader .. 'fi', ':<C-u> CtrlPFiletype <CR>', { noremap = true, silent = true  })
      vim.api.nvim_set_keymap('n', leader .. 'c', ':<C-u> CtrlPCmdPalette <CR>', { noremap = true, silent = true  })
      vim.api.nvim_set_keymap('n', leader .. 'r', ':<C-u> CtrlPCmdPalette <CR>', { noremap = true, silent = true  })
    end,
    requires = {
      {'endel/ctrlp-filetype.vim'},
      {'fisadev/vim-ctrlp-cmdpalette'},
      {'halkn/ctrlp-ripgrep'}
    }
  }

  -- 置換のプレビュー
  use {'markonm/traces.vim'}

  -- タブ表示
  use {'ap/vim-buftabline'}

  -- ステータスライン
  use {'vim-airline/vim-airline',
    requires = {
      {
        'vim-airline/vim-airline-themes',
        config = function()
          vim.g.airline_theme = "hybridline"
        end
      }
    }
  }

  -- 移動
  use {'easymotion/vim-easymotion',
    config = function()
      vim.api.nvim_set_keymap('', 'f', '<Plug>(easymotion-prefix)', { noremap = false, silent = true  })
    end
  }

  -- カッコ移動の強化
  use {'andymass/vim-matchup'}

  -- 検索した際に個数を表示させる
  use {'osyo-manga/vim-anzu',
    vim.api.nvim_set_keymap('n', 'n', '<Plug>(anzu-n-with-echo)',
      { noremap = false, silent = true  }),
    vim.api.nvim_set_keymap('n', 'N', '<Plug>(anzu-N-with-echo)',
      { noremap = false, silent = true  }),
    vim.api.nvim_set_keymap('n', '*', '<Plug>(anzu-star-with-echo)',
      { noremap = false, silent = true  }),
    vim.api.nvim_set_keymap('n', '#', '<Plug>(anzu-sharp-with-echo)',
      { noremap = false, silent = true  })
  }

  -- カラー設定
  use {
    'christianchiarulli/nvcode-color-schemes.vim',
    config = require'plugins.colorscheme',
    as = 'colorscheme',
  }
  use {'nvim-treesitter/nvim-treesitter'}
end)
