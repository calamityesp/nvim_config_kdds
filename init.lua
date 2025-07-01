-- mapping the leader key 
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

require("core.lazy")
require("core.lsp")
require("config")


if vim.fn.has("termguicolors") == 1 then
    vim.o.termguicolors = true
end
