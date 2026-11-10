#!/usr/bin/env bash
# shellcheck shell=bash

# The system Ruby cannot be updated without root; gems are installed with --user-install there.
if [[ "$(type -P gem)" == "/usr/bin/gem" ]]; then
    echo "System Ruby detected: skipping 'gem update --system' 💎"
else
    echo "Updating RubyGems before installing the 💎 gem list"
    gem update --system
fi
