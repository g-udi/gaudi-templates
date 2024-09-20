#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Disable smart dashes when typing"
function _command {
    defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
}
