# Auto login
if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
exec Hyprland
#exec sway --unsupported-gpu
# exec dbus-run-session sway --unsupported-gpu
fi

