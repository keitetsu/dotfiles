# -*- Mode: sh -*-

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *)   return;;
esac

# Include user’s config, if it exists
[ -f "$HOME/.config/keitetsu/user/bashrc" ] && \
    . "$HOME/.config/keitetsu/user/bashrc"
