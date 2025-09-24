# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=30000
SAVEHIST=30000
HISTFORMAT="[%F %T] "
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dell/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

#export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
#export XDG_SESSION_DESKTOP=sway
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export GTK_IM_MODULE=wayland
export QT_IM_MODULE=wayland
export XMODIFIERS="@im=wayland"



export PATH=$PATH:~/.local/bin:~/.tmuxifier/bin
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/dell/.local/share/flatpak/exports/share

alias vim='nvim'
alias vi='nvim'
alias open='xdg-open'
alias ncfg='cd ~/.config/nvim/ && nvim init.lua'
alias nsoln='cd ~/Programming/ && nvim'
alias nhypr='cd ~/.config/hypr && nvim hyprland.conf'
alias nsway='cd ~/.config/sway && nvim config'
alias nwaybar='cd ~/.config/waybar && nvim config'
alias r='ranger'
alias nc='ncmpcpp'
alias note='nvim ~/Sync/mynotes/note/note.md'
alias todo='nvim ~/Sync/mynotes/note/todo.md'
alias t='tmux'
alias n='nnn'
alias swaytree='swaymsg -t get_tree'
alias read_rust='w3m "/home/dell/Documents/Study/Languages/rust programming language/index.html"'
alias editzsh='nvim ~/.zshrc'
alias updatezsh='source ~/.zshrc'
alias dotfiles='cd ~/dotfiles && git status'
alias bin='cd ~/bin'

## Flatpak
alias nomacs='flatpak run org.nomacs.ImageLounge'

PROMPT='󰘧 '

# Auto login
#if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
#    exec sway --unsupported-gpu
#fi


# study stream aliases
# Requires https://github.com/caarlos0/timer to be installed. spd-say should ship with your distro
#
# yay -S timer-bin speech-dispatcher lolcat
# For voice Install Pied from here https://github.com/Elleo/pied?tab=readme-ov-file, after initial setup, download and set up voice from the GUI

declare -A pomo_options
pomo_options["work"]="45"
pomo_options["break"]="10"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  spd-say "'$val' session done"
  fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"

export QT_QPA_PLATFORM="wayland;xcb"
export QT_QPA_PLATFORMTHEME="qt6ct"
export XCURSOR_PATH=/usr/share/icons:~/.icons

export WLR_RENDERER="vulkan"
export WLR_NO_HARDWARE_CURSORS="1"
export XWAYLAND_NO_GLAMOR="1"



if [ "$TMUX" = "" ]; then tmux; fi

# Enable for sway
#export SWAYSOCK=$(ls /run/user/1000/sway-*)

export PATH=$PATH:/home/dell/Applications/kafka_2.13-4.0.0/bin/:~/Sync/bin
