#!/bin/sh
sway --unsupported-gpu

# Auto login
#if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && #[ "$XDG_VTNR" -eq 1 ] ; then
#    exec sway --unsupported-gpu
#fi

