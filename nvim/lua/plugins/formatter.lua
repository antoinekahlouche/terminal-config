return {
	"stevearc/conform.nvim",
	opts = function(_, opts)
		local filetypes = require("filetypes")

		opts.format_on_save = false

		opts.formatters_by_ft = opts.formatters_by_ft or {}

		for filetype, formatters in pairs(filetypes.formatters) do
			opts.formatters_by_ft[filetype] = formatters
		end
	end,
}
