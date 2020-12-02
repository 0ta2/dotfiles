-- mapleader を指定
leader = ' '

-- 検索後の強調表示をの解除
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- ; : を入れ替える
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })

-- ファイル保存
vim.api.nvim_set_keymap('n', leader .. 'w', ':w<CR>', { noremap = true, silent = true })

-- H/L で ^ と $ に移動
vim.api.nvim_set_keymap('n', 'H', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', '$', { noremap = true, silent = true })

-- Y で末尾までコピー
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true, silent = true })

-- 行が折り返し表示されている場合、表示行単位で移動
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = ture })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = ture })
vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true, silent = ture })
vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true, silent = ture })

-- 画面を横に分割
vim.api.nvim_set_keymap('n', leader .. 's', ':<C-u>sp<CR>', { noremap = true, silent = ture })
vim.api.nvim_set_keymap('n', leader .. 'v', ':<C-u>vs<CR>', { noremap = true, silent = ture })

-- 縦幅に最大化
vim.api.nvim_set_keymap('n', leader .. 'o', '<C-w>_<C-w>|', { noremap = true, silent = ture })
-- 幅を揃える
vim.api.nvim_set_keymap('n', leader .. '=', '<C-w>=', { noremap = true, silent = ture })

-- Create new buffer.
vim.api.nvim_set_keymap('n', leader .. 't', ':enew<CR>', { noremap = true, silent = ture })
-- Close current buffer.
vim.api.nvim_set_keymap('n', leader .. 'q', ':bp <BAR> bd! #<CR>', { noremap = true, silent = ture })
-- Tab to switch to next open buffer.
vim.api.nvim_set_keymap('n', leader .. 'n', ':bnext<CR>', { noremap = true, silent = ture })
-- Shift + Tab to switch to previous open buffer.
vim.api.nvim_set_keymap('n', leader .. 'p', ':bprevious<CR>', { noremap = true, silent = ture })

-- x/s で削除した際にレジスタに入らないようにする
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = ture })
vim.api.nvim_set_keymap('n', 's', '"_s', { noremap = true, silent = ture })

-- vi全角英数字を半角に変換
vim.api.nvim_set_keymap('n', leader .. 'zh', 'HzjaConvert han_eisu', { noremap = true, silent = ture })
vim.api.nvim_set_keymap('v', leader .. 'zh', 'HzjaConvert han_eisu', { noremap = true, silent = ture })
