fish_add_path $HOME/.atuin/bin

test -e $HOME/.atuin/bin/atuin
and if status is-interactive
  atuin init fish --disable-up-arrow | source
end
