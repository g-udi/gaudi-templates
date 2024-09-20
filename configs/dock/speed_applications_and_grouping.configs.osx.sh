#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Speeding up Mission Control animations and grouping windows by application"
function _command {
    defaults write com.apple.dock expose-animation-duration -float 0.1
    defaults write com.apple.dock "expose-group-by-app" -bool true
}