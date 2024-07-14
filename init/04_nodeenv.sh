#!/bin/bash

# Load utils
# shellcheck source=/dev/null
. "$(cd "$(dirname "$0")" && pwd)"/utils

install_nodenv_nodejs(){
  print_title "Install nodejs"
  print_message "Install nodejs..."

  if nodenv versions | grep "$1" > /dev/null 2>&1; then
    print_warning "Installed nodejs"
  else
    print_message "Installing nodejs"
    nodenv install "$1"
    print_success "Successfully Installed"
  fi
}

global_nodenv() {
  print_title "Set Global nodenv"
  print_message "Set Global nodenv..."

  nodenv global "$1"
  print_success "Successfully Setting"
}

main() {
  install_nodenv_nodejs 22.4.1
  global_nodenv 22.4.1
}

main
