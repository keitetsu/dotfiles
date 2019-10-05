# -*- Mode: sh -*-
# bash configuration for non-login shells
# Author:     Oliver Stotzem (keitetsu)
# Repository: https://github.com/keitetsu/dotfiles
#-------------------------------------------------------------------------------
# Copyright © Oliver Stotzem (keitetsu)
# See the file LICENSE.md for copying permission.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *)   return;;
esac

# Add user's bin dir to the beginning of $PATH
[ -e "$HOME/.bin" ] && export PATH="$HOME/.bin:$PATH"
[ -e "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

#===============================================================================
#=========================[ ::: HISTORY CONTROL ::: ]===========================
#===============================================================================

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Set the maximum of commands (1000) and maximum number of lines (2000)
HISTSIZE=1000
HISTFILESIZE=2000

#===============================================================================
#===========================[ ::: USER CONFIG ::: ]=============================
#===============================================================================

# Include user’s config, if it exists
[ -f "$HOME/.config/keitetsu/user/bashrc" ] && \
    . "$HOME/.config/keitetsu/user/bashrc"
