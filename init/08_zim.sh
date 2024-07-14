#!/bin/bash

# Load utils
# shellcheck source=/dev/null
. "$(cd "$(dirname "$0")" && pwd)"/utils

install_zimfw() {
  print_title "Install zimfw"
  print_message "Install zimfw..."
}

main() {
  source "${DOTFILES_PATH}"/zsh/.zim/zimfw.zsh install
}
