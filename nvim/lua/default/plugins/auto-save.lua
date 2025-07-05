return {
	"Pocco81/auto-save.nvim",
	config = function()
		local autosave = require("auto-save")

		autosave.setup({
			condition = function(buf)
				local filetype = vim.bo[buf].filetype
				if filetype == "harpoon" then
					return false
				end
			end,
		})
	end,
}
