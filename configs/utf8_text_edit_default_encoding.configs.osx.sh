#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Open and save files as UTF-8 encoding in TextEdit"
function _command {
    defaults write com.apple.TextEdit PlainTextEncoding -int 4
    defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
}