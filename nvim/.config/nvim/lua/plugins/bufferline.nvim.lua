return {
  'akinsho/bufferline.nvim',
  version = "v4.9.1",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    local bufferline = require("bufferline")
    bufferline.setup {
      options = {
        indicator = {
          style = 'underline',
        },
        tab_size = 10,
        color_icons = true,
      }
    }
  end
}
