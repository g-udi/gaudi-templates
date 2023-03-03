#!/usr/bin/env bash
# shellcheck shell=bash

echo "Checking if pip is installed 🤔"
if ! type pip &> /dev/null ; then
    printf "The required ${YELLOW}pip${NC} command was not found .. attempting to install it\n"
    easy_install pip
fi