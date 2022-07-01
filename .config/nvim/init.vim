"--- Vim Settings
set termguicolors
set number
set wrap
filetype plugin indent on
set noswapfile
set expandtab
set tabstop=4
set shiftwidth=4
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
set sidescroll=1
set clipboard=unnamedplus
colorscheme pablo
set cursorline
autocmd BufRead,BufNewFile SCons{truct,cript} set filetype=python

let g:loaded_perl_provider = 0

highlight Special	 guifg=#00ffff
highlight PreProc	 guifg=DarkRed gui=bold
highlight Search guibg=DarkMagenta guifg=NONE

xnoremap<C-y> "+y
nnoremap<C-p> "+p

nnoremap<C-N> :tabN<CR>
nnoremap<C-n> :tabn<CR>
nnoremap<C-l> :nohlsearch<CR>

"Coc commands
nnoremap<leader>c :CocFzfList commands<CR>
nnoremap<leader>fo :CocCommand editor.action.formatDocument<CR>
nnoremap<leader>cr :CocRestart<CR>

"Coc-clangd Switch Header
nnoremap<leader>sh :CocCommand clangd.switchSourceHeader<CR>

"Git commands
nnoremap<leader>gl :CocCommand fzf-preview.GitLogs<CR>
nnoremap<leader>gs :CocCommand fzf-preview.GitStatus<CR>
nnoremap<leader>gb :CocCommand fzf-preview.GitBranches<CR>
nnoremap<leader>gc :CocList commits<CR>

"Floaterm
nnoremap<leader>ft :FloatermToggle<CR>
nnoremap<leader>fn :FloatermNew<CR>
nnoremap<leader>f> :FloatermNext<CR>
nnoremap<leader>f< :FloatermPrev<CR>
let g:floaterm_autoclose = 1

"Editor commands
nnoremap<leader>` :CocCommand fzf-preview.Marks<CR>
nnoremap<leader>v :vsplit<CR>
nnoremap<leader>h :split<CR>
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
nnoremap<leader>o :CocFzfList outline<CR>
nnoremap<leader>ff :FZF<CR>
nnoremap <leader>tf :lua  require('plug-conf._telescope').select_compiledb()<CR>



" compilation database stuff
function! Update_compiledb(path)
    " let s:full_path = getcwd() . "/" . a:path
    let s:full_path = "/home/josh/projects/fsae/firmware/" . a:path
    execute "!ln -fs " . s:full_path . " compile_commands.json"
endfunction

"--- Vim Plug
call plug#begin()
 Plug 'junegunn/vim-easy-align'
 Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'vim-syntastic/syntastic'
 Plug 'Raimondi/delimitMate'
 Plug 'cjuniet/clang-format.vim'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'antoinemadec/coc-fzf'
 Plug 'preservim/nerdtree'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'voldikss/vim-floaterm'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'folke/todo-comments.nvim'
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

 "Holding for nerdtree - installed through emerge
call plug#end()

"--- Syntastic
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
let g:NERDTreeWinSize=25
nnoremap<leader>nt :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/DoxygenToolkit.vim

let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader=""
let g:DoxygenToolkit_blockFooter=""
let g:DoxygenToolkit_authorName="Joshua Lafleur (josh.lafleur@outlook.com)"

lua << EOF
  require("init")
EOF
