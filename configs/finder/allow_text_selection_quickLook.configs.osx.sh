#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Allow text selection in Quick Look"
function _command {
    defaults write com.apple.finder QLEnableTextSelection -bool true
}