-- mapping the leader key 
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

require("core.lazy")

if vim.fn.has("termguicolors") == 1 then
    vim.o.termguicolors = true
end
