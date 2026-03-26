test -e $HOME/.local/bin/mise
and if status is-interactive
  $HOME/.local/bin/mise activate fish | source
else
  $HOME/.local/bin/mise activate fish --shims | source
end
