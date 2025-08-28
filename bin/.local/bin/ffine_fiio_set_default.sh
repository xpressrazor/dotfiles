#!/bin/sh
printf "\n\n ---- Before ---- \n\n"
pactl info

pactl set-default-sink alsa_output.usb-FiiO_K3-00.analog-stereo
pactl set-default-source alsa_input.usb-MV-SILICON_fifine_Microphone_20190808-00.analog-stereo

printf "\n\n ---- After ---- \n\n"
pactl info



