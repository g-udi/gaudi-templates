#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Turn off keyboard illumination when computer is not used for 5 minutes"
function _command {
    defaults write com.apple.BezelServices kDimTime -int 300
}