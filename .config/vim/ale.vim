" ALE {{{
" only invoke merlin to check for errors when
" exiting insert mode, not on each keystroke.
"let g:ale_lint_on_text_changed="never"
let g:ale_lint_on_insert_leave=1

" enable ALE's internal completion if deoplete is not used
let g:ale_completion_enabled=1

" only pop up completion when stopped typing for ~0.5s,
" to avoid distracting when completion is not needed
let g:ale_completion_delay=250

let g:ale_sign_error                  = '✘'
let g:ale_sign_warning                = '⚠'
highlight ALEErrorSign ctermbg        =NONE ctermfg=red
highlight ALEWarningSign ctermbg      =NONE ctermfg=yellow
"let g:ale_linters_explicit            = 1
"let g:ale_lint_on_text_changed        = 'never'
let g:ale_lint_on_enter               = 1
let g:ale_lint_on_save                = 1
let g:ale_fix_on_save                 = 1

let g:ale_linters = {
\   'ocaml':      ['merlin'],
\}

let g:ale_fixers = {
\   'ocaml':      ['ocamlformat'],
\   '*':          ['remove_trailing_lines', 'trim_whitespace'],
\}

" see ale-completion-completeopt-bug
set completeopt=menu,menuone,preview,noselect,noinsert

"if has('packages')
  "packloadall

  "" This should be part of ALE itself, like ols.vim
  ""call ale#linter#Define('ocaml',{
              ""\ 'name':'ocaml-lsp',
              ""\ 'lsp': 'stdio',
              ""\ 'executable': 'ocamllsp',
              ""\ 'command': '%e',
              ""\ 'project_root': function('ale#handlers#ols#GetProjectRoot')
              ""\})

  "" remap 'gd' like Merlin would
  "nmap <silent><buffer> gd  <Plug>(ale_go_to_definition_in_split)<CR>

  "" go back
  "nnoremap <silent> <LocalLeader>gb <C-O>

  "" show list of file:line:col of references for symbol under cursor
  "nmap <silent><buffer> <LocalLeader>go :ALEFindReferences -relative<CR>

  "" Show documentation if available, and type
  "nmap <silent><buffer> <LocalLeader>hh <Plug>(ale_hover)<CR>

  "" So I can type ,hh. More convenient than \hh.
  ""nmap , <LocalLeader>
  ""vmap , <LocalLeader>
"endif
" }}}
