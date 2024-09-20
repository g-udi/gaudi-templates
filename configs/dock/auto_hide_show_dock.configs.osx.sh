#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Automatically hide and show the Dock"
function _command {
    # Automatically hide and show the Dock
    defaults write com.apple.dock autohide -bool true
    # Remove the auto-hiding Dock delay
    defaults write com.apple.dock autohide-delay -float 0
    # Remove the animation when hiding/showing the Dock
    defaults write com.apple.dock autohide-time-modifier -float 0

}