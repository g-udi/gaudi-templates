#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Don’t automatically rearrange Spaces based on most recent use"
function _command {
    defaults write com.apple.dock mru-spaces -bool false
}
