BOLD="\[$(tput bold)\]"
# Reset
R="\[$(tput sgr0)\]"
BR="${R}${BOLD}"

# COLORS (some change when Bold or not)
BLACK="\[$(tput setaf 0)\]"
GREEN="\[$(tput setaf 2)\]"
BLUE="\[$(tput setaf 4)\]"
CYAN="\[$(tput setaf 6)\]"
GRAY="\[$(tput setaf 7)\]"

# VALUES
# Using Bold font by default
# So reset with BR after
USERHOST="${GREEN}\u@\h${BR}"
WORKDIR="${BLUE}\w${BR}"
TIME="${BLACK}\D{%k:%M:%S}${BR}"
RETVAL="${R}${GRAY}\$?${BR}"

# Two lines PS1, with added time and return value

PS1PRE="${BR}"
PS1PRE+="┌─[${USERHOST}]:[${WORKDIR}][${TIME}](${RETVAL})"
PS1POST="└─${R}\$ "

PS1="${PS1PRE}\n${PS1POST}"

export PS1
