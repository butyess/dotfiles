return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Status updates for LSP.
    { 'j-hui/fidget.nvim', opts = {} },
    -- Completion engine and sources
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    -- Snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()

    vim.lsp.config('ty', {
      cmd = { 'uvx', 'ty', 'server' },
    })
    vim.lsp.enable('ty')

    local cmp = require('cmp')
    local cmp_lsp = require('cmp_nvim_lsp')

    -- Broadcast enhanced capabilities to all LSP servers
    vim.lsp.config('*', {
      capabilities = cmp_lsp.default_capabilities(),
    })

    -- nvim-cmp setup
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = "path" },
        { name = 'buffer' },
      }),
    })

    -- LspAttach keybindings
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local opts = { buffer = ev.buf }

        -- Global LSP defaults (explicitly set)
        vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, 'gra', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'grr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'grt', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gO', vim.lsp.buf.document_symbol, opts)
        vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, opts)

      end,
    })

  end
}

