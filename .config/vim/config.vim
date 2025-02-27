filetype plugin indent on

" Terminal and GUI setup {{{
" Make sure things look pretty and use a nice colorscheme for the gui
" We need to set this here and not in the TermSetup() because otherwise it
" messes with the colorscheme for lightline
set t_Co=256
set background=dark
silent! colorscheme onedark

function! TermSetup()
  " Make sure to escape the spaces in the name properly
  set guifont=FiraCode\ Nerd\ Font
  set guioptions=e
endfunction

function! GuiSetup()
  " Disable hover tooltips
  " This still doesn't work with ruby code >:|
  set noballooneval
  let g:netrw_nobeval=1

  " Make things look pretty with ligature fonts :3
  set macligatures

  " Show nerdtree on window open
  "NERDTree
endfunction

augroup vim_start
  autocmd!

  autocmd VimEnter * call TermSetup()
  autocmd GUIEnter * call GuiSetup()
augroup END

augroup vimrc_autocmds
  autocmd!

  " Auto reload the vimrc when saving it
  "autocmd BufWritePost $MYVIMRC nested source $MYVIMRC

  " highlight if we go over 120 chars wide
  autocmd BufEnter * highlight OverLength ctermbg=green guibg=#592929
  "autocmd BufEnter * match OverLength /\%>121v.\+/
  "autocmd BufEnter * match OverLength /\%120v.*/
  "autocmd BufEnter * let w:llh = matchadd("OverLength", '\%120v.')
  autocmd BufEnter * let w:llh = matchadd("OverLength", '\%>121v.+')

  " Set some additional filetypes...
  autocmd BufRead,BufNewFile *.jbuilder,*.thor,*.rabl set filetype=ruby
  augroup filetype javascript syntax=javascript
  autocmd BufRead,BufNewFile *.es6 set filetype=javascript
  "autocmd BufRead,BufNewFile *.lookml set filetype=yaml

  " Strip whitespace when working in these filetypes
  autocmd FileType c,cpp,java,php,python,coffee,javascript,css,less,ruby,yaml autocmd BufWritePre <buffer> :%s/\s\+$//e

  " Enable html tag closing on typical html style file types
  autocmd FileType html,djangohtml,jinjahtml,eruby,mako let b:closetag_html_style=1

  " turn off tab expansion for Makefiles
  autocmd FileType make setlocal noexpandtab
augroup END

" Since Vim v8.2.5066 (2022-06-07), you could use `leadmultispace` in listchars for equivalent behaviour
" feel free to use this conceal-less alternative supporting varying buffer shift widths (use BufEnter if needed):
"set list
"autocmd OptionSet shiftwidth execute 'setlocal listchars=trail:·,tab:│\ ,multispace:┆' . repeat('\ ', &sw - 1)

" Turn off line wrapping by default. Restore with :set wrap
set nowrap

" Use undo files for everything, so that undo is persisted across sessions
set undofile

set number
set title
set showtabline=1
set noshowmode
set nofoldenable
set hidden

" set a line width and don't automatically reformat text to fit (toggle with ,<F8>
set textwidth=79
set fo-=t

" Turn syntax highlighting on
syntax on

" fast terminal
set ttyfast
"set synmaxcol=128
"syntax sync minlines=256
"set lazyredraw

" Use an older regex engine, which is supposedly faster for Ruby synaxt
" highlighting
set re=2
" Don't do expensive regex for ruby
let ruby_no_expensive=1

" automagically adds /g on a regex. /g to disable
set gdefault
set nohidden

set foldmethod=manual

" do not beep or flash at me
" vb is needed to stop beep
" t_vb sets visual bell action, we're nulling it out here)
set visualbell
set t_vb=
set noeb vb t_vb=
set vb t_vb=

" enable mouse for (a)ll, (n)ormal, (v)isual, (i)nsert, or (c)ommand line
" mode -- seems to work in most terminals
set mouse=a

" let me delete stuff like crazy in insert mode
"set backspace=indent,eol,start

" keep lots of command-line history
set history=3500

