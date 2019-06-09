" vim-submode.vim 設定
call submode#enter_with('bufmove', 'n', '', '<leader>>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', '<leader><', '<C-w><')
call submode#enter_with('bufmove', 'n', '', '<leader>+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', '<leader>-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
