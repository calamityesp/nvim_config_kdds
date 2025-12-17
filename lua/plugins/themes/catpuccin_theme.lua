return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        local cat = require("catppuccin")
        cat.setup({
            flavour = "mocha",
            integrations = {
                gitsigns = true,
                treesitter = true,
                nvimtree = true,
                telescope = {
                    enabled = true,
                },
                markdown = true,
            },
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}
