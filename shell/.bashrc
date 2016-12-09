[[ $- != *i* ]] && return

alias ls="ls --color=auto"
PS1='[\u@\h \W]\$ '

PATH=$PATH:$HOME/.local/bin
