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

" Buffer line
" Plug 'ap/vim-buftabline'
" Plug 'vim-scripts/buftabs'
" Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'

call plug#end()

filetype plugin indent on

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set hidden
set number
set mouse=a
set completeopt=noinsert,menuone,noselect

map <Leader>y "+y
map <Leader>Y "+Y
map <Leader>p "+p
map <Leader>P "+P

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
let g:delimitMate_matchpairs = "(:),[:],{:}"
let g:delimitMate_quotes = "\" ' `"
let g:delimitMate_nesting_quotes = ['"','`']
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_inside_quotes = 1
let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_excluded_regions = "Comment,String"
let g:tex_flavor  = 'latex'
let g:tex_conceal='abdmg'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_latexmk = {
    \ 'build_dir': expand('%:r'),
    \}
let g:vimtex_compiler_progname = 'nvr'
let g:airline#extensions#tabline#enabled = 1

" au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['javascript', 'json=javascript', 'c', 'bash=sh', 'python']

command! Bd bp|bd #

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ncm2 options
au BufEnter * call ncm2#enable_for_buffer()
au TextChangedI * call ncm2#auto_trigger()
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
let g:ncm2#complete_length = [[1,1]]
inoremap <silent> <expr> <c-x> ncm2_ultisnips#expand_or("\<c-x>", 'n')
" inoremap <c-x> <c-r>=ncm2#force_trigger(...)<cr>
