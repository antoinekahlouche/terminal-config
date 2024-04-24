return {
	"laytan/tailwind-sorter.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
	},
	run = "cd formatter && npm i && npm run build",
	config = function()
		local tailwindsorter = require("tailwind-sorter")

		tailwindsorter.setup({
			on_save_enabled = true,
			on_save_pattern = {
				"*.html",
				"*.js",
				"*.ts",
				"*.css",
				"*.templ",
			},
			node_path = "node",
		})
	end,
}
