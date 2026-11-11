#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Disable the window shadow in screenshots"
function _command {
    defaults write com.apple.screencapture disable-shadow -bool true
}
