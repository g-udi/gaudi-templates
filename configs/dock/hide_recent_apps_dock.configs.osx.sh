#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Don’t show recent applications in Dock"
function _command {
    defaults write com.apple.dock show-recents -bool false
}