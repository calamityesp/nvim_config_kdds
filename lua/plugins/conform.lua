-- ***********************************************************************************************
-- *** conform  --Works with Mason lsp (or build in lsp) and allows you to configure code linting using those installed tools
-- note: This is what triggers autoformatting in the file
-- ***********************************************************************************************

return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "mfussenegger/nvim-lint",
    },
    config = function()
        local conform = require("conform")
        local lint = require("lint")

        conform.setup({
            formatters = {
                prettier = {
                    args = { "--stdin-filepath", "$FILENAME" },
                },
            },
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                svelte = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                -- markdown = { "prettier" },
                graphql = { "prettier" },
                liquid = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
                cs = { "csharpier" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
        })

        -- Setting up nvim-lint for linting
        lint.linters_by_ft = {
            javascript = { "eslint" },
            typescript = { "eslint" },
            javascriptreact = { "eslint" },
            typescriptreact = { "eslint" },
            svelte = { "eslint" },
            python = { "pylint" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
