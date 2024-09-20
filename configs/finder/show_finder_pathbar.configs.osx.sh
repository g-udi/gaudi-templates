#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Show Finder path bar"
function _command {
    defaults write com.apple.finder ShowPathbar -bool true
}