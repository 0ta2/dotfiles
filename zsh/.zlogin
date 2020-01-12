#
# User configuration sourced by login shells
#

# Initialize Zim
source ${ZIM_HOME}/login_init.zsh -q &!

#
# Customize
#

# typeset
#   -U 重複パスを登録しない
#   -x export も同時に行う
#   -T環境変数へ紐づけ
typeset -U path cdpath fpath manpath
