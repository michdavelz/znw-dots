# znw bash prompt config

# basic bash settings
set -o vi
shopt -s checkwinsize
color_prompt=yes

# bash history settings
shopt -u histappend
[[ $XDG_DATA_HOME ]] && HISTFILE="${XDG_DATA_HOME}/bash/history" || mkdir -p ~/.local/share/bash/ && HISTFILE="~/.local/share/bash/history"
HISTSIZE=-1
HISTFILESIZE=-1

# prompt customization
env | grep -Fq 'DISTROBOX' && PS1='[$?]\[\033[01;15m\]\u\[\033[0m\]@\h\[\033[33m\] \[\033[0m\]:\W\$ ' || PS1='[$?]\[\033[01;15m\]\u\[\033[0m\]@\h\[\033[35m\]󰣨 \[\033[0m\]:\W\$ '

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

[ -d ~/.local/bin/ ] || mkdir -p ~/.local/bin/ && PATH="~/.local/bin/:${PATH}"

# aliases. just aliases.
alias grep='grep --color=auto'
[[ $XDG_DATA_HOME ]] && alias wget='wget --hsts-file="${XDG_DATA_HOME}/wget-hsts"' || mkdir -p ~/.local/share/ && alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias mpv='mpv --no-audio-display'
alias ls='eza --group-directories-first --icons --mounts --octal-permissions --no-permissions --group --smart-group'
