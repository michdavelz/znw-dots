# znw bash prompt config

# basic bash settings
set -o vi
shopt -s checkwinsize
color_prompt=yes

# bash history settings
shopt -u histappend
[ -d ~/.local/share/bash/ ] || mkdir -p ~/.local/share/bash/ && HISTFILE="~/.local/share/bash/history"
HISTSIZE=-1
HISTFILESIZE=-1

# prompt customization
PS1='[$?]\[\033[01;15m\]\u\[\033[0m\]@\h:\W\$ '

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

[ -d ~/.local/bin/ ] || mkdir -p ~/.local/bin/ && PATH="~/.local/bin/:${PATH}"

# aliases. just aliases.
alias grep='grep --color=auto'
[ -d ~/.local/share/ ] || mkdir -p ~/.local/share/ && alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias mpv='mpv --no-audio-display'
#alias ls='eza --group-directories-first --icons --mounts --octal-permissions --no-permissions --group --smart-group'
