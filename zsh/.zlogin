#
# Startup compiled
#
for zfile in ${ZDOTDIR:-${HOME}}/.z(shenv|profile|shrc|login|logout); do
  rm -f ${zfile}.zwc(|.old)(N)
done

#
# User configuration sourced by login shells
#

# Initialize zim
[[ -s ${ZIM_HOME}/login_init.zsh ]] && source ${ZIM_HOME}/login_init.zsh

#
# Customize
#

# typeset
#   -U 重複パスを登録しない
#   -x export も同時に行う
#   -T環境変数へ紐づけ
typeset -U path cdpath fpath manpath
