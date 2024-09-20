#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Disable the sound effects on boot"
function _command {
    sudo nvram SystemAudioVolume=" "
}