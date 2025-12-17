-- mapping the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

if vim.fn.has("termguicolors") == 1 then
	vim.o.termguicolors = true
end

require("config")
require("core.lazy")
require("utils")
