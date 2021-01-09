set conceallevel=2

let g:tex_flavor = 'latex'
let g:tex_conceal = 'abdmgs'

let g:vimtex_enabled = 1
let g:vimtex_complete_close_braces = 1
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = { 'build_dir': 'build', }
