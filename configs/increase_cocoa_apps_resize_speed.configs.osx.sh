#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Increase window resize speed for Cocoa applications"
function _command {
    defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
}