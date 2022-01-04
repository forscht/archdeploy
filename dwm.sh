#!/bin/bash

# Exist script on any error
set -e

sudo timedatectl set-ntp true
sudo hwclock --systohc

# Install packages
sudo pacman -S xorg xorg-xinit firefox polkit-gnome nitrogen lxappearance thunar

# Install fonts
sudo pacman -S --noconfirm ttf-font-awesome ttf-joypixels dina-font tamsyn-font bdf-unifont ttf-bitstream-vera ttf-croscore ttf-dejavu ttf-droid gnu-free-fonts ttf-ibm-plex ttf-liberation ttf-linux-libertine noto-fonts ttf-roboto tex-gyre-fonts ttf-ubuntu-font-family ttf-anonymous-pro ttf-cascadia-code ttf-fantasque-sans-mono ttf-fira-mono ttf-hack ttf-fira-code ttf-inconsolata ttf-jetbrains-mono ttf-monofur cantarell-fonts inter-font ttf-opensans gentium-plus-font ttf-junicode noto-fonts-emoji

# Pull Git repositories and install
cd /opt

# Install DWM
git clone "https://github.com/forscht/dwm.git" dwm
cd /opt/dwm
make
sudo make clean install
cd ..

# Install st
git clone "https://github.com/forscht/st.git" st
cd /opt/st
make
sudo make clean install
cd ..

# Install slstatus
git clone "git clone https://git.suckless.org/slstatus" slstatus
cd /opt/slstatus
make
sudo make clean install
cd ..

# Install dmenu
git clone "https://git.suckless.org/dmenu" dmenu
cd /opt/dmenu
make
sudo make clean install
cd ..

printf "\e[1;32mDone! you can now reboot.\e[0m\n"
