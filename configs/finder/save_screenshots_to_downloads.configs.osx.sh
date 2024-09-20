#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Save screenshots to the downloads folder"
function _command {
    defaults write com.apple.screencapture location -string "${HOME}/Downloads"
}