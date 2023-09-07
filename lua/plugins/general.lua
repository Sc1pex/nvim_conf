return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  {
    'catppuccin/nvim',
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      show_trailing_blankline_indent = false,
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- TODO: change mapping
  { 'numToStr/Comment.nvim', opts = {} },
}
