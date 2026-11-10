#!/usr/bin/env bash
# shellcheck shell=bash

# Sourced by post.bundle-core.asdf.hooks.sh once the asdf languages are installed.

_asdf_templates="${GAUDI_TEMPLATES_LOCATION:-$GAUDI/templates}"

# asdf installs these packages automatically with every new Ruby / Node.js version
while IFS= read -r _asdf_defaults; do
    [[ -n "$_asdf_defaults" ]] || continue
    echo "Found $(basename "$_asdf_defaults") .. copying it to 🏠"
    cp "$_asdf_defaults" "$HOME/"
done < <(find "$_asdf_templates" -type f \( -name ".default-gems" -o -name ".default-npm-packages" \))

if [[ -d "$HOME/.gaudi-shell" ]]; then
    printf "%s\n" "gaudi-shell detected. Enable the asdf plugin and completion:" \
        "    gshell enable plugin asdf" \
        "    gshell enable completion asdf"
else
    printf "%b\n" "${YELLOW:-}Add the asdf shims to your PATH in your shell profile:${NC:-}"
    # shellcheck disable=SC2016
    printf "%s\n" '    export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"' \
        "See https://asdf-vm.com/guide/getting-started.html for other shells and completions"
fi
