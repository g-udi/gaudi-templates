#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Show indicator lights for open applications in the Dock"
function _command {
    defaults write com.apple.dock show-process-indicators -bool true
}