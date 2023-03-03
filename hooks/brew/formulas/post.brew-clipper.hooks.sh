#!/usr/bin/env bash
# shellcheck shell=bash

if command_exists clipper ; then
    echo "⚙️  Setting up launchd to start clipper now and restart at login"
    brew services start clipper
fi