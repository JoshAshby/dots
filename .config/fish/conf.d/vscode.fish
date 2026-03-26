fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

string match -q "$TERM_PROGRAM" "vscode"
and code --locate-shell-integration-path fish | source
