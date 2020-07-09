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

# pyvenv, python -m venv
PROGRAMS+=("python3-venv")
# pyenv dependencies to compile python
PROGRAMS+=("make" "build-essential" "libssl-dev" "zlib1g-dev" "libbz2-dev")
PROGRAMS+=("libreadline-dev" "libsqlite3-dev" "wget" "curl" "llvm")
PROGRAMS+=("libncurses5-dev" "xz-utils" "tk-dev" "libxml2-dev" "libxmlsec1-dev")
PROGRAMS+=("libffi-dev" "liblzma-dev")

PROGRAMS+=("sshfs")
PROGRAMS+=("mplayer")

PROGRAMS+=("docker.io")

PROGRAMS+=("wget" "curl")

PROGRAMS+=("nmap")

PROGRAMS+=("five-or-more")

sudo apt update
sudo apt upgrade -y
sudo apt install ${PROGRAMS[*]}

sudo apt autoremove -y
