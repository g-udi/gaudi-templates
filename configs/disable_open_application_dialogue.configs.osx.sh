#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Disable the 'Are you sure you want to open this application?' dialog"
function _command {
    defaults write com.apple.LaunchServices LSQuarantine -bool false
}