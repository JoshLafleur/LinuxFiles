"--- Vim Settings
set number
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set incsearch
set hlsearch
set ruler
set mouse=a
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set confirm
set hidden
set history=1000
set belloff=all
set cmdheight=2
set shortmess+=c
set scrolloff=10
syntax enable
set wildmenu
set backspace=indent,eol,start
"set spell
set wildignore=.jpeg,.png,.swp
set showtabline=2
nnoremap<C-Left> :tabN<CR>
nnoremap<C-Right> :tabn<CR>
nnoremap<C-l> :nohlsearch<CR>

"--- Vim Plug
call plug#begin()
 Plug 'junegunn/vim-easy-align'
 Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'vim-syntastic/syntastic'
 Plug 'Raimondi/delimitMate'
 "Holding place for Airline - installed through emerge
 "Holding for nerdtree - installed through emerge
call plug#end()

"--- Syntastic
execute pathogen#infect()
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END
"set statusline+=%warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_error_symbol='X'
let g:syntastic_warning_symbol='W'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 0

"--- delimitMate
let delimitMate_expenad_cr = 2
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["'"]
  au FileType text let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"--- NERDTree
let g:NERDTreeWinSize=20
nnoremap<F7> :NERDTreeToggle<CR>
