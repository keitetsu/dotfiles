#!/usr/bin/env bash
# Installer for keitetsu's Dotfiles
# Author:     Oliver Stotzem (keitetsu)
# Repository: https://github.com/keitetsu/dotfiles
#-------------------------------------------------------------------------------
# Copyright © Oliver Stotzem (keitetsu)
# See the file LICENSE.md for copying permission.

BACKUP_DIR="${HOME}/Old dotfiles ($(date +%Y-%m-%dT%H-%M-%S))"

backup_file() {
    [ -e "$1" ] && mv "$1" "$BACKUP_DIR"
}

install_symlink() {
    local target="${HOME}/.config/keitetsu/${1}"
    local link="$2"
    if [ $3 ]; then
        link="${3}/${link}"
    else
        link="${HOME}/${link}"
    fi

    backup_file "$link"
    echo -n " * "
    ln -brsv "$target" "$link"
}

mkdir "$BACKUP_DIR"

echo "Install dotfiles:"

# Bash
install_symlink bashrc  .bashrc
install_symlink profile .profile
backup_file .bash_login
backup_file .bash_profile

# Git
install_symlink gitconfig .gitconfig

# GNU Emacs
install_symlink emacs .emacs.d
backup_file .emacs
backup_file .emacs.el

if [ -z "$(ls -A "$BACKUP_DIR")" ]; then
    rmdir "$BACKUP_DIR"
else
    echo -e "\nYou can find your old dotfiles at $BACKUP_DIR"
fi
