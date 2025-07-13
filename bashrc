# basic bash settings
set -o vi
shopt -s checkwinsize
shopt -u histappend
HISTFILE="${XDG_DATA_HOME:-~/.local/share}/bash/history"
HISTSIZE=65535
# prompt customization
PS1='$(ec=${?##0};echo ${ec:+[\[\033[91;05m\]${ec}\[\033[0m\]]})\[\033[0;1m\]\u\[\033[0m\]@\h\[\033[35m\]󰣨 \[\033[0m\]:\W\$ '
PS2=' '
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
# aliases with potentially useless checks
[ "$(command -v grep)" ] && alias grep='grep --color=auto' || :
[ "$(command -v wget)" ] && alias wget='wget --hsts-file="${XDG_DATA_HOME}/wget-hsts"' || :
[ "$(command -v mpv)" ] && alias mpv='mpv --no-audio-display' || :
[ "$(command -v eza)" ] && alias ls='eza --group-directories-first --icons --mounts --octal-permissions --no-permissions --group --smart-group' || :
[ "$(command -v bat)" ] && alias cat='bat --plain' || :
[ "$(command -v dust)" ] && alias du='dust --limit-filesystem --force-colors' || :
[ "$(command -v duf)" ] && alias df='duf' || :
