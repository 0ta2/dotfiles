local opts = { noremap = true, silent = true }
local api = vim.api

-- mapleader を指定
_G.leader = ' '

-- 検索後の強調表示をの解除
api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', opts)

-- ; : を入れ替える
api.nvim_set_keymap('n', ';', ':', {})

-- ファイル保存
api.nvim_set_keymap('n', leader .. 'w', ':w<CR>', opts)

-- H/L で ^ と $ に移動
api.nvim_set_keymap('n', 'H', '^', opts)
api.nvim_set_keymap('v', 'H', '^', opts)
api.nvim_set_keymap('n', 'L', '$', opts)
api.nvim_set_keymap('v', 'L', '$', opts)

-- Y で末尾までコピー
api.nvim_set_keymap('n', 'Y', 'y$', opts)

-- 行が折り返し表示されている場合、表示行単位で移動
api.nvim_set_keymap('n', 'j', 'gj', opts)
api.nvim_set_keymap('n', 'k', 'gk', opts)
api.nvim_set_keymap('v', 'j', 'gj', opts)
api.nvim_set_keymap('v', 'k', 'gk', opts)

-- 画面を横に分割
api.nvim_set_keymap('n', leader .. 's', ':<C-u>sp<CR>', opts)
api.nvim_set_keymap('n', leader .. 'v', ':<C-u>vs<CR>', opts)

-- 縦幅に最大化
api.nvim_set_keymap('n', leader .. 'o', '<C-w>_<C-w>|', opts)
-- 幅を揃える
api.nvim_set_keymap('n', leader .. '=', '<C-w>=', opts)

-- Create new buffer.
api.nvim_set_keymap('n', leader .. 't', ':enew<CR>', opts)
-- Close current buffer.
api.nvim_set_keymap('n', leader .. 'q', ':bp <BAR> bd! #<CR>', opts)
-- Tab to switch to next open buffer.
api.nvim_set_keymap('n', leader .. 'n', ':bnext<CR>', opts)
-- Shift + Tab to switch to previous open buffer.
api.nvim_set_keymap('n', leader .. 'p', ':bprevious<CR>', opts)

-- x/s で削除した際にレジスタに入らないようにする
api.nvim_set_keymap('n', 'x', '"_x', opts)
api.nvim_set_keymap('n', 's', '"_s', opts)

-- vi全角英数字を半角に変換
api.nvim_set_keymap('n', leader .. 'zh', 'HzjaConvert han_eisu', opts)
api.nvim_set_keymap('v', leader .. 'zh', 'HzjaConvert han_eisu', opts)
