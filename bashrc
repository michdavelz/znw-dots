# basic bash settings
set -o vi
shopt -s checkwinsize
# bash history
[[ -n ${HISTFILE} && -f ${HISTFILE} ]] || export HISTFILE=/dev/null
export HISTCONTROL='ignoredups'
export HISTSIZE=65535
shopt -u histappend
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# prompt customization (/w Gentoo Linux Nerdfont logo)
[[ -v SSH_CONNECTION ]] && sshc="[SSH]" || :
PS1='\[\e[2m\]${sshc}\[\e[m\]$(ec=${?##0};echo ${ec:+[\[\e[91;5m\]${ec}\[\e[m\]]})\[\e[1m\]\u\[\e[m\]@\h\[\e[35m\]󰣨 \[\e[m\]:\W\$ '
PS2=' '

# aliases with (likely) useless checks
[ "$(command -v grep)" ] && alias grep='grep --color=auto' || :
[ "$(command -v wget)" ] && alias wget='wget --hsts-file="${XDG_STATE_HOME:-~/.local/state/wget}/wget-hsts"' || :
[ "$(command -v mpv)" ] && alias mpv='mpv --no-audio-display' || :
[ "$(command -v eza)" ] && alias ls='eza --group-directories-first --icons --mounts --octal-permissions--no-permissions --group --smart-group' || :
[ "$(command -v dust)" ] && alias du='dust --threads 12 --limit-filesystem --force-colors' || :
[ "$(command -v duf)" ] && alias df='duf' || :
alias meminfo='cat /proc/meminfo'
