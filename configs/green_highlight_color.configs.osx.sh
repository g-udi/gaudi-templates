#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Set highlight color to green"
function _command {
    defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"
}