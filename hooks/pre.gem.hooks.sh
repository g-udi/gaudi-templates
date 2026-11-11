#!/usr/bin/env bash
# shellcheck shell=bash

# Runs before the gem lists. Gaudi runs pre-hooks before it asks about any
# list, so the update is offered, not done.

# The system Ruby cannot be updated without root; gems are installed with --user-install there.
if [[ "$(type -P gem)" == "/usr/bin/gem" ]]; then
    echo "System Ruby detected: skipping 'gem update --system' 💎"
elif gaudi::confirm "Update RubyGems (gem update --system) before the 💎 gem lists?" "n"; then
    gem update --system || gaudi::record_failure "gem update --system"
fi

return 0
