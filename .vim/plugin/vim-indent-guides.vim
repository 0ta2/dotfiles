" 入力モードで開始する
let g:unite_enable_start_insert = 1
"
" 自動カラー無効
let g:indent_guides_auto_colors=0

" 奇数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black

" 偶数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray

" ガイドの幅
let g:indent_guides_guide_size = 1
