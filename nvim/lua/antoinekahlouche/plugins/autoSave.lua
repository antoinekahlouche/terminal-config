return {
	"Pocco81/auto-save.nvim",
	config = function()
		local autosave = require("auto-save")

		autosave.setup({
			condition = function(buf)
				if vim.bo[buf].filetype == "harpoon" then
					return false
				end
			end,
		})
	end,
}
