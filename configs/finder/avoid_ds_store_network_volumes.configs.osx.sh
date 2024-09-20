#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Avoid creating .DS_Store files on network volumes"
function _command {
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
}