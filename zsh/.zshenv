#
# User configuration sourced by all invocations of the shell
#

# Define XDG_CONFIG_HOME location
export XDG_CONFIG_HOME="$HOME/.config"

# Dfine ZDOTDIR location
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
