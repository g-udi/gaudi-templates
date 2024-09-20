#!/usr/bin/env bash
# shellcheck shell=bash

chip_type=$(sysctl -n machdep.cpu.brand_string)

if [[ "$chip_type" == *Intel* ]]; then 
    export PATH=$PATH:/usr/local/bin
else export PATH=$PATH:/opt/homebrew/bin
fi