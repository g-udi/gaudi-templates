#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC1090,SC1091

# Runs after languages.Brewfile (nvm, pyenv, jenv).
# Offers to install a current Node.js and Python with the version managers just installed.

gaudi::confirm "Install the latest Node.js LTS (nvm) and Python 3 (pyenv)?" "n" || return 0

_languages_nvm="$(brew --prefix 2>/dev/null)/opt/nvm/nvm.sh"
if [[ -s "$_languages_nvm" ]]; then
    export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
    mkdir -p "$NVM_DIR"
    # nvm is a shell function, so it has to be loaded into this shell first.
    # Gaudi runs hooks under `set -u`. nvm.sh is not guaranteed to be clean
    # under it and Homebrew's wrapper around it reads $NVM_DIR bare, and an
    # unset variable there would end the whole run: nounset is turned off
    # while nvm runs and put back afterwards.
    _languages_nounset="false"
    if [[ "$-" == *u* ]]; then
        _languages_nounset="true"
    fi
    set +u
    source "$_languages_nvm"
    nvm install --lts || gaudi::record_failure "nvm install --lts"
    if [[ "$_languages_nounset" == "true" ]]; then
        set -u
    fi
    unset _languages_nounset
fi
unset _languages_nvm

if command_exists pyenv; then
    pyenv install --skip-existing 3 || gaudi::record_failure "pyenv install 3"
fi

return 0
