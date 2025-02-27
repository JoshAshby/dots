" Ocaml Stuff {{{
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')

let g:syntastic_ocaml_checkers=['merlin']
" }}}
