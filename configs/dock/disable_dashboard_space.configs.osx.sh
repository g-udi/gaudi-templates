#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Don’t show Dashboard as a Space"
function _command {
    defaults write com.apple.dashboard mcx-disabled -bool true
    defaults write com.apple.dock "dashboard-in-overlay" -bool true
}