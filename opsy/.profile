# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "${HOME}/.gem/ruby/2.7.0/bin" ] ; then
    PATH="${HOME}/.gem/ruby/2.7.0/bin:$PATH"
fi
export GOPATH="${HOME}"/go
export GO111MODULE=auto

# Local configurations
export COQOS_LICENSE_FILE=${HOME}/.local/share/coqos/coqos.lic

test -n "${DISPLAY}" && /usr/bin/numlockx on
test -n "${DISPLAY}" && test -d ${HOME}/.config/xmodmap && ( xmodmap ${HOME}/.config/xmodmap/*.map & ) 2>/dev/null
. "${HOME}/.cargo/env"
