fish_add_path /usr/local/bin
fish_add_path /opt/homebrew/bin

# seriously fuck off homebrew and stop breaking my shit with auto upgrades that
# aren't documented anywhere besides a pr from 2017
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -gx HOMEBREW_NO_INSTALL_UPGRADE 1 # WHAT THE FLYING FUCK HOMEBREW
set -gx HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK 1 # GODDAMMIT HOMEBREW
