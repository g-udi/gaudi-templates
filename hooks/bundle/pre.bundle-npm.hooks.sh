#!/usr/bin/env bash
# shellcheck shell=bash

# Runs before npm.Brewfile.
# brew bundle installs Homebrew's node formula by itself when npm is missing,
# so this only says what is about to happen.
if ! type npm &> /dev/null; then
    printf '%b\n' "${YELLOW:-}npm${NC:-} was not found: Homebrew will install its ${YELLOW:-}node${NC:-} formula to install these packages." \
        "To use a Node.js from nvm instead, install it first (nvm install --lts) and run the setup again."
fi
