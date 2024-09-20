#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Disable automatic capitalization while typing"
function _command {
    defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
}