## Uninstalls all flatpak apps (deletes data)
## Uninstalls all packages installed, except important packages (need to put packages that are system required vs users)
## Try to limit packages that are installed by yay or pacman

cat ./myflatpakpackages.txt | xargs flatpak --system -y uninstall --delete-data
sudo pacman -Rns $(pacman -Qdtq)
