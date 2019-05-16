# Emacs風ショートカットキー設定
# -e Emacs ライクなキーマップ
# -v vi のインサートモードライクのキーマップ
# -a vi のコマンドモードライクのキーマップ
bindkey -v

# 履歴を表示する時にカーソルは末尾
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end  #<C-p>
bindkey "^n" history-beginning-search-forward-end   #<C-n>
