#!/bin/sh

## Install packages

sudo pacman -Syu
sudo pacman -S --needed flatpak
yay --save --answerclean All --answerdiff All
yay --save --nocleanmenu --nodiffmenu
## Packages generated with pacman -Qqe > mypackages.txt
## Remove yay and yay-debug
cat ./mypackages.txt | xargs yay -S --needed --noconfirm

chsh -s /bin/zsh

# Theme and cursor for flatpak
# Install nececssary icon, cursor and gtk theme first
# Copy the theme, icon and cursor files to ~/.themes, ~/.icons (cursor and desktop icons), if cursor is not part of icons

mkdir -p ~/.icons 
mkdir -p ~/.themes
cp -r /usr/share/icons/catppuccin-mocha-flamingo-cursors ~/.icons
cp -r /usr/share/icons/Papirus-Dark ~/.icons
cp -r /usr/share/themes/catppuccin-mocha-pink-standard+default ~/.themes
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons
sudo flatpak override --env=GTK_THEME=catppuccin-mocha-pink-standard+default

sudo flatpak override --env=ICON_THEME=Papirus-Dark
sudo flatpak override --env=XCURSOR_PATH=$HOME/.icons
sudo flatpak override --env=XCURSOR_THEME=catppuccin-mocha-flamingo-cursors

cd ~/dotfiles
stow kitty nvim swaylock waybar okular sway tmux wofi pipewire

# Clean up the scripts copied from sway to home folder
cd ~
rm mypackages.txt setup.sh start_sway.sh update_installed_package_list.sh
