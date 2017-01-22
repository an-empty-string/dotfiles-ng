[[ $- != *i* ]] && return

## Aliases

alias ls="ls --color=auto"

## Options

setopt AUTO_CD
setopt AUTO_PUSHD

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

## Variables

if test -z $SSH_CONNECTION; then promptcolor=green; else; promptcolor=yellow; fi
eval $(dircolors ~/.dircolors)

rightsep=""

PROMPT="%F{${promptcolor}}%n@%m %F{blue}%3~ %F{red}%B%#%f%b "
PATH=$PATH:~/.local/bin:~/perl5/bin
export EDITOR=vim

export PERL5LIB="/home/fwilson/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="/home/fwilson/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"/home/fwilson/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/fwilson/perl5"

## Functions

function dotenv {
    (
        test -e .env && source .env
        eval $@
    )
}

function rprompt-start {
    rpromptpartn=0
    RPROMPT=""
}

function rprompt-part {
    oldc=$rpromptc
    rpromptc=$1
    data=$2

    part="%K{${rpromptc}} ${data} %k"
    if [ $rpromptpartn -gt 0 ]; then
        part="${part}%K{${rpromptc}}%F{${oldc}}${rightsep}%f%k"
    fi
    RPROMPT="${part}${RPROMPT}"
    rpromptpartn=$(( $rpromptpartn + 1 ))
}

function rprompt-done {
    RPROMPT="%F{${rpromptc}}${rightsep}%f${RPROMPT}"
}

function set-rprompt {
    case $KEYMAP in
        vicmd) vimode="NORMAL"; vicolor="green";;
        *) vimode="INSERT"; vicolor="blue";;
    esac

    rprompt-start
    rprompt-part $vicolor "%F{white}%B$vimode%b%f"
    if [ -e /sys/class/power_supply/BAT0 ]; then
        rprompt-part 6 $(battery.py prompt)
    fi
    rprompt-done

    #RPROMPT="%F{8}${rightsep}%f%K{8} %B$(battery.py prompt)%b %F{${vicolor}}${rightsep}%f%k%K{${vicolor}}%B %F{white}${vimode}%f %b%k"
}
set-rprompt

function zle-line-init zle-keymap-select rprompt {
    set-rprompt
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

## Functionality

autoload -U compinit
compinit

pgrep -u $USER gpg-agent > /dev/null || gpg-agent --daemon > ~/.gpgagent
test -e ~/.gpgagent && test -z $SSH_AUTH_SOCK && source ~/.gpgagent

source /usr/share/autojump/autojump.zsh

bindkey -v

