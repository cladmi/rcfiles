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
fi

return 0
