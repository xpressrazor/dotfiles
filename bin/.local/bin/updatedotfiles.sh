#!/bin/sh
cd ~/dotfiles
git add .
git commit -m "$1"
git push
