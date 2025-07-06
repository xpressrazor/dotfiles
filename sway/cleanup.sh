## Uninstalls all flatpak apps (deletes data)
## Uninstalls all packages installed, except important packages (need to put packages that are system required vs users)
## Try to limit packages that are installed by yay or pacman

cat ./myflatpakpackages.txt | xargs flatpak --system -y uninstall --delete-data
sudo pacman -Rns $(pacman -Qdtq)

#First, for all the packages "explicitly installed", change their installation reason to "installed as a dependency":

# pacman -D --asdeps $(pacman -Qqe)

#Then, change the installation reason to "explicitly installed" of only the essential packages, those you do not want to remove, in order to avoid targeting them:


# pacman -D --asexplicit base linux linux-firmware

pacman -D --asdeps $(pacman -Qqe)
pacman -D --asexplicit base linux linux-headers linux-firmware alsa-firmware alsa-utils autotiling-git blueman brightnessctl cliphist comicthumb envycontrol ffmpegthumbnailer flatpak fprintd git gparted grim gvfs kitty-git kwallet-pam lib32-pipewire lib32-vulkan-intel neovim mpv networkmanager networkmanager-applet ntfs-3g nvidia-open nvidia-prime nvidia-settings nwg-look plocate stow sway swayinteractive-screenshot swaybg swayidle swaync tlp  ttf-0xproto-nerd ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols-mono ttf-roboto-mono tumbler tumbler-extra-thumbnailers ufw unarchiver vkd3d vulkan-intel vulkan-mesa-layers vulkan-tools waybar waypaper wget wlsunset wofi xdg-desktop-portal-wlr xorg-xhost xorg-xwayland

