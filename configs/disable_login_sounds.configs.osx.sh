#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Mute the startup chime on boot"
function _command {
    sudo nvram StartupMute=%01
}
