# Disable the greeting prompt
set fish_greeting

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.atuin/bin
fish_add_path $HOME/.orbstack/bin
fish_add_path /usr/local/bin
fish_add_path /opt/homebrew/bin

fish_add_path "$HOME/repos/personal/gni"
fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

source ~/.config/fish/aliases.fish

set -gx EDITOR vim
set -gx ZELLIJ_CONFIG_DIR "{$HOME}/.config/zellij"

test -e {$HOME}/.iterm2_shell_integration.fish
and source {$HOME}/.iterm2_shell_integration.fish

string match -q "$TERM_PROGRAM" "vscode"
and source (code --locate-shell-integration-path fish)

test -e $HOME/.local/bin/mise
and if status is-interactive
  $HOME/.local/bin/mise activate fish | source
else
  $HOME/.local/bin/mise activate fish --shims | source
end

test -e $HOME/.atuin/bin/atuin
and if status is-interactive
  atuin init fish --disable-up-arrow | source
end

string match -q "$TERM" "xterm-ghostty"
and not set -q ZELLIJ
and if status is-interactive
  zellij
end

set -gx DO_NOT_TRACK 1

# seriously fuck off homebrew and stop breaking my shit with auto upgrades that
# aren't documented anywhere besides a pr from 2017
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -gx HOMEBREW_NO_INSTALL_UPGRADE 1 # WHAT THE FLYING FUCK HOMEBREW
set -gx HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK 1 # GODDAMMIT HOMEBREW

#set -gx DOCKER_HOST 'unix:///Users/joshashby/.local/share/containers/podman/machine/podman-machine-default/podman.sock'
#set -gx DOCKER_HOST 'unix:///var/run/docker.sock'

set -gx ET_NO_TELEMETRY 1

set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1
