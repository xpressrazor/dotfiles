#!/bin/sh

## Install packages

### Install git before this with pacman -S git and get this repo with git pull https://github.com/xpressrazor/dotfiles ~/dotfiles

sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm flatpak zsh base-devel stow otf-font-awesome

# Switch to zsh if not zsh
if [[ $SHELL != *"zsh"* ]]; then
  chsh -s /bin/zsh
fi


# Install yay
# Don't uncomment here, messes up environment
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Settings for yay so that it does not ask for confirmation
yay --save --answerclean All --answerdiff All
yay --save --nocleanmenu --nodiffmenu

## Packages generated with pacman -Qqe > mypackages.txt
## Remove yay and yay-debug
cat ./mypackages.txt | xargs yay -S --needed --noconfirm

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
flatpak override --user --filesystem=xdg-config/gtk-4.0
sudo flatpak override --filesystem=xdg-config/gtk-4.0

sudo flatpak override --env=ICON_THEME=Papirus-Dark
sudo flatpak override --env=XCURSOR_PATH=$HOME/.icons
sudo flatpak override --env=XCURSOR_THEME=catppuccin-mocha-flamingo-cursors

cd ~/dotfiles
stow kitty neovim swaylock waybar okular sway tmux wofi pipewire bin zoom

if [ ! -d ~/bin ]; then
  ln -s ~/.local/bin ~/bin
fi

# Clean up the scripts copied from sway to home folder
cd ~
rm mypackages.txt setup.sh start_sway.sh update_installed_package_list.sh

# Flatpak

cat ./myflatpakpackages.txt| xargs flatpak --system -y --noninteractive install

echo "\n\nInstallation done\n\n. Now logout and look how to start sway. If everything looks good, you can add the startup from zsh, otherwise use login manager like ly. \n\nDepending on the system, you may need to start sway with --unsupported-gpu"
