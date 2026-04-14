return {
	"stevearc/conform.nvim",
	opts = function(_, opts)
		opts.format_on_save = false

		opts.formatters_by_ft = opts.formatters_by_ft or {}

		for _, ft in ipairs({
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"json",
			"jsonc",
			"css",
		}) do
			opts.formatters_by_ft[ft] = { "oxfmt" }
		end
	end,
}
