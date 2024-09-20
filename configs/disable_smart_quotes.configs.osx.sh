#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Disable smart quotes"
function _command {
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
}