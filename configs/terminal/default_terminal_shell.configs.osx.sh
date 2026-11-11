#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Change the default Terminal shell to the Homebrew bash"
function _command {
    local shell_path=""

    if ! command -v brew >/dev/null 2>&1; then
        printf "%b\n" "${YELLOW:-}[WARN]${NC:-} Homebrew was not found: leaving the Terminal shell unchanged"
        return 0
    fi

    shell_path="$(brew --prefix)/bin/bash"
    # Terminal cannot open a window when its shell does not exist
    if [[ ! -x "$shell_path" ]]; then
        printf "%b\n" "${YELLOW:-}[WARN]${NC:-} $shell_path is not installed (brew install bash): leaving the Terminal shell unchanged"
        return 0
    fi

    defaults write com.apple.Terminal Shell -string "$shell_path"
}
