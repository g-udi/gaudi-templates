#!/usr/bin/env bash
# shellcheck shell=bash

printf "\n%s\n\n" "🔬 All brew formulas installed .. setting up few things"
printf "\n%s\n" "Checking if all brew installed formulas are healthy .. running brew doctor 👨🏻‍⚕️"
brew doctor
