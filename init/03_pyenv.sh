#!/bin/bash

# Load utils
. $(cd $(dirname $0) && pwd)/utils

install_pyenv_python() {
  print_title "Install Python"
  print_message "Install Python..."

  if pyenv versions | grep $1 > /dev/null 2>&1; then
    print_warning "Installed Python"
  else
    print_message "Installing Python"
    pyenv install $1
    print_success "Successfully Installed"
  fi
}

create_virtualenv() {
  print_title "Create virtualenv"
  print_message "Crete virtualenv..."

  if pyenv virtualenvs | grep $1 > /dev/null 2>&1; then
    print_warning "Installed virtualenv version"
  else
    print_message "Installed virtualenv"
    pyenv virtualenv $1 py$(echo $1 | cut -d. -f 1)pyenv
    print_success "Successfully Created"
  fi
 }

main() {
  install_pyenv_python 3.9.5
  install_pyenv_python 2.7.18
  create_virtualenv 3.9.5
  create_virtualenv 2.7.18
}

main
