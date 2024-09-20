#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Change default terminal shell to bash"
function _command {
    chip_type=$(sysctl -n machdep.cpu.brand_string)
    if [[ "$chip_type" == *Intel* ]]; then 
        defaults write com.apple.Terminal Shell "/usr/local/bin/bash"
    else defaults write com.apple.Terminal Shell "/opt/homebrew/bin/bash"
    fi
}