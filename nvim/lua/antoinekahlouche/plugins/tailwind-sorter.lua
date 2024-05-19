return {
	"laytan/tailwind-sorter.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
	},
	build = "cd formatter && npm ci && npm run build",
	config = function()
		local tailwindsorter = require("tailwind-sorter")

		tailwindsorter.setup({
			on_save_enabled = false,
			on_save_pattern = {
				"*.html",
				"*.js",
				"*.ts",
				"*.css",
				"*.templ",
			},
			node_path = "node",
		})

		vim.api.nvim_create_autocmd("InsertLeave", {
			callback = function()
				tailwindsorter.sort()
			end,
		})
	end,
}
