local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
}
require('luasnip.loaders.from_vscode').lazy_load({
  paths = { './snippets' },
})
require("luasnip.loaders.from_lua").load({ paths = { "./snippets" } })

local lspkind = require('lspkind')
local lspkind_formatter = lspkind.cmp_format({
  mode = 'symbol',
  maxwidth = 50,
  ellipsis_char = '...',
  before = function(_, vim_item)
    return vim_item
  end
})

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = "path" }
  },
  formatting = {
    format = function(entry, item)
      lspkind_formatter(entry, item)
      return require("tailwindcss-colorizer-cmp").formatter(entry, item)
    end
  }
}
