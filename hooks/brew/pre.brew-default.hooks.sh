#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2012,SC2154,SC1090,SC2046

echo ""

# Check if we have any taps that we need to "tap" ;)
echo "=====> $GAUDI_TEMPLATES_LOCATION"
find "$GAUDI_TEMPLATES_LOCATION" -type f -iname "default.tap.list.sh" | while read -r TAP; do
    . "$TAP"
    for _tap in "${brewTapList[@]}";
    do
        echo -e "\nFound a brew formula tap ✊ ... tapping $_tap"
        brew tap "$_tap"
    done
done
