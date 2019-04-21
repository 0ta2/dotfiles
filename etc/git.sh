#!/bin/bash
#
# Git の初期設定

# Load utils
. $(dirname $(greadlink -f $0))/utils

# git config
# alias の場合は、第一カラムを空にする
GIT_CONFIGS=(
  "alias,st,status"
  "alias,cm,commit"
  "alias,ch,checkout"
  "alias,br,branch"
  "alias,gr,log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'"
  "alias,gbr,git branch --merged | grep -vE '^\\*|master$' | xargs -I % git branch -d %"
  "push,default,simple"
  "fetch,prune,true"
  "core,quotepath,false"
  "core,safecrlf,true"
  "core,autocrlf,false"
  "color,ui,auto"
  "credential,helper,wincred"
)

# Set an alias in an associative array.
git_add_config() {
  print_title "Git setting"

  for git_config in "${GIT_CONFIGS[@]}"
  do
    git_type=$(echo ${git_config} | cut -d "," -f 1)
    git_item=$(echo ${git_config} | cut -d "," -f 2)
    git_value=$(echo ${git_config} | cut -d "," -f 3)

    git config ${git_type}.${git_item} > /dev/null 2>&1

    if [ $? == 0 ]; then
      print_warning "${git_type}.${git_item}: Already exists"
    else
      git config --global ${git_type}.${git_item} ${git_value}
      print_success ${git_type}.${git_item}: Successfully Git config
    fi
  done
}

main() {
  git_add_config
}

main
