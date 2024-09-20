#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="disable guest user"
function _command {
    sudo defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool false
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool false
}