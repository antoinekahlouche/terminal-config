return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				css = { "prettier" },
				go = { "goimports", "gofmt" },
				html = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				templ = { "templ" },
				typescript = { "prettier" },
				yaml = { "prettier" },
			},
		})

		-- vim.keymap.set({ "n", "v" }, "f", function()
		-- 	conform.format({
		-- 		lsp_fallback = true,
		-- 		async = false,
		-- 		timeout_ms = 500,
		-- 	})
		-- end)

		vim.api.nvim_create_autocmd("InsertLeave", {
			callback = function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end,
		})
	end,
}
