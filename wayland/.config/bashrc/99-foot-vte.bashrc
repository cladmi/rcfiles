# Mix of:
# + `/etc/profile.d/vte.sh`
# + https://codeberg.org/dnkl/foot/wiki#user-content-spawning-new-terminal-instances-in-the-current-working-directory
case "$TERM" in
    foot*) :;;
    *) return 0;;
esac

__osc7_cwd() {
    local strlen=${#PWD}
    local encoded=""
    local pos c o
    for (( pos=0; pos<strlen; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}

if [[ -n "${BASH_VERSION:-}" ]]; then
    # Newer bash versions support PROMPT_COMMAND as an array. In this case
    # only add the __vte_osc7 function to it, and leave setting the terminal
    # title to the outside setup.
    # On older bash, we can only overwrite the whole PROMPT_COMMAND, so must
    # use the __vte_prompt_command function which also sets the title.
    if [[ "$(declare -p PROMPT_COMMAND 2>&1)" =~ "declare -a" ]]; then
        PROMPT_COMMAND+=(__osc7_cwd)
    fi

    # Shell integration
    if [[ "$PS1" != *\]133\;* ]]; then

        # Enclose the primary prompt between
        # ← OSC 133;D;retval ST (report exit status of previous command)
        # ← OSC 133;A ST (mark beginning of prompt)
        # → OSC 133;B ST (mark end of prompt, beginning of command line)
        PS1='\[\e]133;D;$?\e\\\e]133;A\e\\\]'"$PS1"'\[\e]133;B\e\\\]'

        # Prepend OSC 133;L ST for a conditional newline if the previous
        # command's output didn't end in one.
        # This is not done here by default, in order to provide the default
        # visual behavior of shells. Uncomment if you want this feature.
        #PS1='\[\e]133;L\e\\\]'"$PS1"

        # iTerm2 doesn't touch the secondary prompt.
        # Konsole encloses it between 133;A and 133;B.
        # For efficient jumping between commands, we follow iTerm2 by default
        # and don't mark PS2 as prompt. Uncomment if you want to mark it.
        #PS2='\[\e]133;A\e\\\]'"$PS2"'\[\e]133;B\e\\\]'

        # Mark the beginning of the command's output by OSC 133;C ST.
        # '\r' ensures that the kernel's cooked mode has the right idea of
        # the column, important for handling TAB followed by BS keypresses.
        # Prepend to the user's PS0 to preserve whether it ends in '\r'.
        # Note that bash doesn't support the \[ \] markers here.
        PS0='\e]133;C\e\\\r'"${PS0:-}"
    fi
fi

return 0
