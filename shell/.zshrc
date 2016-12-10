[[ $- != *i* ]] && return

## Aliases

alias ls="ls --color=auto"

## Functionality

autoload -U compinit
compinit

pgrep -u $USER gpg-agent > /dev/null || gpg-agent --daemon > ~/.gpgagent
test -e ~/.gpgagent && source ~/.gpgagent

## Variables

PS1='%F{green}%n@%m %F{blue}%3~ %F{red}%B%#%f%b '
PATH=$PATH:~/.local/bin
