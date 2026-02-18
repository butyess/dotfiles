vim.treesitter.start()

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- Optional: Disable folding by default on buffer entry, use 'zo'/'zc' to manually manage folds
vim.opt.foldenable = false

