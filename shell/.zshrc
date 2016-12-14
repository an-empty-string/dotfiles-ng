[[ $- != *i* ]] && return

## Aliases

alias ls="ls --color=auto"

## Options

setopt AUTO_CD
setopt AUTO_PUSHD

## Functionality

autoload -U compinit
compinit

pgrep -u $USER gpg-agent > /dev/null || gpg-agent --daemon > ~/.gpgagent
test -e ~/.gpgagent && test -z $SSH_AUTH_SOCK && source ~/.gpgagent

## Variables

if test -e /etc/salt/minion && grep "role: workstation" /etc/salt/minion > /dev/null; then
    promptcolor=green
else
    promptcolor=yellow
fi

PROMPT="%F{${promptcolor}}%n@%m %F{blue}%3~ %F{red}%B%#%f%b "
PATH=$PATH:~/.local/bin
EDITOR=vim

## Functions

dotenv() {
    (
        test -e .env && source .env
        eval $@
    )
}
