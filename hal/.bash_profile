#
# ~/.bash_profile
#
export PATH="${HOME}/.local/bin:${PATH}"
export VDPAU_DRIVER=radeonsi

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.config/foot/vte.sh ]] && . ~/.config/foot/vte.sh

# If running from tty1 start sway
[ "$(tty)" = "/dev/tty1" ] && exec dbus-run-session sway
