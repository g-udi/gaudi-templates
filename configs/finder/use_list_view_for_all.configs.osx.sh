#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Use list view in all Finder windows"
function _command {
    defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
}