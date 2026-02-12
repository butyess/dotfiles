return {
  "https://github.com/neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    vim.lsp.config('ty', {
      cmd = { 'uvx', 'ty', 'server' },
    })
    vim.lsp.enable('ty')
  end
}
