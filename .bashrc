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

shopt -s histappend

GTK_THEME=Nordic:dark

export VISUAL="/usr/bin/nvim"
export EDITOR="/usr/bin/nvim"
export STATUSBAR=polybar

alias fuck='sudo $(history -p \!\!)'
alias whysomuchspace='sudo du -h --max-depth=1 | sort -h'
alias dotfiles='git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'
alias fixbrightness='sudoedit /sys/class/backlight/amdgpu_bl0/brightness'

[[ -f ~/.bashprompt ]] && . ~/.bashprompt

#PS1="$(cat $HOME/.bashprompt)"

. "$HOME/.cargo/env"
. "$HOME/.githubtoken"
export PATH="$PATH:/home/mat/Scripts"
