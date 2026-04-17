return {
	"stevearc/conform.nvim",
	opts = function(_, opts)
		opts.format_on_save = false

		opts.formatters_by_ft = opts.formatters_by_ft or {}

		opts.formatters_by_ft.javascript = { "oxfmt" }
		opts.formatters_by_ft.javascriptreact = { "oxfmt" }
		opts.formatters_by_ft.typescript = { "oxfmt" }
		opts.formatters_by_ft.typescriptreact = { "oxfmt" }
		opts.formatters_by_ft.json = { "oxfmt" }
		opts.formatters_by_ft.jsonc = { "oxfmt" }
		opts.formatters_by_ft.css = { "oxfmt" }
	end,
}
