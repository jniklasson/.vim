" GENERAL
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set relativenumber
set cursorline
set cursorlineopt=number
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set noswapfile
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set showcmd
set showmode
set history=1000
set wildmenu
set wildmode=list:longest
set noswapfile
set mouse=a
set hidden
set updatetime=500
set signcolumn=yes

""" COLORSCHEMES
if filereadable(expand("$HOME/.vim/colors/gruvbox.vim"))
    colorscheme gruvbox
    set background=dark
endif

""" PLUGINS
call plug#begin()
    Plug 'dense-analysis/ale'
    Plug 'preservevim/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-fugitive'
call plug#end()

set omnifunc=ale#completion#OmniFunc

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_tab_count=1
let g:airline#extensions#ale#enabled=1
let g:airline_power_fonts=1

let g:ale_linters = {'python': ['flake8', 'pylsp']}
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'python': ['black'],
            \}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_completion_enabled = 1

""" REMAPS
let mapleader = ","

nnoremap o o<esc>
nnoremap O O<esc>
nnoremap Y y$
noremap E $
noremap B 0
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

nnoremap <leader>w :w<CR>
nnoremap gf <C-w>gf

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>m :make<CR>

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>": "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>": "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>": "\<CR>"


augroup Binary
    au!
    au BufReadPre *.out,*.bin,*.hex let &bin=1
    au BufReadPost *.out,*.bin,*.hex if &bin | %!xxd 
    au BufReadPost *.out,*.bin,*.hex set ft=xxd | endif
    au BufWritePre *.out,*.bin,*.hex if &bin | %!xxd -r
    au BufWritePre *.out,*.bin,*.hex endif
    au BufWritePost *.out,*.bin,*.hex if &bin | %!xxd
    au BufWritePost *.out,*.bin,*.hex set nomod | endif 





























