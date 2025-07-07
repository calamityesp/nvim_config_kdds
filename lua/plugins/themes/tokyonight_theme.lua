return {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
        ------------------------------------------------------
        -----------       local bg options -------------------
        ------------------------------------------------------
        -- local bg = "#011628"
        -- local bg = "#ffaf5f"
        -- local bg = "#1a1b26" -- Color of the Active Background
        local bg = "#000102" -- Color of the Active Background

        ------------------------------------------------------
        -----------     local inactive bg  -------------------
        ------------------------------------------------------
        -- local bg_dark = "#562e05"
        -- local bg_dark = "#011423"
        -- local bg_dark = "#1a1b26"
        local bg_dark = "#000102" -- Color of the Active Background

        ------------------------------------------------------
        ------------- line highlight color -------------------
        ------------------------------------------------------
        -- local bg_dark = "#000D18" -- Color of the inactivea background
        -- local bg_highlight = "#143652"
        -- local bg_highlight = "#512200"
        -- local bg_highlight = "#4c341c"
        local bg_highlight = "#FF5500"

        local bg_search = "#0A64AC"

        --    high light color in visual mode background --------------------
        -- local bg_search = "#4c341c"
        -- local bg_visual = "#275378"
        -- local bg_visual = "#ffc16c"
        -- local bg_visual = "#4c341c"
        local bg_visual = "#FF5500"
        -- ------------------------------------------------------------------

        local fg = "#CBE0F0"
        local fg_dark = "#B4D0E9"
        -- local fg_gutter = "#627E97"
        -- local fg_gutter = "#627E97"
        local fg_gutter = "#000102"
        -- local border = "#547998"
        local border = "#000102"

        require("tokyonight").setup({
            style = "night",
            on_colors = function(colors) --modify tokyonight color themes with this function
                colors.bg = bg
                colors.bg_dark = bg_dark
                colors.bg_float = bg_dark
                colors.bg_highlight = bg_highlight
                colors.bg_popup = bg_dark
                colors.bg_search = bg_search
                colors.bg_sidebar = bg_dark
                colors.bg_statusline = bg_dark
                colors.bg_visual = bg_visual
                colors.border = border
                colors.fg = fg
                colors.fg_dark = fg_dark
                colors.fg_float = fg
                colors.fg_gutter = fg_gutter
                colors.fg_sidebar = fg_dark
            end,
        })

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- set the background to none to match terminal emulator color
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- same as above for floating windows
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" }) -- same as above for floating windows
        -- vim.cmd("colorscheme tokyonight")
        -- vim.cmd("colorscheme tokyonight-night")
        vim.cmd("colorscheme tokyonight-storm")
        -- vim.cmd("colorscheme tokyonight-moon")
    end,
}
