alias cladmi_mount='sshfs cladmi.eu:/media/5 /media/5'

alias git_root='git rev-parse --show-toplevel'
alias __git_dir='git rev-parse --git-dir'
alias __git_env='printf "$(__git_dir)/venv\n"'
alias __git_env_rc='printf "$(__git_dir)/venv/bin/activate\n"'

alias venv_git='bash --init-file <(printf "source ${HOME}/.bashrc; source $(__git_env_rc)\n")'
alias source_git_env='source $(__git_env_rc)'
