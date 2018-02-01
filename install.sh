#!/bin/sh
# -*- Mode: conf -*-
## Dotfiles installer
#  Author:     Oliver Stotzem
#  Repository: https://github.com/keitetsu/dotfiles
#-------------------------------------------------------------------------------
# Copyright © Oliver Stotzem
#
# See the file LICENSE.md for copying permission.

BACKUP_DIR="$HOME/DotfilesBackup_$(date +%FT%T)"
INSTALL_DIR="$HOME/.config/keitetsu"
REPOSITORY="git@github.com:keitetsu/dotfiles.git"

LOGFILE="$INSTALL_DIR/install.log"

error() {
    echo "$(date +%FT%T): $1" >> "$LOGFILE"
    exit 1
}

install_dotfile() {
    target="$INSTALL_DIR/$1"
    file="$2"
    link="$HOME/$file"
    echo -n " ** $file"
    if [ -h "$link" ]; then
        echo -n ". Lösche vorhandener Link."
        rm "$link"
        [ "$?" -ne "0" ] && error "Fehler beim Löschen des Links!"
    elif [ -f "$link" -o -d "$link" ]; then
        echo -n ". Sichere alte $file."
        mv "$link" "$BACKUP_DIR"
    fi
    ln -rs "$target" "$link"
    echo " Ok."
}

if [ ! -d "$INSTALL_DIR" ]; then
    echo " * Klone Repository nach $INSTALL_DIR"
    git clone "$REPOSITORY" "$INSTALL_DIR"
else
    echo " * Aktualisiere Dotfiles"
    cd "$INSTALL_DIR"
    git pull
fi
if [ "$?" -ne "0" ]; then
    echo " Fehler!"
    exit 1
fi

mkdir "$BACKUP_DIR"
[ "$?" -ne "0" ] && error "Fehler beim Erzeugen des Backupverzeichnisses!"

echo " * Installiere Dotfiles:"
install_dotfile "gitconfig/main" ".gitconfig"

if [ ! -d "$HOME/.user" ]; then
    " * Kopiere Beispiel-User-Konfiguration"
    cp -r "$INSTALL_DIR/user.example" "$HOME/.user"
fi

if [ "$(ls -A $BACKUP_DIR)" ]; then
    echo " * Backup der alten Dotfiles befinden sich in $BACKUP_DIR"
else
    echo " * Lösche leeres Backupverzeichnis."
    rmdir --ignore-fail-on-non-empty "$BACKUP_DIR"
fi
