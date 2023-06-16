" Turn on syntax highlighting
syntax on

" Show line numbers relative to the cursor position
set number
set relativenumber

" Make <Tab> 4 spaces wide
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Set intendation based on file defaults
set smartindent

" Set case insensitive search
set ignorecase
set smartcase

" Start scrolling 4 lines before window edge
set scrolloff=4
set sidescrolloff=4

" Show current file name in terminal title
set title

" Set leader key to space
let mapleader=" "

" Builtin file menager
nnoremap <leader>fv :Ex <cr>
