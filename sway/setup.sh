#!/bin/sh

# Theme and cursor for flatpak
# Install nececssary icon, cursor and gtk theme first
# Copy the theme, icon and cursor files to ~/.themes, ~/.icons (cursor and desktop icons), if cursor is not part of icons
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons
sudo flatpak override --env=GTK_THEME=catppuccin-mocha-pink-standard+default

sudo flatpak override --env=ICON_THEME=Papirus-Dark
sudo flatpak override --env=XCURSOR_PATH=$HOME/.icons
sudo flatpak override --env=XCURSOR_THEME=catppuccin-mocha-flamingo-cursors
