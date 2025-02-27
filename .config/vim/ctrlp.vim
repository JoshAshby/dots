" ctrlp {{{
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

set wildignore+=*/node_modules/*,*/doc/*,*/coverage/*,*/public/*,*/dist/*,*/tmp/*,*/.git/*
" }}}
