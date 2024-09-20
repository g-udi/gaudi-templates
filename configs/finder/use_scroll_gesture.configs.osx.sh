#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Use scroll gesture with the Ctrl (^) modifier key to zoom"
function _command {
    defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
    defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
    # Follow the keyboard focus while zoomed in
    defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true
}