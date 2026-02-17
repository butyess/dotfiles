return {
  "lukas-reineke/indent-blankline.nvim",
  tag = "v3.9.1",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
  priority = 1,
  config = function()
    require("ibl").setup()
  end,
}
