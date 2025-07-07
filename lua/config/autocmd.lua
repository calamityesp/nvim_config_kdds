-- local autocmd = vim.api.nvim_create_autocmd
-- local root_name = {".git", "Makefile", }
--
-- autocmd("BufEnter", {
--    pattern = "*",
--    callback = function()
--       local dir = vim.fn.expand("%:p")
--       vim.cmd("silent! lcd " .. dir)
--    end,
-- })

-- Enable automatic indentation
vim.cmd("filetype plugin indent on")

-- Set the indentation for HTML files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "html",
    command = "setlocal shiftwidth=2 tabstop=2 expandtab",
})

-- Setup Line Wrap
local guide_col = 120
vim.api.nvim_create_autocmd({ "CursorMoved", "VimResized" }, {
    callback = function()
        local col = vim.fn.col(".") - 1
        if col >= guide_col then
            vim.wo.colorcolumn = toString(guide_col)
        else
            vim.wo.colorcolumn = ""
        end
    end,
})
