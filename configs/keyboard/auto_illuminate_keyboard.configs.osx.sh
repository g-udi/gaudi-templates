#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Automatically illuminate built-in MacBook keyboard in low light"
function _command {
    defaults write com.apple.BezelServices kDim -bool true
}