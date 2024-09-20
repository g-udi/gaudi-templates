#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Add a context menu item for showing the Web Inspector in web views in Safari"
function _command {
    defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
}