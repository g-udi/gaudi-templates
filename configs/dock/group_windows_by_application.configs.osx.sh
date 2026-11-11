#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Group windows by application in Mission Control"
function _command {
    defaults write com.apple.dock expose-group-by-app -bool true
}
