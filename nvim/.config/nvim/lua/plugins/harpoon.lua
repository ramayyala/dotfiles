return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup({})

            local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.values)
                end

                require("telescope.pickers")
                    .new({}, {
                        prompt_title = "Harpoon",
                        finder = require("telescope.finders").new_table({
                            results = file_paths,
                        }),
                        previewer = conf.file_previewer({}),
                        sorter = conf.generic_sorter({}),
                    })
                    :find()
            end

            -- keymaps
            -- local function map(lhs, rhs, opts)
            -- 	vim.keymap.set("n", lhs, rhs, opts or {})
            -- end
            vim.keymap.set("n", "<leader>a", function()
                harpoon:list():add()
            end)
            vim.keymap.set("n", "<leader><leader>", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)

            -- vim.keymap.set("n", "<C-e>", function()
            -- toggle_telescope(harpoon:list())
            -- end, { desc = "Open harpoon window" })

            vim.keymap.set("n", "<C-1>", function()
                harpoon:list():select(1)
            end)
            vim.keymap.set("n", "<C-2>", function()
                harpoon:list():select(2)
            end)
            vim.keymap.set("n", "<C-3>", function()
                harpoon:list():select(3)
            end)
            vim.keymap.set("n", "<C-4>", function()
                harpoon:list():select(4)
            end)
        end,
    },
}
