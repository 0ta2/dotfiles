# Emacs風ショートカットキー設定
bindkey -e

# 行頭に移動
bindkey "^[[1~" beginning-of-line 

# 末行に移動
bindkey "^[[4~" end-of-line 

# delectキーカーソル上の文字を削除
bindkey "^[[3~" delete-char

# 履歴を表示する時にカーソルは末尾
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end #<C-p>
bindkey "^n" history-beginning-search-forward-end #<C-n>

# shift-tabで補完候補を逆戻りする
bindkey "\e[Z" reverse-menu-complete
