#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="SECURITY TRADE-OFF: turn off download quarantine, which removes the 'Are you sure you want to open this application?' dialog and weakens Gatekeeper checks for downloaded apps (answer no if unsure)"
function _command {
    # Downloaded files are no longer flagged with com.apple.quarantine, so
    # Gatekeeper does not assess them on first launch.
    # Undo with: defaults delete com.apple.LaunchServices LSQuarantine
    defaults write com.apple.LaunchServices LSQuarantine -bool false
}
