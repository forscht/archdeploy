#!/usr/bin/env bash

cd /opt || exit

sudo git clone https://aur.archlinux.org/yay-git.git

sudo chown -R "$USER:$USER" ./yay-git

cd yay-git || exit

makepkg -si

sudo yay -Syu
