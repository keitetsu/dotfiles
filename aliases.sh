# -*- Mode: sh -*-
# bash configuration for non-login shells
# Author:     Oliver Stotzem (keitetsu)
# Repository: https://github.com/keitetsu/dotfiles
#-------------------------------------------------------------------------------
# Copyright © Oliver Stotzem (keitetsu)
# See the file LICENSE.md for copying permission.

#===============================================================================
#==========================[ ::: COLOR SUPPORT ::: ]============================
#===============================================================================
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'

#===============================================================================
#============================[ ::: LS ALIASES ::: ]=============================
#===============================================================================
alias l='ls -CF'
alias ll='ls -Fhl'
alias l1='l -1'
alias la='l -A'
alias lr='l -R'
alias l1a='l1 -A'
alias l1r='l1 -R'
alias lla='ll -A'
alias llr='ll -R'
alias llar='lla -R'
