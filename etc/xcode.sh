#!/bin/bash

# Load utils
. utils

print_title "Install Xcode"

if is_exists "xcode-select"; then
  print_warning "Already installed"
else
  xcode-select --install
  print_success "Successfully installed"
fi
