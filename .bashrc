#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -la --color=auto'
LS_COLORS="di=1;4;31"
export LS_COLORS


alias please='sudo $(history -p \!\!)'
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
PS1='[\u@\h \W]\$ '
