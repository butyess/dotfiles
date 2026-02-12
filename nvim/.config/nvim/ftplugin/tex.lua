vim.opt.conceallevel = 2

vim.g.tex_flavor = 'latex'
vim.g.tex_conceal = 'abdmgs'

vim.g.vimtex_enabled = 1
vim.g.vimtex_complete_close_braces = 1
vim.g.vimtex_view_general_viewer = 'zathura'
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = { build_dir = 'build' }

vim.opt.iskeyword:remove({ '{', '}' })
