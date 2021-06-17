# Ningyo bash completion script
# =============================
#
# It currently completes the options and commands list and handles some
# subcommands:
#
# attach)
#
#  - the list of free operational boards with annotation
#  - if some part of the bord url is already written,
#    switch to "non annotated" to give usable completion
#
# detach)
#
#  - ${NINGYO_NAME} == the current active board


# Issue: several times "ningyo list" returns a "No boards found for 'boardtype'"


# Helper:
#
# ${COMP_WORDS[COMP_CWORD]} current word
# ${COMP_WORDS[@]::COMP_CWORD} all but last word, list of all "completed" words


__ningyo_cmds=(version list attach detach env push attachcfg search update remote bugreport help)
__ningyo_opts=(-mp -local --help)
__ningyo_args=(${__ningyo_cmds[@]} ${__ningyo_opts[@]})


function __ningyo_current_subcommand()
{
    # Framing blanks are required
    local framed_cmds=" ${__ningyo_cmds[*]} "
    local word
    for word in ${COMP_WORDS[@]::COMP_CWORD}
    do
        [[ $framed_cmds =~ " ${word} " ]] && printf "%s\n" "${word}" && return
    done
}


function __ningyo_list_filter_only_names()
{
    sed -n '/^  lab/ s/^  \([^ ]*\).*/\1/p'
}

function __ningyo_list()
{
    # Only free and operational boards
    ningyo list -f -o $@ | __ningyo_list_filter_only_names
}


# List current directory files
function __ningyo_complete_default_list_files()
{
    COMPREPLY=($(compgen -f -- "${COMP_WORDS[COMP_CWORD]}"))
}


function __ningyo_complete_attach()
{
    # Complete with annotation until strictly more than 'lab.' is completed
    if [[ "${COMP_WORDS[COMP_CWORD]}" =~ lab\..+ ]]; then
        COMPREPLY=($(compgen -W "$(__ningyo_list)" -- "${COMP_WORDS[COMP_CWORD]}"))
    elif [[ "${COMP_WORDS[@]::COMP_CWORD}" =~ lab\..+ ]]; then
        # board already listed
        __ningyo_complete_default_list_files
    else
        COMPREPLY=($(compgen -W "$(__ningyo_list -a)" -- "${COMP_WORDS[COMP_CWORD]}"))
    fi
}

function __ningyo_complete_detach()
{
    if [[ "${NINGYO_NAME}" != "" ]]; then
        COMPREPLY=($(compgen -W "${NINGYO_NAME}" -- "${COMP_WORDS[COMP_CWORD]}"))
    else
        __ningyo_complete_default_list_files
    fi
}

function __ningyo_complete()
{
    local subcommand=$(__ningyo_current_subcommand)
    case ${subcommand} in
        "")
            COMPREPLY=($(compgen -W "${__ningyo_args[*]}" -- "${COMP_WORDS[COMP_CWORD]}"))
            ;;
        "attach")
            __ningyo_complete_attach
            ;;
        "detach")
            __ningyo_complete_detach
            ;;
        *)
            __ningyo_complete_default_list_files
            ;;
    esac
}

complete -F __ningyo_complete ningyo
