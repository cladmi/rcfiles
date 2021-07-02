# Uncomment 'user_allow_other' in /etc/fuse.conf
alias cladmi_mount='sshfs -o allow_other cladmi@cladmi.eu:/media/5 /media/5'

alias git_root='git rev-parse --show-toplevel'

alias cmake_test_verbose='echo export CTEST_OUTPUT_ON_FAILURE=1; export CTEST_OUTPUT_ON_FAILURE=1'
