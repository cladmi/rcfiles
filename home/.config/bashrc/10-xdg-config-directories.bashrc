# Workaround applications not using XDG base directories.
# https://wiki.archlinux.org/title/XDG_Base_Directory

export HISTFILE="$XDG_STATE_HOME"/bash/history

export CARGO_HOME="$XDG_DATA_HOME"/cargo

export GOPATH="$XDG_DATA_HOME"/go
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod

export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

export PYTHON_HISTORY=$XDG_STATE_HOME/python/history
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export PYTHONUSERBASE=$XDG_DATA_HOME/python
