# Disable the greeting prompt
set fish_greeting

fish_add_path $HOME/.local/bin
fish_add_path "$HOME/repos/personal/gni"

set -gx EDITOR vim
set -gx DO_NOT_TRACK 1
set -gx ET_NO_TELEMETRY 1
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1

abbr --add mk "mkdir"
abbr --add vi "vim"
abbr --add v "vim"

alias nano "gvim"

alias la "ls -la"
alias sl "ls -aCS1hl"

alias dotfiles "git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

