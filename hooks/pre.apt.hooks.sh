#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC1091

# Adds the Docker apt repository so docker-ce can be installed from the apt lists.
# Uses a keyring file (apt-key is gone from current Debian/Ubuntu) and the machine's real architecture.

if [[ ! -f /etc/apt/sources.list.d/docker.list ]]; then
    printf "%b\n" "Adding the apt repository for ${YELLOW:-}Docker${NC:-}"

    _docker_distro="$(. /etc/os-release && printf "%s" "$ID")"
    _docker_codename="$(. /etc/os-release && printf "%s" "${VERSION_CODENAME:-}")"

    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL "https://download.docker.com/linux/${_docker_distro}/gpg" -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    printf "deb [arch=%s signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/%s %s stable\n" \
        "$(dpkg --print-architecture)" "$_docker_distro" "$_docker_codename" \
        | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
fi

sudo apt-get update
