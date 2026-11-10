#!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC1090,SC2154

# Runs after core.Brewfile (which installs asdf).
# Installs the asdf plugins and language versions listed in the templates:
#   asdf-plugins.list.sh    -> asdfPluginsList
#   asdf-languages.list.sh  -> asdfLanguagesList ("<plugin> <version>::<description>")

command_exists asdf || return 0

printf "\n%b\n" "${YELLOW:-}asdf${NC:-} manages multiple language runtime versions with a single CLI tool."
gaudi::confirm "Install the programming languages set using asdf?" "n" || return 0

_asdf_templates="${GAUDI_TEMPLATES_LOCATION:-$GAUDI/templates}"

while IFS= read -r -u 5 _asdf_list; do
    [[ -n "$_asdf_list" ]] || continue
    source "$_asdf_list"
    for _asdf_plugin in "${asdfPluginsList[@]}"; do
        printf "%b\n" "Adding asdf plugin ${MAGENTA:-}$_asdf_plugin${NC:-}"
        asdf plugin add "$_asdf_plugin" || gaudi::record_failure "asdf plugin $_asdf_plugin"
    done
done 5< <(find "$_asdf_templates" -type f -iname "asdf-plugins.list.sh")

while IFS= read -r -u 5 _asdf_list; do
    [[ -n "$_asdf_list" ]] || continue
    source "$_asdf_list"
    for _asdf_entry in "${asdfLanguagesList[@]}"; do
        _asdf_spec="${_asdf_entry%%::*}"
        _asdf_name="${_asdf_spec%% *}"
        _asdf_version="${_asdf_spec#* }"

        printf "\n%b\n" "${MAGENTA:-}$_asdf_spec${NC:-}"
        [[ "$_asdf_entry" == *"::"* ]] && printf "%b\n" "${YELLOW:-}Description:${NC:-} ${_asdf_entry#*::}"
        gaudi::confirm "Install $_asdf_spec?" "y" || continue

        if asdf install "$_asdf_name" "$_asdf_version"; then
            if gaudi::confirm "Set $_asdf_spec as the default version?" "n"; then
                asdf set --home "$_asdf_name" "$_asdf_version" || gaudi::record_failure "asdf set --home $_asdf_spec"
            fi
        else
            gaudi::record_failure "asdf install $_asdf_spec"
        fi
    done
done 5< <(find "$_asdf_templates" -type f -iname "asdf-languages.list.sh")

while IFS= read -r -u 5 _asdf_post; do
    [[ -n "$_asdf_post" ]] || continue
    source "$_asdf_post"
done 5< <(find "$_asdf_templates" -type f -iname "asdf-languages.post.sh")

return 0
