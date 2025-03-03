return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "lua", "python", "r", "bash","hyprlang" },
            highlight = { enable = true },
            indent = { enable = true },
            vim.filetype.add({
                pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
            }),
        })
    end,
}
