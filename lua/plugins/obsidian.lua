-- ***********************************************************************************************
-- *** obsidian  --Plugin to manage obsidan editor and obsidian markdown notes
-- ***********************************************************************************************

return {
    "calamityesp/obsidian.nvim",
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",

        -- see below for full list of optional dependencies 👇
    },
    config = function()
        local obsidian = require("obsidian")
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        obsidian.setup({
            workspaces = {
                {
                    name = "Notes",
                    path = "~/Obsidian/Calamity_Notes/",
                },
                {
                    name = "Draw",
                    path = "~/Obsidian/Calamity_Draw/",
                },
                {
                    name = "Thinking",
                    path = "~/Obsidian/Calamity_Thinking/",
                },
                {
                    name = "yal",
                    path = "~/Production/YAL/yal-notes",
                },
            },
            mappings = {
                ["<leader>och"] = {
                    action = function()
                        return require("obsidian").util.toggle_checkbox()
                    end,
                    opts = { buffer = true, desc = "toggle checkboxes" },
                },
            },
            templates = {
                folder = "TEMPLATES",
                date_format = "%Y-%m-%d-%a",
                time_format = "%H:%M",
            },
            picker = {
                name = "telescope.nvim",
                note_mappings = {
                    new = "<C-x>",
                    insert_link = "<C-l>",
                },
                tag_mappings = {
                    tag_note = "<C-x>",
                    insert_tag = "<C-l>",
                },
            },
        })

        --        Obsidian related keymaps  -------------------
        -- Open notes in new tab
        vim.keymap.set("n", "<leader>oot", function()
            vim.cmd("tabnew")
            vim.cmd("ObsidianSearch")
        end, { desc = "Open note in new tab" })

        -- Open notes in new split
        vim.keymap.set("n", "<leader>oos", function()
            vim.cmd("vsplit")
            vim.cmd("ObsidianSearch")
        end, { desc = "open note in new split" })

        vim.keymap.set("n", "<leader>ooo", function()
            vim.cmd("ObsidianSearch")
        end, { desc = "open new note in current buffer" })

        -- Template command
        vim.keymap.set("n", "<leader>ot", function()
            vim.cmd("ObsidianTemplate")
        end)

        -- New Obsidian Note Insert
        vim.keymap.set("n", "<leader>oon", function()
            vim.cmd("ObsidianNew")
        end, { desc = "Create a new obsidian note" })

        -- Search for buffer by tag id
        vim.keymap.set("n", "<leader>ott", function()
            vim.cmd("ObsidianTags")
        end, { desc = "search by tag" })

        -- Create a new template file
        vim.keymap.set("n", "<leader>otn", function()
            local templateName = vim.fn.input("TemplateName : ")
            vim.cmd("ObsidianNew TEMPLATES/" .. templateName .. " template.md")
        end, { desc = "create a new template " })

        -- Open Obsidian editor
        vim.keymap.set("n", "<leader>oop", function()
            vim.cmd("ObsidianOpen")
        end, { desc = "Open the obsidian editor" })

        -- Select Obsidian Workspace
        vim.keymap.set("n", "<leader>oow", function()
            vim.cmd("ObsidianWorkspace")
        end, { desc = "Select Obsidian Workspace" })



        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            }
          })
    end,
}
