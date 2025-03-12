let g:slime_target = "zellij"
let g:slime_default_config = {"session_id": "current", "relative_pane": "right"}

let g:slime_bracketed_paste = 1

"disables default bindings
let g:slime_no_mappings = 1

"send visual selection
xmap <leader>ss <Plug>SlimeRegionSend

"send based on motion or text object
nmap <leader>ss <Plug>SlimeMotionSend

"send line
nmap <leader>sl <Plug>SlimeLineSend
