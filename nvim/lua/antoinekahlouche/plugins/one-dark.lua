return {
	"navarasu/onedark.nvim",
	priority = 100,
	config = function()
		local onedark = require("onedark")

		onedark.setup({
			style = "dark",
			colors = {
				bg_d = "#282c34",
				bg1 = "#282c34",
			},
		})

		onedark.load()

		-- vim.api.nvim_create_autocmd("FileType", {
		-- 	pattern = "harpoon",
		-- 	callback = function()
		-- 		onedark.setup({
		-- 			colors = {
		-- 			},
		-- 		})
		-- 	end,
		-- })
	end,
}
