return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- --------------------------------------------------
        -- ------------- local functions --------------------
        -- --------------------------------------------------
        local function my_on_attach(bufnr)
            local api = require("nvim-tree.api")
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, nowait = true }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)
            -- test
            -- custom mappings
            vim.keymap.set("n", "<leader>e]", api.tree.change_root_to_node, opts("Root To Parent"))
            vim.keymap.set("n", "<leader>e?", api.tree.toggle_help, opts("Help"))
            vim.keymap.set("n", "<leader>e??", function()
                vim.cmd("h nvim-tree")
            end, opts("nvim help"))
        end
        -- --------------------------------------------------

        nvimtree.setup({
            on_attach = my_on_attach,
            view = {
                width = 35,
                relativenumber = true,
            },
            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "⮚", -- arrow when folder is closed
                            arrow_open = "⮛", -- arrow when folder is open
                        },
                    },
                },
            },
            hijack_directories = {
                enable = true,
                auto_open = true,
            },
            update_focused_file = {
                enable = true,
                update_root = {
                    enable = true,
                    ignore_list = {},
                },
                exclude = false,
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            filters = {
                custom = { ".DS_Store" },
            },
            git = {
                ignore = false,
            },
        })

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
        keymap.set(
            "n",
            "<leader>ef",
            "<cmd>NvimTreeFindFileToggle<CR>",
            { desc = "Toggle file explorer on current file" }
        ) -- toggle file explorer on current file
        keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
        keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
        keymap.set("n", "<leader>eff", "<cmd>NvimTreeFocus<CR>", { desc = "Explorer Fuckin Focus" }) -- refresh file explorer
    end,
}
