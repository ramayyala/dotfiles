return {
    {
        "0x00-ketsu/markdown-preview.nvim",
        config = function()
            require("markdown-preview").setup({
                vim.keymap.set("n", "<leader>mt", ":MPToggle<cr>")
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the setup section below
            })
        end,
    },
}
