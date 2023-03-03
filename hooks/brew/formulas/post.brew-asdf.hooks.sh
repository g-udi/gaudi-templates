#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2044,SC2154,SC1090,SC2086

if command_exists asdf ; then

    echo -e "${RED}
    
           _____ _____  ______ 
    /\    / ____|  __ \|  ____|
   /  \  | (___ | |  | | |__   
  / /\ \  \___ \| |  | |  __|  
 / ____ \ ____) | |__| | |     
/_/    \_\_____/|_____/|_|     
${NC}

asdf is a CLI tool that can manage multiple language runtime versions on a per-project basis. It is like gvm, nvm, rbenv & pyenv (and more) all in one! Simply install your language's plugin!

Manage multiple runtime versions with a single CLI tool

"
    read -rp "Would you like to install the programming languages set usign asdf? [Y/N] " -n 1 </dev/tty
    if [[ $REPLY =~ ^[Yy]$ ]]; then
         echo ""
        # Check if we have asdf plugins and languages to set
        for PLUGINS_LIST in $(find "$GAUDI" -type f -iname asdf-plugins.list.sh); do
            printf "%b\n" "Installing ${YELLOW}ASDF${NC} ${MAGENTA}plugins${NC} 🔮"
            . "$PLUGINS_LIST"
            for plugin in "${asdfPluginsList[@]}"; do
                printf "%b\n" "Adding asdf ${MAGENTA}plugin${NC} ${RED}$plugin${NC}"
                asdf plugin-add "$plugin"
            done
        done;
        
        for LANGUAGES_LIST in $(find "$GAUDI" -type f -iname asdf-languages.list.sh); do

            setGlobal() {
                read -rp "Would you like to set ${1} ${2} as the global version 🌍 ? [Y/N] " -n 1 is_GLOBAL </dev/tty   
                if [[ $is_GLOBAL =~ ^[Yy]$ ]]; then
                    asdf global "$1" "$2"
                fi;  
                echo ""
            }

            printf "\n%b\n" "Installing ${YELLOW}programming languages${NC} using asdf 🔮"
            . "$LANGUAGES_LIST"
            read -rp "Would you like to install all the programming languages set [Type N to select what you want to install one by one]? [Y/N] " -n 1 SELECT_ALL </dev/tty
            
            echo ""
            for language in "${asdfLanguagesList[@]}"; do
                _language="${language%%::*}"
                _description="${language##*::}"            
                if [[ $SELECT_ALL =~ ^[nN]$ ]]; then
                    echo ""
                    read -rp "👾 $(printf "%b" "${MAGENTA}$_language${NC}\n${YELLOW}Description:${NC} $_description") | Would you like to install this? [Y/N] " -n 1 LANGUAGE_CONFIRM </dev/tty
                    echo ""
                    if [[ $LANGUAGE_CONFIRM =~ ^[Yy]$ ]]; then
                        asdf install ${_language} && setGlobal ${_language}
                    fi;
                else
                    asdf install ${_language} && setGlobal ${_language}
                fi
            done;
            echo ""
        done;

        # We need now to check if we need to run any post hooks
        find "$GAUDI" -type f -iname "post.asdf-languages.hooks.sh" | while read -r POST_HOOK; do
            . "$POST_HOOK"
        done
    fi
fi

echo ""