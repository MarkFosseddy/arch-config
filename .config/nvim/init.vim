call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'itchyny/lightline.vim'
Plug 'cocopon/iceberg.vim'
call plug#end()

lua require('telescope').setup { defaults = { file_ignore_patterns = {"node_modules"} } }

set completeopt=menuone,noinsert,noselect
set shortmess+=c

set termguicolors
colorscheme monochrome
let g:lightline = {'colorscheme': 'iceberg'}

set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

set number
set nu
set relativenumber
set noshowmode

set nohlsearch
set incsearch

set noerrorbells

set nowrap
set hidden

set signcolumn=yes
set colorcolumn=80
set scrolloff=20

set listchars=trail:·
set list

let mapleader = " "

nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fs :lua require('telescope.builtin').grep_string()<cr>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
