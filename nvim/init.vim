call plug#begin('~/.local/share/nvim/plugged')

Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'ryanoasis/vim-devicons'
Plug 'Raimondi/delimitMate'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'kovetskiy/sxhkd-vim'
Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

""""""""""""""""""""""""""
"  NVIM GENERAL OPTIONS  "
""""""""""""""""""""""""""
set nocompatible
syntax on
filetype on
set hidden

"" see after/ftplugin to see custom indentation per filetype
filetype plugin indent on

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set noshowmode
set number
set encoding=UTF-8
let maplocalleader = "\\"
set cmdheight=2
set updatetime=300
set signcolumn=yes
set mouse=a

" Python options for interpreter,
" See :h nvim-python
let g:python_host_prog = '$HOME/.pyenv/neovim2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/neovim3/bin/python'

map <Leader>y "+y
map <Leader>p "+p

""""""""""""""""""""""""""""""""
"   PLUGINS & THEMES OPTIONS   "
""""""""""""""""""""""""""""""""

" Theme
syntax enable
if (has("termguicolors"))
 set termguicolors
endif
set background=dark

" Custom theme: gruvbox
let g:gruvbox_italic=1
colorscheme gruvbox

" Enable transparent background
hi Normal guibg=NONE ctermbg=NONE

" Needed when :Goyo!
augroup my-colors
  autocmd!
  autocmd ColorScheme * hi Normal guibg=NONE ctermbg=NONE
augroup END

" Airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" COC Options
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Vimtex
let g:tex_flavor  = 'latex'
"let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_latexmk = {
    \ 'build_dir': expand('%:r'),
    \}
let g:vimtex_compiler_progname = 'nvr'
let g:tex_conceal='abdmg'

" UltiSnippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['$HOME/.config/nvim/UltiSnips']

" Netrw options
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25

" Goyo
let g:goyo_width = 95
au User GoyoEnter :highlight EndOfBuffer ctermfg=black ctermbg=black
au User GoyoEnter :let b:coc_suggest_disable=1
au User GoyoLeave :let b:coc_suggest_disable=0

" Pandoc
let g:pandoc#modules#disabled = ["folding", "spell", "completion", "formatting"]
let g:pandoc#command#autoexec_on_writes = 0
let g:pandoc#command#autoexec_command = "Pandoc! pdf"

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2

"""""""""""""""""""
" Useful commands "
"""""""""""""""""""
" :set buflisted - set the buffer to listed, use to stick help pages
" :help <> | only - open help page as single window
" :so ~/.config/nvim/init.vim - reload init.vim
" :put = range(1,100) or :0put = range(1,100) to avoid blank line at top

