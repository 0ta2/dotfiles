#!/bin/bash

# Load utils
. $(cd $(dirname $0) && pwd)/utils

install_rbenv_ruby(){
  print_title "Install ruby"
  print_message "Install ruby..."

  if rbenv versions | grep $1 > /dev/null 2>&1; then
    print_warning "Installed ruby"
  else
    print_message "Installing ruby"
    rbenv install $1
    print_success "Successfully Installed"
  fi
}

global_rbenv() {
  print_title "Set Global Rbenv"
  print_message "Set Global Rbenv..."

  rbenv global $1
  print_success "Successfully Setting"
}

main() {
  install_rbenv_ruby 2.7.1
  global_rbenv 2.7.1
}

main
