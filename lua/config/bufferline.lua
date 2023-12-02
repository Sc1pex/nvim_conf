require("bufferline").setup {
  options = {
    offsets = {
      {
        filetype = "neo-tree",
        text = "Files",
        highlight = "Directory",
        text_align = "left"
      }
    },
    numbers = function(opts) return string.format('%s', opts.raise(opts.ordinal)) end,
  },
  highlights = {}
}
