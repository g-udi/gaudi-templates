#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC1091

# Runs before the apt lists. Nothing here happens without a yes: Gaudi runs
# pre-hooks before it asks about any list.
#
# Offers to add the Docker apt repository so docker-ce can be installed from the apt lists.
# Uses a keyring file (apt-key is gone from current Debian/Ubuntu) and the machine's real architecture.
# docker.list is only written once the distribution is known to be served by Docker and the key was downloaded.

_gaudi_docker_apt_repository() {
    local distro="" codename="" like="" key="" base="https://download.docker.com/linux"

    distro="$(. /etc/os-release && printf "%s" "${ID:-}")"
    like="$(. /etc/os-release && printf "%s" "${ID_LIKE:-}")"

    case "$distro" in
        ubuntu | debian | raspbian)
            codename="$(. /etc/os-release && printf "%s" "${VERSION_CODENAME:-}")"
            ;;
        *)
            # Derivatives (Mint, Pop!_OS, elementary, LMDE, ...) use the packages of their parent
            if [[ " $like " == *" ubuntu "* ]]; then
                distro="ubuntu"
                codename="$(. /etc/os-release && printf "%s" "${UBUNTU_CODENAME:-}")"
            elif [[ " $like " == *" debian "* ]]; then
                distro="debian"
                codename="$(. /etc/os-release && printf "%s" "${DEBIAN_CODENAME:-${VERSION_CODENAME:-}}")"
            else
                gaudi::warn "Docker has no apt repository for '$distro': skipping (docker-ce will not be installable)"
                return 1
            fi
            ;;
    esac

    if [[ -z "$codename" ]]; then
        gaudi::warn "Could not work out the release codename of this system: skipping the Docker apt repository"
        return 1
    fi

    if ! curl -fsLI -o /dev/null "$base/$distro/dists/$codename/Release"; then
        gaudi::warn "Docker does not publish packages for $distro $codename (or the network is down): skipping the Docker apt repository"
        return 1
    fi

    key="$(mktemp)" || return 1
    if ! curl -fsSL "$base/$distro/gpg" -o "$key" || [[ ! -s "$key" ]]; then
        rm -f "$key"
        gaudi::warn "Could not download the Docker signing key: skipping the Docker apt repository"
        return 1
    fi

    if ! { sudo install -m 0755 -d /etc/apt/keyrings &&
        sudo install -m 0644 "$key" /etc/apt/keyrings/docker.asc; }; then
        rm -f "$key"
        gaudi::warn "Could not install the Docker signing key: skipping the Docker apt repository"
        return 1
    fi
    rm -f "$key"

    printf "deb [arch=%s signed-by=/etc/apt/keyrings/docker.asc] %s/%s %s stable\n" \
        "$(dpkg --print-architecture)" "$base" "$distro" "$codename" |
        sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
}

if [[ ! -f /etc/apt/sources.list.d/docker.list ]]; then
    printf "%b\n" "${YELLOW:-}docker-ce${NC:-} in the apt list comes from Docker's own apt repository."
    if gaudi::confirm "Add the Docker apt repository (uses sudo)?" "n"; then
        _gaudi_docker_apt_repository || gaudi::record_failure "Docker apt repository"
    fi
fi
unset -f _gaudi_docker_apt_repository

if gaudi::confirm "Refresh the apt package index (sudo apt-get update)?" "y"; then
    sudo apt-get update || gaudi::record_failure "apt-get update"
fi

return 0
