return {
	"stevearc/conform.nvim",
	opts = function(_, opts)
		local formatter_languages = {
			oxfmt = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"json",
				"jsonc",
				"css",
			},
		}

		opts.format_on_save = false

		opts.formatters_by_ft = opts.formatters_by_ft or {}

		for formatter, languages in pairs(formatter_languages) do
			for _, ft in ipairs(languages) do
				opts.formatters_by_ft[ft] = { formatter }
			end
		end
	end,
}
