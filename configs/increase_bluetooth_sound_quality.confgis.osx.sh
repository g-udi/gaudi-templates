#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Increase sound quality for Bluetooth headphones/headsets"
function _command {
    defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
}