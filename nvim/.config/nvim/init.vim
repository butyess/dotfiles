call plug#begin(stdpath('data') . '/plugged')

Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'Raimondi/delimitMate'
Plug 'kovetskiy/sxhkd-vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'vim-pandoc/vim-pandoc'
Plug 'Marfisc/vim-pandoc' " following https://github.com/vim-pandoc/vim-pandoc/pull/385
Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'morhetz/gruvbox'
" Plug 'chriskempson/base16-vim'
Plug 'neovimhaskell/haskell-vim'

" Buffer line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

filetype plugin indent on

set expandtab
set tabstop=4
set shiftwidth=4
set nosmarttab

set hidden
set number
set mousemodel=extend
set completeopt=noinsert,menuone,noselect

set textwidth=0
set wrapmargin=0

command! Bd bp|bd #

map <Leader>y "+y
map <Leader>Y "+Y
map <Leader>p "+p
map <Leader>P "+P

tnoremap <Esc> <C-\><C-n>

let g:python_host_prog = '$HOME/.pyenv/neovim2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/neovim3/bin/python'
let g:iskeyword = 'a-z,A-Z,48-57,_,.,-,>,{,},[,],(,),:'
let g:netrw_browser_split = 4
let g:netrw_winsize = 18
let g:netrw_banner = 0
let g:netrw_preview = 1
let g:netrw_list_hide='\.o,\.obj,*\~,\.pyc,'
let g:netrw_list_hide.='\.pyenv,'
let g:netrw_list_hide.='\.git,'
let g:netrw_list_hide.='\.tmp,'
let g:UltiSnipsEditSplit="vertical"
let g:delimitMate_nesting_quotes = ['"','`']
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_inside_quotes = 1
let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_excluded_regions = "Comment,String"
let g:tex_flavor  = 'latex'
let g:tex_conceal = "abdmgs"
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_fold_manual = 1
" let g:vimtex_latexmk_continuous = 1 "Deprecated
let g:vimtex_compiler_latexmk = {
    \ 'build_dir': expand('%:r'),
    \}
let g:vimtex_compiler_progname = 'nvr'
let PandocOpen = {file -> 'xdg-open' . shellescape(fnamemodify(a:file, ':p'))}
let g:pandoc#command#custom_open = "PandocOpen"
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#folding#fold_fenced_codeblocks = 1
let g:pandoc#modules#disabled = ["bibliographies", "completion", "spell"]
let g:markdown_fenced_languages = ['javascript', 'json=javascript', 'c', 'C=c',
            \ 'bash=sh', 'python', 'java', 'haskell', 'rust']
let g:pandoc#syntax#codeblocks#embeds#langs = g:markdown_fenced_languages
let g:pandoc#syntax#conceal#use = 0
let g:haskell_indent_disable = 1

"" Theme
" let g:gruvbox_italic=1
" let g:grubvox_contrast_light="hard"
" set background=dark
" set termguicolors
" colorscheme base16-default-dark
hi Normal ctermbg=Black
hi NonText ctermbg=Black
let g:airline_theme='zenburn'

" airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" ncm2
au BufEnter * call ncm2#enable_for_buffer()
au TextChangedI * call ncm2#auto_trigger()
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" let g:ncm2#complete_length = [[1,1]]
" inoremap <silent> <expr> <c-x> ncm2_ultisnips#expand_or("\<c-x>", 'n')
" inoremap <c-x> <c-r>=ncm2#force_trigger(...)<cr>
"
"""""""""""""""""""
" Useful commands "
"""""""""""""""""""
" :set buflisted - set the buffer to listed, use to stick help pages
" :help <> | only - open help page as single window
" :so ~/.config/nvim/init.vim - reload init.vim
" :put = range(1,100) or :0put = range(1,100) to avoid blank line at top
" `gq` is opposite of `J`
" `gj` and `gh` to navigate in a wrapped line
