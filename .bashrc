#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -lh'

# dircolors
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

alias mv='mv -i'
alias rm='rm -i'

shopt -s histappend

GTK_THEME=Nordic:dark

export VISUAL="/usr/bin/vim"
export EDITOR="/usr/bin/vim"

alias fuck='sudo $(history -p \!\!)'
alias whysomuchspace='sudo du -h --max-depth=1 | sort -h'
alias dotfiles='git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'

PS1='\[\033[01;34m\][\u@\h \W]\$\[\033[00;00m\] '
. "$HOME/.cargo/env"
export PATH=$PATH:/home/mat/Scripts
