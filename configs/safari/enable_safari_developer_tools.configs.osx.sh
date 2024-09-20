#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Enable the Develop menu and the Web Inspector"
function _command {
    defaults write com.apple.Safari IncludeDevelopMenu -bool true
    defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
    defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
}