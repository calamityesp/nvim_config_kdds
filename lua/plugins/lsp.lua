-- ***********************************************************************************************
-- *** lsp-configuration  --Sets up lspconfig, mason config, and others to add LSP support
-- ***********************************************************************************************

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "Hoffs/omnisharp-extended-lsp.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        -- Snippets
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local keymap = vim.keymap
        local diagnostic = vim.diagnostic
        local lspconfig = require("lspconfig")
        local lspconfig_defaults = lspconfig.util.default_config
        local mason = require("mason")
        local mason_tool = require("mason-tool-installer")
        local mason_lspconfig = require("mason-lspconfig")
        local custom_border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf, silent = true }

                -- set keybinds
                opts.desc = "Show LSP references"
                keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

                opts.desc = "Go to declaration"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

                opts.desc = "Show LSP definitions"
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                opts.desc = "Show LSP implementations"
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                opts.desc = "Show LSP type definitions"
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

                opts.desc = "Go to previous diagnostic"
                keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

                opts.desc = "Go to next diagnostic"
                keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
            end,
        })

        -- Configure Error/Warnings interface
        diagnostic.config({
            virtual_text = true,
            severity_sort = true,
            float = {
                style = "minimal",
                border = "rounded",
                header = "",
                prefix = "",
            },
            signs = {
                text = {
                    [diagnostic.severity.ERROR] = "✘",
                    [diagnostic.severity.WARN] = "▲",
                    [diagnostic.severity.HINT] = "⚑",
                    [diagnostic.severity.INFO] = "»",
                },
            },
        })

        -- Add cmp_nvim_lsp capabilities settings to lspconfig
        -- This should be executed before you configure any language server
        lspconfig_defaults.capabilities = vim.tbl_deep_extend(
            "force",
            lspconfig_defaults.capabilities,
            require("cmp_nvim_lsp").default_capabilities()
        )

        -- configure mason
        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        --
        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                -- "intelephense",
                -- "ts_ls",
                -- "eslint",
            },
            handlers = {
                -- this first function is the "default handler"
                -- it applies to every language server without a custom handler
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,

                -- this is the "custom handler" for `lua_ls`
                lua_ls = function()
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT",
                                },
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                workspace = {
                                    library = { vim.env.VIMRUNTIME },
                                },
                            },
                        },
                    })
                end,
            },
        })

        mason_tool.setup({
            ensure_installed = {
                -- "prettier", -- prettier formatter
                "stylua", -- lua formatter
                -- "isort", -- python formatter
                -- "black", -- python formatter
                -- "pylint", -- python  linting
                -- "eslint_d", -- js linting
                -- "mypy",
                --            "clang-format", -- c  language formating
            },
        })
    end,
}
-- keymap = vim.keymap
--
-- vim.lsp.enable({ "lua_ls" })
-- vim.lsp.completion.enable()

--
-- vim.diagnostic.config({
--     -- virtual_lines = true,
--     virtual_text = true,
--     underline = true,
--     update_in_insert = false,
--     severity_sort = true,
--     float = {
--         border = "rounded",
--         source = true,
--     },
--     signs = {
--         text = {
--             [vim.diagnostic.severity.ERROR] = "󰅚 ",
--             [vim.diagnostic.severity.WARN] = "󰀪 ",
--             [vim.diagnostic.severity.INFO] = "󰋽 ",
--             [vim.diagnostic.severity.HINT] = "󰌶 ",
--         },
--         numhl = {
--             [vim.diagnostic.severity.ERROR] = "ErrorMsg",
--             [vim.diagnostic.severity.WARN] = "WarningMsg",
--         },
--     },
-- })
--
--
