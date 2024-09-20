#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
function _command {
    defaults write com.apple.screencapture type -string "png"
    # Disable shadow in screenshots
    defaults write com.apple.screencapture disable-shadow -bool true
}


