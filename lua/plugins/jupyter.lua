return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1001,
        opts = {
            rocks = { "magick" },
        },
    },
    {
        "3rd/image.nvim",
        dependencies = { "luarocks.nvim" },
        config = function()
            require("image").setup({
                backend = "kitty",
                integrations = {
                    markdown = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = true,
                        only_render_image_at_cursor = false,
                        filetypes = { "markdown", "vimwiki" },
                    },
                    neorg = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = true,
                        only_render_image_at_cursor = false,
                        filetypes = { "norg" },
                    },
                    html = {
                        enabled = false,
                    },
                    css = {
                        enabled = false,
                    },
                },
                max_width = 100,
                max_height = 12,
                max_height_window_percentage = math.huge,
                max_width_window_percentage = math.huge,
                window_overlap_clear_enabled = true,
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
            })
        end
    },
    {
        "benlubas/molten-nvim",
        version = "^1.0.0",
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
        end,
    },

}
