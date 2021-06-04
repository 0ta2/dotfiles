require('util')

local api = vim.api

local M = {}

function M.setup_keymappings()
  local opts_silent_expr = { silent = true, expr = true }
  local opts_silent = { silent = true }

  api.nvim_set_keymap("i", "<TAB>", 'pumvisible() ? "<C-N>" : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts_silent_expr )
  api.nvim_set_keymap('i', '<S-TAB>', 'pumvisible() ? "<C-n>" : "<C-h>"', opts_silent_expr)
  api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? coc#_select_confirm() : "<C-g>u<CR><C-r>=coc#on_enter()<CR>"', opts_silent_expr)
  api.nvim_set_keymap('i', '<c-spaces>', 'coc#refresh()', opts_silent_expr)

  -- Use `[g` and `]g` to navigate diagnostics.
  api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', opts_silent)
  api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', opts_silent)

  -- GoTo code navigation.
  api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', opts_silent)
  api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', opts_silent)
  api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', opts_silent)
  api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', opts_silent)
  api.nvim_set_keymap('n', leader .. 'a', '<Plug>(coc-codeaction)', opts_silent)
  api.nvim_set_keymap('n', leader .. 'qf', '<Plug>(coc-fix-current)', opts_silent)


  -- Use K to show documentation in preview window.
  api.nvim_set_keymap('n', 'K', '<cmd>call v:lua.show_documentation()<CR>', opts_silent)

  -- Symbole rename.
  api.nvim_set_keymap('n', leader .. 'rn', '<Plug>(coc-rename)', opts_silent)

  -- Formatting selected code.
  api.nvim_set_keymap('n', 'cf', '<Plug>(coc-format-selected)', opts_silent)
  api.nvim_set_keymap('x', 'cf', '<Plug>(coc-format-selected)', opts_silent)

  -- coc-fzf-preview
  api.nvim_set_keymap('n', leader .. 'f' , ':<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>', opts_silent)
  api.nvim_set_keymap('n', leader .. 'b' , ':<C-u>CocCommand fzf-preview.Buffers<CR>', opts_silent)
  api.nvim_set_keymap('n', leader .. 'gs' , ':<C-u>CocCommand fzf-preview.GitStatus<CR>', opts_silent)
  api.nvim_set_keymap('n', leader .. 'ga' , ':<C-u>CocCommand fzf-preview.GitActions<CR>', opts_silent)
  api.nvim_set_keymap('n', leader .. '<C-o>', ':<C-u>CocCommand fzf-preview.Jumps<CR>', opts_silent)
  api.nvim_set_keymap('n', leader .. 'l', [[:<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query=""<CR>]], opts_silent)
  api.nvim_set_keymap('n', leader .. 'dig', ':<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>', {})
end

_G.show_documentation = function()
  local filetype = vim.bo.filetype
  local cword = vim.fn.expand('<cword>')
  if filetype == "vim" or filetype == "help" then
    vim.fn.execute('help ' .. cword)
  elseif vim.fn["coc#rpc#ready"]() then
    vim.fn.CocActionAsync("doHover")
  else
    vim.fn.execute(vim.o.keywordprg .. ' ' .. cword)
  end
end

function M.setup_settings()
  vim.g.coc_global_extensions = {
    'coc-json',
    'coc-tsserver',
    'coc-lua',
    'coc-vimlsp',
    'coc-lists',
    'coc-fzf-preview',
    'coc-snippets',
    '@yaegassy/coc-intelephense',
    'coc-phpactor',
    'coc-php-cs-fixer',
    'coc-git'
  }
  vim.cmd([[ command! -nargs=0 Format :call CocAction('format') ]])
  vim.cmd([[ command! -nargs=? Fold :call CocAction('fold', <f-args>) ]])
end

function M.init()
  M.setup_settings()
  M.setup_keymappings()
end

return M
