#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Zoom the screen by scrolling with the Ctrl (^) key held (needs Full Disk Access for your terminal: System Settings » Privacy & Security)"
function _command {
    # com.apple.universalaccess is protected by the macOS privacy controls:
    # without Full Disk Access for the terminal, defaults refuses to write it
    defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
    defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
    # Follow the keyboard focus while zoomed in
    defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true
}
