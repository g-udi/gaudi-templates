 defaults write com.apple.dock tilesize -int 36

 #!/usr/bin/env bash
# shellcheck shell=bash
# shellcheck disable=SC2034

_info="Set the icon size of Dock items to 36 pixels"
function _command {
    defaults write com.apple.dock tilesize -int 36
}