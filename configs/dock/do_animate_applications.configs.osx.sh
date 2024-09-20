#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Don’t animate opening applications from the Dock"
function _command {
    defaults write com.apple.dock launchanim -bool false
}