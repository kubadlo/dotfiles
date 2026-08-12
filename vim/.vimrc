" Turn on syntax highlighting
syntax on

" Enable mouse support
set mouse=a

" Show line numbers relative to the cursor position
set number
set relativenumber

" Make <Tab> 4 spaces wide
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" Set indentation based on file defaults
set smartindent
set breakindent

" Set case insensitive search
set ignorecase
set smartcase

" Show search results while typing
set incsearch

" Disable word wrapping
set nowrap

" Make splits more consistent
set splitbelow
set splitright

" Start scrolling 5 lines before window edge
set scrolloff=5
set sidescrolloff=5

" Show current file name in terminal title
set title

" Confirm changes before exiting modified buffer
set confirm

" Set leader key to space
let mapleader=" "

" Builtin file menager
nnoremap <leader>fv :Ex <cr>
