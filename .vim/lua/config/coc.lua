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
  api.nvim_set_keymap('n', leader .. 'c', ':<C-u>CocList commands<CR>', opts_silent)
  api.nvim_set_keymap('n', leader .. 'l', ":<C-u>CocList<CR>", opts_silent)
  api.nvim_set_keymap('n', '<c-t>', ':<C-u>call CocActionAsync("jumpDefinition", v:lua.CocJumpAction())<CR>', opts_silent)

  -- Use `[g` and `]g` to navigate diagnostics.
  api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', opts_silent)
  api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', opts_silent)

  -- GoTo code navigation.
  api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', opts_silent)
  api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', opts_silent)
  api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', opts_silent)
  --api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', opts_silent)
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
  api.nvim_set_keymap('n', leader .. 'f' , ':<C-u>CocCommand fzf-preview.FromResources buffer project_mru project<CR>', opts_silent)
  api.nvim_set_keymap('n', leader .. 'F', ':<C-u>CocCommand fzf-preview.ProjectFiles<CR>', opts_silent)
  api.nvim_set_keymap('n', leader .. 'b' , ':<C-u>CocCommand fzf-preview.Buffers<CR>', opts_silent)
  api.nvim_set_keymap('n', leader .. 'r' , ':<C-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<Space>', {})
  api.nvim_set_keymap('n', leader .. 'gs' , ':<C-u>CocCommand fzf-preview.GitStatus<CR>', opts_silent)
  api.nvim_set_keymap('n', leader .. 'ga' , ':<C-u>CocCommand fzf-preview.GitActions<CR>', opts_silent)
  api.nvim_set_keymap('n', leader .. '<C-o>', ':<C-u>CocCommand fzf-preview.Jumps<CR>', opts_silent)
  api.nvim_set_keymap('n', leader .. 'o', [[:<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query=""<CR>]], opts_silent)
  api.nvim_set_keymap('n', leader .. 'dig', ':<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>', {})
  api.nvim_set_keymap('n', 'gr', ':CocCommand fzf-preview.CocReferences<CR>', opts_silent)
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

function _G.CocJumpAction()
  local actions = {
    ["split"] = "(s)plit",
    ["vsplit"] = "(v)slit",
    ['tabedit'] = "(t)ab"
  }
  print(pconcat(actions, ", "))

  local imputKey = vim.fn.getcharstr()

  if imputKey == "s" then
    return "split"
  elseif imputKey == "v" then
    return "vsplit"
  elseif imputKey == "t" then
    return "tabedit"
  else
    return "split"
  end
end

function M.setup_settings()
  vim.g.coc_global_extensions = {
    'coc-json',
    'coc-tsserver',
    'coc-deno',
    'coc-sumneko-lua',
    'coc-vimlsp',
    'coc-lists',
    'coc-fzf-preview',
    'coc-snippets',
    '@yaegassy/coc-intelephense',
    'coc-phpactor',
    'coc-php-cs-fixer',
    'coc-git',
    'coc-db',
    'coc-yaml',
    'coc-diagnostic',
    'coc-flutter'
  }
  vim.cmd([[ command! -nargs=0 Format :call CocAction('format') ]])
  vim.cmd([[ command! -nargs=? Fold :call CocAction('fold', <f-args>) ]])
  vim.cmd([[ command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport') ]])
  vim.cmd([[ autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport') ]])

  -- fzf
  vim.g.fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g "!.git/*"'
  vim.g.fzf_preview_grep_cmd = 'rg --line-number --no-heading --color=never --hidden -g "!.git/*"'

  -- coc-snippets
  vim.g.ultisnips_php_scalar_types = 1
  vim.g.coc_snippet_next = '<c-j>'
  vim.g.coc_snippet_prev = '<c-k>'
  vim.highlight.create('CocWarningSign', {ctermfg=0, ctermbg=172}, false)
end

function M.init()
  M.setup_settings()
  M.setup_keymappings()
end

return M
