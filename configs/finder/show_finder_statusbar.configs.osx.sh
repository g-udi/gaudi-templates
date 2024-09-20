#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Show Finder status bar"
function _command {
    defaults write com.apple.finder ShowStatusBar -bool true
}