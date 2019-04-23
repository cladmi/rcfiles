# Add an 'nsgit' alias for using git without signing

alias nsgit='git -c commit.gpgsign=false'
complete -o default -o nospace -F _git nsgit
