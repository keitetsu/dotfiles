#!/usr/bin/env bash
# Installer for keitetsu's Dotfiles
# Author:     Oliver Stotzem (keitetsu)
# Repository: https://github.com/keitetsu/dotfiles
#-------------------------------------------------------------------------------
# Copyright © Oliver Stotzem (keitetsu)
# See the file LICENSE.md for copying permission.

BACKUP_DIR="${HOME}/Old dotfiles ($(date +%Y-%m-%dT%H-%M-%S))"

install_symlink() {
    local target="${HOME}/.config/keitetsu/${1}"
    local link="$2"
    if [ $3 ]; then
        link="${3}/${link}"
    else
        link="${HOME}/${link}"
    fi

    if [ -L "$link" ]; then
        rm "$link"
    elif [ -e "$link" ]; then
        mv "$link" "$BACKUP_DIR"
    fi
    echo -n " * "
    ln -brsv "$target" "$link"
}

mkdir "$BACKUP_DIR"

echo "Install dotfiles:"

install_symlink bashrc    .bashrc
install_symlink gitconfig .gitconfig
install_symlink emacs     .emacs.d
install_symlink profile   .profile

if [ -z "$(ls -A "$BACKUP_DIR")" ]; then
    rmdir "$BACKUP_DIR"
else
    echo -e "\nYou can find your old dotfiles at $BACKUP_DIR"
fi
