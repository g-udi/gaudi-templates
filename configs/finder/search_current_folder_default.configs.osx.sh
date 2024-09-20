#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="When performing a search, search the current folder by default"
function _command {
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
}