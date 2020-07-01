# -*- Mode: sh -*-
# Global environment variables for all shells
# Author:     Oliver Stotzem (keitetsu)
# Repository: https://github.com/keitetsu/dotfiles
#-------------------------------------------------------------------------------
# Copyright © Oliver Stotzem (keitetsu)
# See the file LICENSE.md for copying permission.

# Add user's bin dir to the beginning of $PATH
[ -e "$HOME/.bin" ] && export PATH="$HOME/.bin:$PATH"
[ -e "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
