#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR=vim
export TERMINAL=gnome-terminal

export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/.bin:${PATH}"
export PATH="${HOME}/.gem/ruby/2.3.0/bin:${PATH}"

# open new window in same directory
. /etc/profile.d/vte.sh

test -f ${HOME}/.bash_aliases && source $_

alias grep="grep --color=auto"

if [ -f ${HOME}/.config/bashrc/bashrc ]; then
  . ${HOME}/.config/bashrc/bashrc
fi
