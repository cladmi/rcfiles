#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

HISTFILESIZE=2000
HISTSIZE=2000
# Append history instead of overwriting
shopt -s histappend

# Startx
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -- -keeptty -nolisten tcp &> ~/.xorg.log
