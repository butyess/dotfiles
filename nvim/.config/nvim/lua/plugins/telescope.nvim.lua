return {
  'nvim-telescope/telescope.nvim', tag = 'v0.2.1',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- optional but recommended
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require('telescope').setup{
      defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
          n = {
              ['<c-d>'] = require('telescope.actions').delete_buffer
          },
          i = {
            ['<c-d>'] = require('telescope.actions').delete_buffer
          }
        }
      },
    }
  end,
}
