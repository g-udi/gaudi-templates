#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Make Dock icons of hidden applications translucent"
function _command {
    defaults write com.apple.dock showhidden -bool true
}