# Uncomment 'user_allow_other' in /etc/fuse.conf
alias cladmi_mount='sshfs -o allow_other cladmi@cladmi.eu:/media/5 /media/5'

alias git_root='git rev-parse --show-toplevel'

#⎜   ↳ SynPS/2 Synaptics TouchPad              	id=13	[slave  pointer  (2)]
# 	libinput Disable While Typing Enabled (313):	1
alias touchpad_keep_typing='xinput set-prop 13 313 0'

alias bitbake='/usr/bin/nice -n 20 bitbake'
alias make='/usr/bin/nice -n 20 make'
alias kas='/usr/bin/nice -n 20 kas'
