#!/bin/bash

# Load utils
# shellcheck source=init/utils
. "$(cd $(dirname $0) && pwd)"/utils

print_title "Install Xcode"

if is_exists "xcode-select"; then
  print_warning "Already installed"
else
  sudo xcode-select --install
  sudo xcodebuild -license accept
  print_success "Successfully installed"
fi
