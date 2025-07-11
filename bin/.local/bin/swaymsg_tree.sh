#!/bin/bash

export SWAYSOCK=$(ls /run/user/1000/sway-*)
swaymsg -t get_tree
