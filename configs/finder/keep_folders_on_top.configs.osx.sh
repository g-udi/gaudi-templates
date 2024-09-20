#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Keep folders on top when sorting by name"
function _command {
    defaults write com.apple.finder _FXSortFoldersFirst -bool true
}