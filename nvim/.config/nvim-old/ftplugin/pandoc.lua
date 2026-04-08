vim.cmd('UltiSnipsAddFiletypes pandoc.markdown')
vim.opt.conceallevel = 1
vim.keymap.set('n', '<Leader>kv', ':Pandoc! pdf<CR>', { buffer = 0 })
vim.keymap.set('n', '<Leader>kk', ':Pandoc pdf<CR>', { buffer = 0 })
