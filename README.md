# dotfiles
My dotfiles

# Install necessary packages
```bash
sudo pacman -S --needed git base-devel zsh
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

Also remember to configure gtk-3.0 and gtk-4.0 configuration
~/.config/gtk3.0/settings.ini (parts)
```sh
gtk-theme-name=catppuccin-mocha-pink-standard+default
gtk-icon-theme-name=Papirus-Dark
gtk-font-name=Noto Sans,  10
gtk-cursor-theme-name=catppuccin-mocha-flamingo-cursors
gtk-cursor-theme-size=24
```

~/.config/gtk-4.0/settings.ini (parts)
```sh
gtk-application-prefer-dark-theme=true
gtk-cursor-theme-name=catppuccin-mocha-flamingo-cursors
gtk-cursor-theme-size=24
gtk-theme-name=catppuccin-mocha-flamingo-standard+default
gtk-icon-theme-name=Papirus-Dark
```

- Then run following command to restart the desktop-portal

`systemctl --user restart xdg-desktop-portal.service`

- To enable a login manager (e.g. ly). If not, you can use .zshprofile and uncomment the auto login section. However, I prefer a login manager. If you need to enable custom sway parameters, you can add it to /usr/share/wayland-sessions/sway.desktop file.

E.g.
`Exec=sway --unsupported-gpu`

```bash
 pacman -S ly
 sudo systemctl start ly
```

If above works then you can enable permanently, otherwise reboot and use the start_sway.sh script in ~/dotfiles/sway/ directory.
```bash
sudo systemctl enable ly
```

# For nvidia
Use one of the followings (switch to a different one from which is currently active, use envycontrol -q to query current mode) to generate necessary config files 
```
envycontrol -s integrated
envycontrol -s nvidia
envycontrol -s hybrid
```

If you want to replicate all the packages of current system. Go to sway directory and run the update_installed_package_list script. That script will update packages from current setup in the text file. I have added code to remove yay and yay-debug from the list of packages. You can modify this file to not include some of the packages from current system too.

# Pipewire: Sound does not automatically switch when connecting a new device
To automatically switch to newly connected devices, create this file:
```bash
/etc/pipewire/pipewire-pulse.conf.d/switch-on-connect.conf (or ~/.config/pipewire/pipewire-pulse.conf.d/switch-on-connect.conf)
pulse.cmd = [
    { cmd = "load-module" args = "module-switch-on-connect" }
]
```
Then restart the `pipewire-pulse.service` with systemctl --user and check that module-switch-on-connect is loaded.


