#!/bin/bash

# Load utils
. $(cd $(dirname $0) && pwd)/util

install_zimfw() {
  print_title "Install zimfw"
  print_message "Install zimfw..."
}

main() {
  source ${DOTFILES_PATH}/zsh/.zim/zimfw.zsh install
}
