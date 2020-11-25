" Automatically generated packer.nvim plugin loader code

if !has('nvim')
  finish
endif

lua << END
local plugins = {
  ["fern.vim"] = {
    loaded = false,
    only_sequence = true,
    only_setup = true,
    path = "/Users/0ta2/.local/share/nvim/site/pack/packer/opt/fern.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/0ta2/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  previm = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/0ta2/.local/share/nvim/site/pack/packer/opt/previm"
  },
  winresizer = {
    commands = { "WinResizerStartResize" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/0ta2/.local/share/nvim/site/pack/packer/opt/winresizer"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

_packer_load = nil

local function handle_after(name, before)
  local plugin = plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    _packer_load({name}, {})
  end
end

_packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if plugins[name].commands then
      for _, cmd in ipairs(plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if plugins[name].keys then
      for _, key in ipairs(plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if plugins[name].config then
        for _i, config_line in ipairs(plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if plugins[name].after then
        for _, after_name in ipairs(plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    -- NOTE: I'm not sure if the below substitution is correct; it might correspond to the literal
    -- characters \<Plug> rather than the special <Plug> key.
    vim.fn.feedkeys(string.gsub(string.gsub(cause.keys, '^<Plug>', '\\<Plug>') .. extra, '<[cC][rR]>', '\r'))
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Setup for: winresizer
loadstring("\27LJ\1\2Ë\1\0\0\5\0\n\0\0174\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\0014\0\0\0007\0\a\0'\1\5\0:\1\b\0004\0\0\0007\0\a\0'\1\5\0:\1\t\0G\0\1\0\28winresizer_horiz_resize\27winresizer_vert_resize\6g\1\0\2\vsilent\2\fnoremap\2\31:WinResizerStartResize<CR>\n<C-e>\6n\20nvim_set_keymap\bapi\bvim\0")()
-- Setup for: fern.vim
loadstring("\27LJ\1\2­\1\0\0\a\0\n\0\0154\0\0\0007\0\1\0'\1\1\0004\2\0\0007\2\3\0027\2\4\2%\3\5\0004\4\6\0%\5\a\0$\4\5\4%\5\b\0003\6\t\0>\2\5\1:\1\2\0G\0\1\0\1\0\2\vsilent\2\fnoremap\2!:<C-u> Fern . -reveal=% <CR>\6e\vleader\6n\20nvim_set_keymap\bapi\24fern#default_hidden\6g\bvim\0")()
vim.cmd("packadd fern.vim")
-- Post-load configuration
-- Config for: vim-cheatsheet
loadstring("\27LJ\1\2l\0\0\3\0\6\0\t4\0\0\0007\0\1\0004\1\0\0007\1\3\0017\1\4\1%\2\5\0$\1\2\1:\1\2\0G\0\1\0\23/Doc/cheetsheet.md\18DOTFILES_PATH\benv\26cheatsheet#cheat_file\6g\bvim\0")()
-- Config for: vim-indent-guides
loadstring("\27LJ\1\2Å\2\0\0\2\0\n\0\0254\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0'\1\2\0:\1\3\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0004\0\0\0007\0\5\0%\1\6\0>\0\2\0014\0\0\0007\0\5\0%\1\a\0>\0\2\0014\0\0\0007\0\1\0003\1\t\0:\1\b\0G\0\1\0\1\3\0\0\thelp\rstartify$indent_guides_exclude_filetypes)hi IndentGuidesEven ctermbg=darkgrey&hi IndentGuidesOdd  ctermbg=black\bcmd\29indent_guides_guide_size\30indent_guides_start_level(indent_guides_enable_on_vim_startup\6g\bvim\0")()
-- Config for: vim-trailing-whitespace
loadstring("\27LJ\1\2]\0\0\2\0\4\0\0054\0\0\0007\0\1\0003\1\3\0:\1\2\0G\0\1\0\1\4\0\0\thelp\rstartify\vpacker'extra_whitespace_ignored_filetypes\6g\bvim\0")()
-- Config for: ctrlp.vim
loadstring("\27LJ\1\2Ÿ\6\0\0\5\0\29\0M4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0004\0\0\0007\0\1\0003\1\6\0:\1\5\0004\0\0\0007\0\1\0%\1\b\0:\1\a\0004\0\0\0007\0\t\0007\0\n\0%\1\v\0004\2\f\0004\3\f\0$\2\3\2%\3\r\0003\4\14\0>\0\5\0014\0\0\0007\0\t\0007\0\n\0%\1\v\0004\2\f\0%\3\15\0$\2\3\2%\3\16\0003\4\17\0>\0\5\0014\0\0\0007\0\t\0007\0\n\0%\1\v\0004\2\f\0%\3\18\0$\2\3\2%\3\19\0003\4\20\0>\0\5\0014\0\0\0007\0\t\0007\0\n\0%\1\v\0004\2\f\0%\3\21\0$\2\3\2%\3\22\0003\4\23\0>\0\5\0014\0\0\0007\0\t\0007\0\n\0%\1\v\0004\2\f\0%\3\24\0$\2\3\2%\3\25\0003\4\26\0>\0\5\0014\0\0\0007\0\t\0007\0\n\0%\1\v\0004\2\f\0%\3\27\0$\2\3\2%\3\25\0003\4\28\0>\0\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\6r\1\0\2\vsilent\2\fnoremap\2 :<C-u> CtrlPCmdPalette <CR>\6c\1\0\2\vsilent\2\fnoremap\2\30:<C-u> CtrlPFiletype <CR>\afi\1\0\2\vsilent\2\fnoremap\2\26:<C-u> CtrlPLine <CR>\6l\1\0\2\vsilent\2\fnoremap\2\28:<C-u> CtrlPBuffer <CR>\6b\1\0\2\vsilent\2\fnoremap\2\27:<C-u> CtrlPMixed <CR>\vleader\6n\20nvim_set_keymap\bapi, rg %s --files --color=never --glob \"\" \23ctrlp_user_command\1\f\0\0\btag\14buffertag\rquickfix\bdir\rrtscript\tundo\tline\fchanges\nmixed\16bookmarkdir\rfiletype\21ctrlp_extensions\22ctrlp_show_hidden\n<Nop>\14ctrlp_map\6g\bvim\0")()
-- Config for: vim-airline-themes
loadstring("\27LJ\1\2:\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\15hybridline\18airline_theme\6g\bvim\0")()
-- Config for: vim-lsp
loadstring("\27LJ\1\2ž\6\0\0\5\0 \0K4\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\0\0007\0\1\0%\1\3\0>\0\2\0014\0\0\0007\0\4\0007\0\5\0%\1\6\0%\2\a\0%\3\b\0003\4\t\0>\0\5\0014\0\0\0007\0\4\0007\0\5\0%\1\6\0%\2\n\0%\3\v\0003\4\f\0>\0\5\0014\0\0\0007\0\4\0007\0\5\0%\1\6\0%\2\r\0%\3\14\0003\4\15\0>\0\5\0014\0\0\0007\0\4\0007\0\5\0%\1\6\0%\2\16\0%\3\17\0003\4\18\0>\0\5\0014\0\0\0007\0\4\0007\0\5\0%\1\6\0004\2\19\0%\3\20\0$\2\3\2%\3\21\0003\4\22\0>\0\5\0014\0\0\0007\0\4\0007\0\5\0%\1\6\0%\2\23\0%\3\24\0003\4\25\0>\0\5\0014\0\0\0007\0\4\0007\0\5\0%\1\6\0%\2\26\0%\3\27\0003\4\28\0>\0\5\0014\0\0\0007\0\4\0007\0\5\0%\1\6\0%\2\29\0%\3\30\0003\4\31\0>\0\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\1\22<Plug>(lsp-hover)\6K\1\0\2\vsilent\2\fnoremap\1 <Plug>(lsp-next-diagnostic)\a]g\1\0\2\vsilent\2\fnoremap\1$<Plug>(lsp-previous-diagnostic)\a[g\1\0\2\vsilent\2\fnoremap\1\23<Plug>(lsp-rename)\arn\vleader\1\0\2\vsilent\2\fnoremap\1 <Plug>(lsp-type-definition)\agt\1\0\2\vsilent\2\fnoremap\1\31<Plug>(lsp-implementation)\agi\1\0\2\vsilent\2\fnoremap\1\27<Plug>(lsp-references)\agr\1\0\2\vsilent\2\fnoremap\1\27<Plug>(lsp-definition)\agd\6n\20nvim_set_keymap\bapi\30set omnifunc=lsp#complete3autocmd BufWritePre *.go LspDocumentFormatSync\bcmd\bvim\0")()
-- Config for: asyncomplete.vim
loadstring("\27LJ\1\2‘\n\0\0\5\0\26\00094\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\a\0%\3\b\0003\4\t\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\n\0%\3\v\0003\4\f\0>\0\5\0014\0\0\0007\0\r\0%\1\14\0>\0\2\0014\0\0\0007\0\r\0%\1\15\0>\0\2\0014\0\0\0007\0\r\0%\1\16\0>\0\2\0014\0\0\0007\0\17\0'\1\1\0:\1\18\0004\0\0\0007\0\17\0'\1\0\0:\1\19\0004\0\0\0007\0\17\0%\1\21\0:\1\20\0004\0\0\0007\0\17\0%\1\23\0:\1\22\0004\0\0\0007\0\17\0%\1\25\0:\1\24\0G\0\1\0\n<C-p>!UltiSnipsJumpBackwardTrigger\n<C-n> UltiSnipsJumpForwardTrigger\n<C-j>\27UltiSnipsExpandTrigger\"asyncomplete_auto_completeopt\28asyncomplete_auto_popup\6gÌ\1 call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({ 'name': 'ultisnips', 'allowlist': ['*'], 'completor': function('asyncomplete#sources#ultisnips#completor'), })) è\1 call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({ 'name': 'file', 'allowlist': ['*'], 'completor': function('asyncomplete#sources#file#completor'), 'config': { 'max_buffer_size': 5000000, }, })) ƒ\2 call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({ 'name': 'buffer', 'allowlist': ['*'], 'blocklist': ['go'], 'completor': function('asyncomplete#sources#buffer#completor'), 'config': { 'max_buffer_size': 5000000, }, })) \bcmd\1\0\2\texpr\2\fnoremap\0027pumvisible() ? asyncomplete#close_popup() : \"<CR>\"\t<CR>\1\0\2\texpr\2\fnoremap\2'pumvisible() ? \"<C-p>\" : \"<S-Tab>\"\f<S-Tab>\1\0\2\texpr\2\fnoremap\2%pumvisible() ? \"<C-n>\" : \"<Tab>\"\n<Tab>\6i\20nvim_set_keymap\bapi\bvim\0")()
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads
command! -nargs=* -range -bang -complete=file WinResizerStartResize call s:load(['winresizer'], { "cmd": "WinResizerStartResize", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType markdown ++once call s:load(['previm'], { "ft": "markdown" })
  au FileType md ++once call s:load(['previm'], { "ft": "md" })
  " Event lazy-loads
augroup END
