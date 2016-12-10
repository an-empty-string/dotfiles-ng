[[ $- != *i* ]] && return

## Aliases

alias ls="ls --color=auto"

## Functionality

autoload -U compinit
compinit

if ! pgrep -u $USER gpg-agent > /dev/null
then
    gpg-agent --daemon > ~/.gpgagent
fi
source ~/.gpgagent

## Variables

PS1='%F{green}%n@%m %F{blue}%3~ %F{red}%B%#%f%b '
PATH=$PATH:~/.local/bin
