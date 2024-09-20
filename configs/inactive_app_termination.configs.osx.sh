#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Disable automatic termination of inactive apps"
function _command {
    defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true
}