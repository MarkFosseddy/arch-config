call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'itchyny/lightline.vim'

Plug 'digitaltoad/vim-pug'

Plug 'L3MON4D3/luasnip'
call plug#end()

set termguicolors
colorscheme monochrome

let g:lightline = {
\   'colorscheme': 'monochrome',
\   'tabline': {
\       'left': [[ 'tabs' ]],
\       'right': [['']]
\   },
\   'tab': {
\       'active': [ 'tabnum', 'filename', 'modified' ],
\       'inactive': [ 'tabnum', 'filename', 'modified' ]
\   }
\ }

lua require('luasnip').config.set_config({
\   history = false,
\   updateevents = 'TextChangedI'
\ })

lua require('luasnip/loaders/from_vscode').load({
\   paths = {'/home/fosseddy/.config/nvim/snippets'}
\ })

lua require('telescope').setup {
\   defaults = {
\       file_ignore_patterns = {'node_modules'}
\   }
\ }

set softtabstop=4
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab

set number
set relativenumber
set noshowmode

set tabpagemax=5

set nohlsearch
set incsearch

set noerrorbells

set nowrap
set hidden

set signcolumn=yes
set colorcolumn=80
set scrolloff=20

set listchars=trail:·,tab:▸\ 
set list

set splitbelow
set splitright

let mapleader = ' '

" Telescope
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fs :lua require('telescope.builtin').grep_string()<cr>

" Tabs
nnoremap <leader>t1 1gt
nnoremap <leader>t2 2gt
nnoremap <leader>t3 3gt
nnoremap <leader>t4 4gt
nnoremap <leader>t5 5gt
nnoremap <leader>t6 6gt
nnoremap <leader>t7 7gt
nnoremap <leader>t8 8gt
nnoremap <leader>t9 9gt
nnoremap <leader>th :tabfirst<cr>
nnoremap <leader>tj :tabprev<cr>
nnoremap <leader>tk :tabnext<cr>
nnoremap <leader>tl :tablast<cr>

" Popup menu
inoremap <expr> <Tab> pumvisible() ? '\<C-n>' : '\<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '\<C-p>' : '\<S-Tab>'

" LuaSnip
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
nnoremap <leader>ss :LuaSnipUnlinkCurrent<cr>
