# dotfiles
My dotfiles

# Install necessary packages
```bash
sudo pacman -S --needed git base-devel
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```



# Get this repository and setup sway

```bash
git clone https://github.com/xpressrazor/dotfiles.git ~/dotfiles
cd ~/dotfiles/sway/
chmod +x ./setup.sh
./setup.sh
```

# Flatpak apps cursor not showing properly
`systemctl --user edit xdg-desktop-portal.service`

# Add following lines (towards the top)
```bash
[Service]
Environment="XDG_CURRENT_DESKTOP=sway"
```

- Then run following command to restart the desktop-portal

`systemctl --user restart xdg-desktop-portal.service`

- To enable a login manager (e.g. ly). If not, you can use .zshprofile and uncomment the auto login section. However, I prefer a login manager. If you need to enable custom sway parameters, you can add it to /usr/share/wayland-sessions/sway.desktop file.

E.g.
`Exec=sway --unsupported-gpu`

```bash
 pacman -S ly
 sudo systemctl enable ly
```

# For nvidia
Use one of the followings (switch to a different one from which is currently active, use envycontrol -q to query current mode) to generate necessary config files 
```
envycontrol -s integrated
envycontrol -s nvidia
envycontrol -s hybrid
```