" check spelling
set nospell
set spl=en

" search
set hlsearch
set showmatch
set incsearch
set nu
set incsearch
set ignorecase
set smartcase

" display tab characters as 4 spaces, indent 4 spaces,
" always use spaces instead of tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smarttab
set smartindent

" This line blew up at me when I symlinked this file. no clue why
set listchars=tab:¿\ ,trail:·,nbsp:¬,extends:»,precedes:«
set list
" }}}

source ~/.config/vim/lightline.vim
source ~/.config/vim/nerdtree.vim
source ~/.config/vim/nerdcommenter.vim
source ~/.config/vim/buffergator.vim
source ~/.config/vim/gundo.vim
"source ~/.config/vim/ctrlp.vim
source ~/.config/vim/ocaml.vim
source ~/.config/vim/syntastic.vim
source ~/.config/vim/tagbar.vim
source ~/.config/vim/ale.vim
source ~/.config/vim/autocomplete.vim

" Searching {{{
set grepprg=egrep\ -nH\ $*
"if executable('ag')
  "let g:ackprg = 'ag --vimgrep'
"endif
" }}}

" Keymappings {{{
" use comma for the leader key
let mapleader = ","

" reformat a paragraph
nmap <leader>q gqip

" toggle nerdtree and Tagbar
noremap <silent> <F7> :NERDTreeToggle<CR>

" Buffergator stuff
noremap <silent> <F8> :BuffergatorTabsToggle<CR>
noremap <silent> <leader><F8> :BuffergatorToggle<CR>

" Gundo stuff
noremap <silent> <F9> :GundoToggle<CR>

" Tagbar stuff
nnoremap <silent> <F10> :TagbarToggle<CR>

" remove/hide highlighting from searches
map <silent> <F11> :set invhlsearch<CR>

"toggle paragraph formating
map <silent> <F12> :set fo+=t<CR>
map <silent> <leader><F12> :set fo-=t<CR>

nmap <silent> s :set spell<CR>
nnoremap <silent> <leader>s :set nospell<CR>

" display tabs - ,t will toggle (redraws just in case)
nmap <silent> <leader>t :set nolist!<CR>:redr<CR>

" Better space unfolding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
nnoremap <silent> zj o<Esc>,<F10>
nnoremap <silent> zk O<Esc>

" Better navigation on search results
map N Nzz
map n nzz

" dont deselect on indent
vnoremap < <gv
vnoremap > >gv

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

" Allow us to just use the normal movement keys with ctrl to move about the
" window panes
map <C-J> <C-W>j
map <C-K> <C-W>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" Disable F1 help and change it to esc
map <F1> <Esc>
imap <F1> <Esc>

" Highlight things
nnoremap <silent> <leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
nnoremap <silent> <leader>k :execute 'match Search /\%'.virtcol('.').'v/'<CR>
nnoremap <silent> <leader>j :call clearmatches()<CR>

" Highlight cursor line and columns
nnoremap <silent> <leader>c :set cursorline! cursorcolumn!<CR>
nnoremap <silent> <leader>z :set cursorline!<CR>
nnoremap <silent> <leader>x :set cursorcolumn!<CR>

" VCS things
"nnoremap <silent> <leader>b :VCSBlame<CR>
"nnoremap <silent> <leader>d :VCSDiff<CR>

" Copy full and short file paths to the clipboard
nmap <silent> <leader>yf :let @*=expand("%:p")<CR>
nmap <silent> <leader>ys :let @*=expand("%")<CR>

" Use a leader instead of the actual named binding
"nmap <leader>p :CtrlP<cr>

"" Easy bindings for its various modes
"nmap <leader>bb :CtrlPBuffer<cr>
"nmap <leader>bm :CtrlPMixed<cr>
"nmap <leader>bs :CtrlPMRU<cr>

" close, delete and move to the next buffer
"nmap <leader>bq :bp <BAR> bd #<cr>

" vim-fzf bindings
nmap <silent> <C-p> :Files<CR>
let g:fzf_action = {
  \ 'ctrl-a': 'toggle-all',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }
" }}}
