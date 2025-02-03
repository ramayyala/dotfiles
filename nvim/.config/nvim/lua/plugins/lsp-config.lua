return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "awk_ls",
                    "bashls",
                    "cssls",
                    "html",
                    "lua_ls",
                    "markdown_oxide",
                    "marksman",
                    "pyright",
                    "r_language_server",
                    "sqlls",
                    "yamlls",
                },
                automatic_installation = true,
            })
        end,
    },
    -- Mason Null-LS for formatters and linters
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            local mason_null_ls = require("mason-null-ls")

            mason_null_ls.setup({
                ensure_installed = {
                    -- Linters
                    "actionlint",
                    "markdownlint",
                    "pylint",
                    "selene",
                    -- Formatters
                    "beautysh",
                    "black",
                    "isort",
                    "markdownlint",
                    "stylua",
                },
                automatic_installation = true,
            })

            local null_ls = require("null-ls")
            -- Setup null-ls with formatters and linters
            null_ls.setup({
                sources = {
                    null_ls.builtins.diagnostics.actionlint,
                    null_ls.builtins.diagnostics.markdownlint,
                    null_ls.builtins.diagnostics.pylint,
                    null_ls.builtins.diagnostics.selene,
                    -- Formatters
                    null_ls.builtins.formatting.beautysh,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.markdownlint,
                    null_ls.builtins.formatting.stylua,
                    -- Completion
                    null_ls.builtins.completion.spell,
                },
            })
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {}, vim.lsp.buf.format({ timeout_ms = 5000 }))
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
            { "folke/neodev.nvim",                   opts = {} },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local configs = require("lspconfig.configs") -- Import configs for custom servers
            local mason_lspconfig = require("mason-lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local keymap = vim.keymap

            -- Add custom server if not already defined
            if not configs.wdl_ls then
                configs.wdl_ls = {
                    default_config = {
                        cmd = {
                            "python3",
                            vim.fn.stdpath("config") .. "/local_lsps/wdl-ide/server/wdl_lsp/server.py",
                        },
                        filetypes = { "wdl" },
                        root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
                        settings = {},
                    },
                }
            end

            -- Attach common keymaps for all LSP servers
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf, silent = true }
                    local mappings = {
                        {
                            "n",
                            "gR",
                            "<cmd>Telescope lsp_references<CR>",
                            "Show LSP references",
                        },
                        { "n",          "gD",         vim.lsp.buf.declaration,                  "Go to declaration" },
                        {
                            "n",
                            "gd",
                            "<cmd>Telescope lsp_definitions<CR>",
                            "Show LSP definitions",
                        },
                        {
                            "n",
                            "gi",
                            "<cmd>Telescope lsp_implementations<CR>",
                            "Show LSP implementations",
                        },
                        {
                            "n",
                            "gt",
                            "<cmd>Telescope lsp_type_definitions<CR>",
                            "Show LSP type definitions",
                        },
                        { { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,                  "See code actions" },
                        { "n",          "<leader>rn", vim.lsp.buf.rename,                       "Smart rename" },
                        { "n",          "<leader>D",  "<cmd>Telescope diagnostics bufnr=0<CR>", "Buffer diagnostics" },
                        { "n",          "<leader>d",  vim.diagnostic.open_float,                "Line diagnostics" },
                        {
                            "n",
                            "[d",
                            vim.diagnostic.goto_prev,
                            "Previous diagnostic",
                        },
                        { "n", "]d",         vim.diagnostic.goto_next, "Next diagnostic" },
                        { "n", "K",          vim.lsp.buf.hover,        "Show documentation" },
                        { "n", "<leader>rs", ":LspRestart<CR>",        "Restart LSP" },
                    }
                    for _, mapping in ipairs(mappings) do
                        opts.desc = mapping[4]
                        keymap.set(mapping[1], mapping[2], mapping[3], opts)
                    end
                end,
            })

            local capabilities = cmp_nvim_lsp.default_capabilities()

            -- Setup the WDL language server
            lspconfig.wdl_ls.setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    local opts = { noremap = true, silent = true, buffer = bufnr }
                    local mappings = {
                        { "n", "gd",         "<cmd>lua vim.lsp.buf.definition()<CR>",     "Go to definition" },
                        { "n", "K",          "<cmd>lua vim.lsp.buf.hover()<CR>",          "Show hover" },
                        { "n", "gi",         "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation" },
                        { "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>",         "Rename" },
                    }
                    for _, mapping in ipairs(mappings) do
                        opts.desc = mapping[4]
                        vim.api.nvim_buf_set_keymap(bufnr, mapping[1], mapping[2], mapping[3], opts)
                    end
                end,
            })

            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
            })
        end,
    },
}
