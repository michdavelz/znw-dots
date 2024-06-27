# znw bash prompt config

# if for some reason $HOME isn't set, just assume its /home/$USER but set with 'whoami'
[ ${HOME} ] || export HOME="/home/$(whoami)/"

# at minimum, set the XDG_DATA_HOME variable if its not set already
[ ${XDG_DATA_HOME} ] || { mkdir -p ${HOME}/.local/share/ && export XDG_DATA_HOME=${HOME}/.local/share/; }

# set $PATH to point to ${HOME}/.local/bin first
([ -d ${HOME}/.local/bin/ ] && echo ${PATH}|grep -Fq "${HOME}/.local/bin") || { mkdir -p ${HOME}/.local/bin/; export PATH="${HOME}/.local/bin/:${PATH}"; }

# basic bash settings
set -o vi
shopt -s checkwinsize

# bash history settings
shopt -u histappend
HISTFILE="${XDG_DATA_HOME}/bash/history"
HISTSIZE=65535

# prompt customization
{ env | grep -Fq 'DISTROBOX' && PS1='[$?]\[\033[01;15m\]\u\[\033[0m\]@\h\[\033[33m\] \[\033[0m\]:\W\$ '; } || PS1='[$?]\[\033[01;15m\]\u\[\033[0m\]@\h\[\033[35m\]󰣨 \[\033[0m\]:\W\$ '

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# aliases with potentially useless checks
alias grep='grep --color=auto'
alias wget='wget --hsts-file="${XDG_DATA_HOME}/wget-hsts"'
[ $(command -v mpv) ] && alias mpv='mpv --no-audio-display'
[ $(command -v eza) ] && alias ls='eza --group-directories-first --icons --mounts --octal-permissions --no-permissions --group --smart-group'
