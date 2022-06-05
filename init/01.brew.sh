#!/bin/bash

# Load utils
# shellcheck source=/dev/null
. "$(cd "$(dirname "$0")" && pwd)"/utils

# install homebrew
install_homebrew() {
  print_title "Homebrew"
  print_message "Install homebrew..."

  if is_exists "brew"; then
    print_warning "brew already installed"
  else
    print_message "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    print_success "Successfully Installed"
  fi
}

# update homebrew
update_homebrew() {
  print_message "Update homebrew..."

  if brew update > /dev/null 2>&1; then
    print_success "Successfully updated"
  else
    print_error "Unsuccessfully update"
  fi
}

# check homebrew system
doctor_homebrew() {
  print_message "Doctor homebrew..."

  if brew doctor > /dev/null 2>&1; then
    print_success "Ready to brew"
  else
    print_error "Not ready not brew"
  fi
}

# brew bundle install from Brewfile.
install_packages() {
  print_title "Homebrew packages"
  print_message "Install packages..."

  brew bundle --file="${DOTFILES_PATH}/Brewfile"

  print_success "Successfully install package"
}

main() {
  install_homebrew
  update_homebrew
  doctor_homebrew
  install_packages
}

main
