#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

# Named zz_ so that it is the last config: Gaudi runs configs in the sorted
# order of their paths, and this one applies what the others wrote.
_info="Restart the Dock, Finder and SystemUIServer now so the Dock, Finder and screenshot settings take effect (windows flicker; without it they apply at the next login)"
function _command {
    local app=""

    for app in Dock Finder SystemUIServer; do
        # killall fails when the process is not running, which is fine here
        killall "$app" >/dev/null 2>&1 || true
    done
}
