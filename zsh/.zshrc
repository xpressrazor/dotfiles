# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dell/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export PATH=$PATH:~/.local/bin:~/.tmuxifier/bin
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/dell/.local/share/flatpak/exports/share

alias vim='nvim'
alias vi='nvim'
alias open='xdg-open'
alias ncfg='cd ~/.config/nvim/ && nvim init.lua'
alias nsoln='cd ~/Programming/ && nvim'
alias nhypr='cd ~/.config/hypr && nvim hyprland.conf'
alias r='ranger'
alias nc='ncmpcpp'
alias nnotes='cd ~/Sync/mynotes/ && nvim'

PROMPT='󰘧 '


# study stream aliases
# Requires https://github.com/caarlos0/timer to be installed. spd-say should ship with your distro
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
