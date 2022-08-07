#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -lh'

alias mv='mv -i'
alias rm='rm -i'
LS_COLORS="di=1;4;31"
export LS_COLORS
export PATH=$PATH:~/Scripts

shopt -s histappend

alias fuck='sudo $(history -p \!\!)'
alias dotfiles='git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"
