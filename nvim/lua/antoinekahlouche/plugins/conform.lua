return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			notify_on_error = false,
			formatters_by_ft = {
				css = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
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
			pattern = "*",
			callback = function()
				local filetype = vim.bo.filetype
				if filetype == "harpoon" or filetype == "oil" then
					return false
				end
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end,
		})
	end,
}
