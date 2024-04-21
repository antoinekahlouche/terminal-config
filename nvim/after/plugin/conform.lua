local conform = require('conform')

conform.setup({
	formatters_by_ft = {
		css = { "prettier" },
		go = { "goimports", "gofmt" },
		html = { "prettier" },
		javascript = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		markdown = { "prettier" },
		typescript = { "prettier" },
		yaml = { "prettier" },
	},
})

vim.keymap.set({ "n", "v" }, "f", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end)
