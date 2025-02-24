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

alias vim='nvim'
alias vi='nvim'
alias open='xdg-open'
alias ncfg='cd ~/.config/nvim/ && nvim init.lua'
alias nsoln='cd ~/Programming/ && nvim'
alias nhypr='cd ~/.config/hypr && nvim hyprland.conf'
alias r='ranger'
