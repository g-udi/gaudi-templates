#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Disable the guest user account and guest access to shared folders"
function _command {
    # Guest login account
    sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false
    # Guest access to SMB file sharing
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool false
}
