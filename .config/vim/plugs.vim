call plug#begin()

" Manage itself
"Plug 'gmarik/Vundle.vim'
"Plug 'vim-scripts/L9'

" Git related bundles
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/vcscommand.vim'

" Utils
"Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'sjl/gundo.vim'

Plug 'itchyny/lightline.vim'

Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/syntastic'

Plug 'mg979/vim-visual-multi'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'

Plug 'AndrewRadev/switch.vim'

"Plug 'nathanaelkane/vim-indent-guides'

" Plug 'ervandew/supertab'
" Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/deoplete.nvim'

" Colors!
Plug 'joshdick/onedark.vim'

" Language additions
Plug 'dag/vim-fish'
Plug 'elixir-editors/vim-elixir'
Plug 'kchmck/vim-coffee-script'

" - Language Server suppport
Plug 'dense-analysis/ale'

" Quick fuzzy searching for files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
