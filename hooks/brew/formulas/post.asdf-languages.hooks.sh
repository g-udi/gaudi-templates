#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2044

if command_exists asdf ; then

    # Check if we have any default gems or npm modules
    for GEMS in $(find "$GAUDI" -type f -iname .default-gems); do
        echo "Found a .default-gems 💎 file .. moving it to 🏠"
        cp "$GEMS" ~
    done;

    # Check if we have any default gems or npm modules
    for NPMS in $(find "$GAUDI" -type f -iname .default-npm-packages); do
        echo "Found a .default-npm-packages 📦 file .. moving it to 🏠"
        cp "$NPMS" ~
    done;

    if [[ ! -d "${HOME}/.gaudi_bash" ]]; then
        printf "${YELLOW}%s$NC\n" "After the installation is done .. you need to configure asdf as follows:"
        printf "${RED}%s${NC}\n" "Depending on your OS and shell, run the following:"
        printf "\n%s ${MAGENTA}%s${NC}" "Bash on" "Ubuntu (and other Linux distros)"
        printf "\n\t%s" "echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc"
        printf "\n\t%s" "echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc"
        
        printf "\n\n%s ${MAGENTA}%s${NC}" "Bash on" "macOS"
        printf "\n\t%s" "echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bash_profile"
        printf "\n\t%s" "echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bash_profile"

        echo ""
        echo "Check the main asdf repo: https://github.com/asdf-vm/asdf for further configurations"
    else
        echo -e "Detected gaudi-bsh to be installed .. Enable the asdf pluings:
            gaudi-bash enable plugin asdf
            gaudi-bash enable completion asdf
        "
    fi;
    
    
fi



