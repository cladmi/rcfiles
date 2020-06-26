#! /usr/bin/env bash
PROGRAMS=()
PROGRAMS+=("stow")
PROGRAMS+=("git" "git-lfs")
PROGRAMS+=("vim-gtk3" "tmux")
PROGRAMS+=("locate")

PROGRAMS+=("ssh-askpass" "gnupg-agent" "gnupg2")
PROGRAMS+=("i3")

PROGRAMS+=("firefox" "xul-ext-ublock-origin" "flashplugin-installer")
PROGRAMS+=("python3-dev" "python3-pip")

PROGRAMS+=("sshfs")
PROGRAMS+=("mplayer")

sudo apt install ${PROGRAMS[*]}
