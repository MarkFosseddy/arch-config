call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'itchyny/lightline.vim'
Plug 'cocopon/iceberg.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'sheerun/vim-polyglot'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

lua require('lspconfig').gopls.setup{on_attach=require('completion').on_attach}
lua require('lspconfig').rust_analyzer.setup{on_attach=require('completion').on_attach}
lua require('lspconfig').tsserver.setup{on_attach=require('completion').on_attach}

lua require('telescope').setup { defaults = { file_ignore_patterns = {"node_modules"} } }

set completeopt=menuone,noinsert,noselect
set shortmess+=c

set termguicolors
colorscheme monochrome
let g:lightline = {'colorscheme': 'iceberg'}

set softtabstop=2
set tabstop=2
set shiftwidth=2
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

let mapleader = " "

nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fs :lua require('telescope.builtin').grep_string()<cr>

nnoremap <leader>vv :lua vim.lsp.buf.hover()<cr>
nnoremap <leader>vr :lua vim.lsp.buf.rename()<cr>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<cr>
nnoremap <leader>vd :lua vim.lsp.buf.definition()<cr>
nnoremap <leader>va :lua vim.lsp.buf.code_action()<cr>
nnoremap <leader>ve :lua vim.lsp.diagnostic.show_line_diagnostics()<cr>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
