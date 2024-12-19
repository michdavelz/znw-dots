# set the XDG_DATA_HOME variable to its default location if its not set already
[ "${XDG_DATA_HOME}" ] || { mkdir -p "${HOME}"/.local/share/ && export XDG_DATA_HOME="${HOME}"/.local/share/; }
# set $PATH to point to ${HOME}/.local/bin first
([ -d "${HOME}"/.local/bin/ ] && echo "${PATH}"|grep -Fq "${HOME}/.local/bin") || { mkdir -p "${HOME}"/.local/bin/; export PATH="${HOME}/.local/bin/:${PATH}"; }
# basic bash settings
set -o vi
shopt -s checkwinsize
shopt -u histappend
HISTFILE="${XDG_DATA_HOME}/bash/history"
HISTSIZE=65535
# prompt customization
PS1='$(ec=${?##0};echo ${ec:+[\[\033[91;05m\]${ec}\[\033[0m\]]})\[\033[0;1m\]\u\[\033[0m\]@\h\[\033[35m\]󰣨 \[\033[0m\]:\W\$ '
PS2=' '
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
# aliases with potentially useless checks
alias grep='grep --color=auto'
alias wget='wget --hsts-file="${XDG_DATA_HOME}/wget-hsts"'
alias mpv='mpv --no-audio-display'
alias ls='eza --group-directories-first --icons --mounts --octal-permissions --no-permissions --group --smart-group'
