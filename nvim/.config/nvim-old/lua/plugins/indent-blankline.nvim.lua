return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
  priority = 1,
  config = function()
    require("ibl").setup()
  end,
}
