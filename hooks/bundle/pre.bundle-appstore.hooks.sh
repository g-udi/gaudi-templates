#!/usr/bin/env bash
# shellcheck shell=bash

# Runs before appstore.Brewfile.
printf "\n%b\n" "To install applications with ${YELLOW:-}mas${NC:-} you need to be signed in to the App Store app first." \
    "Apps you have never downloaded with this Apple Account may need to be installed once from the App Store."
