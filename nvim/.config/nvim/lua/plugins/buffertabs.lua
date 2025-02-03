return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup({})
            -- buffers
            vim.keymap.set("n", "<leader><Tab>", ":bn<cr>")
            vim.keymap.set("n", "<leader>p", ":bp<cr>")
            vim.keymap.set("n", "<leader>w", ":bd<cr>")
		end,
	},
}
