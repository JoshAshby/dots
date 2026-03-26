set -gx ZELLIJ_CONFIG_DIR "$HOME/.config/zellij"
string match -q "$TERM_PROGRAM" "ghostty"
and not set -q ZELLIJ
and if status is-interactive
  zellij attach tuatha_an
end
