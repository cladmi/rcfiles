# Behind the scenes, scmpuff is assigning filenames to sequential
# environment variables, e.g. $e1, $e2, so you can refer to those with other
# commands too if needed.

if command -v scmpuff >/dev/null 2>&1
then
    eval "$(scmpuff init --shell --aliases=false)"
    alias gs='scmpuff_status'
    alias ge='scmpuff exec --'
else
    alias gs='git status'
    alias ge=''
fi

alias ga='git add'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log'
