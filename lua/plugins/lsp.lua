return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',

      'hrsh7th/cmp-path',
    },
  },

  { 'onsails/lspkind.nvim' },

  { 'jose-elias-alvarez/null-ls.nvim' },
  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'jose-elias-alvarez/null-ls.nvim',
    },
  },

  { 'roobert/tailwindcss-colorizer-cmp.nvim' },

  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_view_general_viewer = 'evince'

      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_format_enabled = 1
    end
  },
  {
    "peterbjorgensen/sved",
  },

  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      panel = {
        enable = true,
        auto_refresh = true,
      },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = '<c-b>',
        },
      },
      filetypes = {
        javascript = true,
        typescript = true,
        javascriptreact = true,
        typescriptreact = true,
        ["*"] = false,
      }
    },
  },

  { "folke/neoconf.nvim" },

  { 'Civitasv/cmake-tools.nvim' }
}
