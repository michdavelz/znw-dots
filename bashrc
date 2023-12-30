# znw bash prompt config
#set -o vi

# want some color?
color_prompt=yes

# keep macOS quiet about bash deprecation
#export BASH_SILENCE_DEPRECATION_WARNING=1

# bash history settings
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1024

# prompt customization
PS1='\[$?\]\[\033[01;15m\]\u\[\033[0m\]@\h:\W\$ '

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# msc color settings
#wal -R -q

# enable color support of ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#source /usr/share/doc/pkgfile/command-not-found.bash

PATH="~/.local/bin/:${PATH}"

# aliases. just aliases.
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias mpv='mpv --no-audio-display'
