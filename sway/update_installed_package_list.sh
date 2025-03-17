#!/bin/sh

FILE=mypackages.txt

## Don't run this on new system, if you want to migrate
pacman -Qqe > $FILE

# Remove yay and yay-debug
grep -v "yay*" $FILE > tmpfile && mv tmpfile $FILE
