return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}

    vim.keymap.set("n", "<Leader>b", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
    vim.keymap.set("n", "<Leader>B", function() require("nvim-tree").open(vim.loop.cwd()) end, { desc = "Open NvimTree in CWD" })
  end,
}

