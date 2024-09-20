#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Expand save panel by default"
function _command {
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
}