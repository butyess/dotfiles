-- [[ Options ]]

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Copy/paste
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y')
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p')
vim.keymap.set({'n', 'v'}, '<leader>P', '"+P')

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Navigate error not all diagnostics
vim.keymap.set('n', ']e', function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set('n', '[e', function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)

-- Reload current file (preserving cursor and scroll position)
vim.keymap.set('n', '<leader>r', function()
  local view = vim.fn.winsaveview()
  vim.cmd('e')
  vim.fn.winrestview(view)
end, { desc = 'Reload current file' })

-- Enable fold but do not fold by default
vim.opt.foldlevelstart = 99
vim.opt.number = true
vim.opt.relativenumber = true

-- Persistent folds configuration
vim.opt.viewoptions = 'folds,cursor,curdir'
vim.opt.viewdir = vim.fn.stdpath('data') .. '/view'

-- Other options
vim.g.have_nerd_font = false
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.signcolumn = 'yes'
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 0
vim.o.wrap = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- [[ Autocommands ]]

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank { timeout = 200 } end,
})

-- Persistent folds - save and restore fold states when switching buffers
vim.api.nvim_create_autocmd('BufWinLeave', {
  desc = 'Save fold state when leaving buffer',
  group = vim.api.nvim_create_augroup('persistent-folds', { clear = true }),
  pattern = '*',
  callback = function()
    if vim.bo.buftype == '' and vim.fn.expand('%') ~= '' then
      vim.cmd('mkview!')
    end
  end,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  desc = 'Restore fold state when entering buffer',
  group = vim.api.nvim_create_augroup('persistent-folds', { clear = false }),
  pattern = '*',
  callback = function()
    if vim.bo.buftype == '' and vim.fn.expand('%') ~= '' then
      vim.cmd('silent! loadview')
    end
  end,
})

-- Restore cursor position on file open
vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Restore cursor position on file open',
  group = vim.api.nvim_create_augroup('kickstart-restore-cursor', { clear = true }),
  pattern = '*',
  callback = function()
    local line = vim.fn.line '\'"'
    if line > 1 and line <= vim.fn.line '$' then
      vim.cmd 'normal! g\'"'
    end
  end,
})

-- [[ Plugins ]]

vim.pack.add({
  { src="https://github.com/nvim-mini/mini.nvim.git", version="main" },
  { src="https://github.com/stevearc/oil.nvim", version="master" },
  { src="https://github.com/folke/persistence.nvim", version="main" },
  { src="https://github.com/neovim/nvim-lspconfig", version="master" },
  { src="https://github.com/nvim-treesitter/nvim-treesitter", version="main" },
  { src="https://github.com/nvim-tree/nvim-tree.lua", version="master" },
  { src="https://github.com/rebelot/kanagawa.nvim", version="master" },
  { src="https://github.com/mofiqul/vscode.nvim", version="main" },
})

-- Color scheme
require("vscode").setup({
  color_overrides = {
    vscCursorDarkDark = '#2a2a2a',
  },
})
vim.cmd.colorscheme("vscode")

-- Mini
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()

require('mini.tabline').setup()
require('mini.diff').setup()
require('mini.indentscope').setup()
require('mini.indentscope').gen_animation.none()
require('mini.cursorword').setup()
require('mini.completion').setup()

require('mini.bufremove').setup()
vim.keymap.set("n", "<leader>x", function() require("mini.bufremove").delete() end, { desc = "Delete buffer (keep window layout)" })
vim.keymap.set("n", "<leader>X", function() require("mini.bufremove").delete(0, true) end, { desc = "Force delete buffer (keep window layout)" })

require('mini.pick').setup()
vim.keymap.set('n', '<leader>ff', MiniPick.builtin.files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', MiniPick.builtin.grep_live, { desc = 'Live grep' })
-- pick buffer with wiping option
local wipeout_cur = function()
  MiniBufremove.delete(MiniPick.get_picker_matches().current.bufnr)
  MiniPick.refresh()
end
local buffer_mappings = { wipeout = { char = '<C-d>', func = wipeout_cur } }
vim.keymap.set(
  'n',
  '<leader>fb',
  function()
    MiniPick.builtin.buffers(local_opts, { mappings = buffer_mappings })
  end,
  { desc = 'Buffers' }
)

-- Oil
require('oil').setup({
  buf_options = {
    buflisted = true,
    bufhidden = "hide",
  },
})

-- Persistence
require('persistence').setup({
  dir = vim.fn.stdpath('state') .. '/sessions/',
  options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'folds' },
  pre_save = nil,
  save_empty = false,
})
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)  -- current dir
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end) -- select
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end)  -- last session
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)  -- don't save

-- Treesitter
vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end })
require('nvim-treesitter').install({ 'python', 'json', 'markdown', 'wgsl' })
require('nvim-treesitter').setup()

-- LSP
vim.lsp.enable({ 'lua_ls' })

vim.lsp.config('basedpyright', {
  cmd = { 'uvx', '--from', 'basedpyright', 'basedpyright-langserver', '--stdio', },
  settings = {
    basedpyright = {
      analysis = {
        -- logLevel = "Error",
        typeCheckingMode = "standard",
      }
    },
  },
})
vim.lsp.enable("basedpyright")

vim.lsp.config('wgsl_analyzer', {
  cmd = { "wgsl-analyzer" },
  filetypes = { "wgsl" },
  root_markers = { ".git" },
})
vim.lsp.enable('wgsl_analyzer')

-- Nvim Tree
require('nvim-tree').setup()
vim.keymap.set("n", "<Leader>b", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
vim.keymap.set("n", "<Leader>B", function() require("nvim-tree").open(vim.loop.cwd()) end, { desc = "Open NvimTree in CWD" })

