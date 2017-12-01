AGENT_FILE="${HOME}/.ssh/.ssh_agent"

lazy_start_agent() {
    local agent_file=$1

    # There should only be one instance running
    if pgrep -u "${USER}" ssh-agent > /dev/null; then
        return
    fi

    unset SSH_AGENT_PID
    ssh-agent > "${agent_file}"

    export SSH_ASKPASS=ssh-askpass

    lazy_load_agent  "${agent_file}" > /dev/null
    ssh-add ${HOME}/.ssh/id_rsa
}


lazy_load_agent() {
    local agent_file=$1

    if [[ "${SSH_AGENT_PID}" == "" ]]; then
        eval "$(<${agent_file})"
    fi
}

lazy_start_agent "${AGENT_FILE}"
lazy_load_agent  "${AGENT_FILE}" > /dev/null
