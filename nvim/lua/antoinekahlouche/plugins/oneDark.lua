return {
	"navarasu/onedark.nvim",
	priority = 100,
	config = function()
		local onedark = require("onedark")

		onedark.setup({
			style = "dark",
			colors = {
				bg_d = "#282c34",
			},
		})

		onedark.load()
	end,
}
