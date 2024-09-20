#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Disable automatic period substitution"
function _command {
    defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
}
