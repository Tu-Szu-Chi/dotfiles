syntax on
colorscheme jellybeans
set background=dark

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab

"Indent
set noautoindent
set cindent

set wildignore+=**/node_modules/*
set wildignore+=**/.git/*
set wildignore+=**/dist/*
set relativenumber
" set nohlsearch
set hidden
set noerrorbells
set noswapfile
set nobackup
set nowritebackup
set incsearch
set scrolloff=8
set signcolumn=yes
set termguicolors " this variable must be enabled for colors to be applied properly
"Avoid using zsh in vim
set shell=/bin/bash
" Default to system clipboard
set clipboard+=unnamedplus
call plug#begin('~/.vim/plugged')
" Need to install 'brew install ripgrep'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-lua/completion-nvim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
"Git
Plug 'tpope/vim-fugitive'
"LSP
"Plug 'neovim/nvim-lspconfig'
"Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'rafamadriz/friendly-snippets'
" Autocompletion
"Plug 'hrsh7th/nvim-cmp'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'L3MON4D3/LuaSnip'
"Plug 'saadparwaiz1/cmp_luasnip'
"Plug 'onsails/lspkind-nvim'
"Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Buffer management
Plug 'akinsho/bufferline.nvim'
"Comment out
Plug 'tpope/vim-commentary'
call plug#end()

let mapleader = " "
"nnoremap <leader>ps :Telescope find_files<CR>
"nnoremap <leader>fs :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <leader>fs :Telescope live_grep<CR>
nnoremap <leader>ps :Telescope find_files<CR>
nnoremap <leader>ws :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>rl :source $MYVIMRC<CR>
nnoremap <silent><leader>q :q<CR>
"Line movement
nnoremap <A-Down> :m+<CR>
inoremap <A-Up> <Esc>:m-2<CR>
inoremap <A-Down> <Esc>:m+<CR>
vnoremap <A-Up> :<C-u>silent! '<,'>move-2<CR>gv=gv 
vnoremap <A-Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv

" Delete all buffers expect current
nnoremap <leader>y "*y
nnoremap <leader>p "*p
nnoremap <leader>ba :%bd<bar>e
nnoremap <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR> 

" Select all
nmap <leader>all gg<S-v>G
" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
