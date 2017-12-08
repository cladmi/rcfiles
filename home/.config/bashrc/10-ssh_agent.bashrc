AGENT_FILE="${HOME}/.ssh/.ssh_agent"
SSH_KEY="${HOME}/.ssh/id_rsa"

lazy_start_agent() {
    local agent_file=$1

    # There should only be one instance running
    if pgrep -u "${USER}" ssh-agent > /dev/null; then
        return
    fi

    unset SSH_AGENT_PID
    ssh-agent > "${agent_file}"
}


lazy_load_agent() {
    local agent_file=$1

    if [[ "${SSH_AGENT_PID}" == "" ]]; then
        eval "$(<${agent_file})"
    fi
}


lazy_add_key() {
    local key=$1

    if ssh-add -l | grep -q --invert-match "${key}"
    then
        SSH_ASKPASS=ssh-askpass  ssh-add "${key}"
    fi
}


lazy_start_agent "${AGENT_FILE}"
lazy_load_agent  "${AGENT_FILE}" > /dev/null

lazy_add_key     "${SSH_KEY}"
