-- ***********************************************************************************************
-- *** bufferline  --Styles the status at the bottom of neovim w/ support for tabs
-- ***********************************************************************************************

return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			separator_style = "slope",
			auto_toggle_bufferline = true,
		},
	},
}
