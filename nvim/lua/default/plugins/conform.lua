return {
	"stevearc/conform.nvim",

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "biome-check", stop_after_first = true },
				javascriptreact = { "biome-check", stop_after_first = true },
				typescriptreact = { "biome-check", stop_after_first = true },
				astro = { "biome-check", stop_after_first = true },
				css = { "biome-check", stop_after_first = true },
				html = { "biome-check", stop_after_first = true },
				jsonc = { "biome-check", stop_after_first = true },
				json = { "biome-check", stop_after_first = true },
				lua = { "stylua", stop_after_first = true },
				markdown = { "biome-check", stop_after_first = true },
				typescript = { "biome-check", stop_after_first = true },
				yaml = { "biome-check", stop_after_first = true },
			},
		})

		vim.api.nvim_create_autocmd("InsertLeave", {
			pattern = "*",
			callback = function(args)
				conform.format({ bufnr = args.buf })
			end,
		})
	end,
}
