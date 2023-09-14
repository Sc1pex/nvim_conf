vim.keymap.set('n', '\\', '<cmd>vsplit<cr>')
vim.keymap.set('n', '|', '<cmd>split<cr>')

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<leader>w', ':w<cr>')

-- Telescope
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<c-p>', require('telescope.builtin').find_files, { desc = 'Search files' })
vim.keymap.set('n', '<c-g>', require('telescope.builtin').git_files, { desc = 'Search files' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'Find current word' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Find Grep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Find Diagnostics' })

vim.keymap.set('n', '<leader>e', "<cmd>Neotree toggle<cr>")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Buffer navigation
vim.keymap.set('n', 'L', '<cmd>BufferLineCycleNext<cr>')
vim.keymap.set('n', 'H', '<cmd>BufferLineCyclePrev<cr>')
vim.keymap.set('n', '<leader>c', ':bd<cr>')

-- Session manager
vim.keymap.set('n', '<leader>ss', ':SessionManager save_current_session<cr>')
vim.keymap.set('n', '<leader>sl', ':SessionManager load_session<cr>')
vim.keymap.set('n', '<leader>sL', ':SessionManager load_last_session<cr>')
vim.keymap.set('n', '<leader>sd', ':SessionManager delete_session<cr>')
