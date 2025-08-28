# Auto login
if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
#exec sway --unsupported-gpu
#exec Hyprland
    #exec dbus-run-session sway --unsupported-gpu
fi

