call plug#begin('~/.local/share/nvim/plugged')

Plug 'lervag/vimtex'
Plug '907th/vim-auto-save'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mhartington/oceanic-next'
Plug 'ryanoasis/vim-devicons'
Plug 'fneu/breezy'
Plug 'Raimondi/delimitMate'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'kovetskiy/sxhkd-vim'

call plug#end()

""""""""""""""""""""""""""
"  NVIM GENERAL OPTIONS  "
""""""""""""""""""""""""""
set nocompatible
syntax on
filetype plugin indent on
set hidden

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set noshowmode
set number
set encoding=UTF-8
"" sets first option in completition already selected
set completeopt=menu,noinsert
let maplocalleader = "\\"
set cmdheight=2
set updatetime=300
set signcolumn=yes
set mouse=a

" Python options for interpreter,
" See :h nvim-python or
" https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
let g:python_host_prog = '$HOME/.pyenv/neovim2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/neovim3/bin/python'

map <Leader>y "+y
map <Leader>p "+p

"" Custom commands
command Bd bp\|bd \#

" Theme
syntax enable
if (has("termguicolors"))
 set termguicolors
endif
set background=dark
" Custom theme options
let g:gruvbox_italic=1
colorscheme gruvbox
" Enable transparent background
hi Normal guibg=NONE ctermbg=NONE

" Deoplete
let g:deoplete#enable_at_startup = 0

" Airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

""" COC Options
" Please read with love and accuracy the docs on github.
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Vimtex
let g:tex_flavor  = 'latex'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_latexmk = {
    \ 'build_dir': expand('%:r'),
    \}
let g:vimtex_compiler_progname = 'nvr'
let g:tex_conceal='abdmg'
set conceallevel=1

" UltiSnippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['$HOME/.config/nvim/UltiSnips']

" DelimtMate options
au FileType tex let b:delimitMate_matchpairs = "{:}"

" Netrw options
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25
