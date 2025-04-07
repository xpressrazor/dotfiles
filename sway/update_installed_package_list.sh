#!/bin/sh

FILE=mypackages.txt
FLATPAKFILE=myflatpakpackages.txt

## Don't run this on new system, if you want to migrate
pacman -Qqe > $FILE

# Remove yay and yay-debug
grep -v "yay*" $FILE > tmpfile && mv tmpfile $FILE

# Flatpak
flatpak list --app --columns=application | uniq > $FLATPAKFILE

# Remove 3rd party flatpak
grep -v "com.mikeasoft.pied" $FLATPAKFILE > tmpfile && mv tmpfile $FLATPAKFILE
grep -v "org.gnome.GTG" $FLATPAKFILE > tmpfile && mv tmpfile $FLATPAKFILE
grep -v "org.gnome.Builder" $FLATPAKFILE > tmpfile && mv tmpfile $FLATPAKFILE

