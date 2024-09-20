#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Enable full keyboard access for all controls"
function _command {
    defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
}