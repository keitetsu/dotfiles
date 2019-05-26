# -*- Mode: sh -*-

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
fi

# Include user’s config, if it exists
[ -f "$HOME/.dotfiles/keitetsu/user/profile" ] && \
    . "$HOME/.dotfiles/keitetsu/user/profile"
