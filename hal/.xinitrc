#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

#feh --bg-scale ${HOME}/images/wallpapers/thereisnocloud-v2_large.png
feh --bg-scale ${HOME}/images/wallpapers/Detail-from-Hieronymus-Boschs-Garden-of-Earthly-Delights-Netherlands-c.1490-1510.jpg

# should re-do it here
setxkbmap fr bepo
setxkbmap -option caps:hyper
test -d ${HOME}/.config/xmodmap && xmodmap ${HOME}/.config/xmodmap/*.map

exec i3 -d -V > .i3_${DISPLAY}.log
