return {
  'Mofiqul/vscode.nvim',
  lazy = false,  -- Load immediately if you want it as your main colorscheme
  priority = 1000,  -- Load before other plugins (important for colorschemes)
  config = function()
    -- Set background before loading the theme
    vim.o.background = 'dark'

    -- Get colors for overrides
    local c = require('vscode.colors').get_colors()

    -- Configure the plugin
    require('vscode').setup({
      -- Enable transparent background
      transparent = true,

      -- Enable italic comment
      italic_comments = true,

      -- Enable italic inlay type hints
      italic_inlayhints = true,

      -- Underline `@markup.link.*` variants
      underline_links = true,

      -- Disable nvim-tree background color
      disable_nvimtree_bg = true,

      -- Apply theme colors to terminal
      terminal_colors = true,

      -- Override colors
      color_overrides = {
        vscLineNumber = '#FFFFFF',
      },

      -- Override highlight groups
      group_overrides = {
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
      }
    })

    -- Load the colorscheme
    vim.cmd.colorscheme "vscode"
  end,
}
