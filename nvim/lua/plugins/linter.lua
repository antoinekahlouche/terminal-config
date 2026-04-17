return {
	"mfussenegger/nvim-lint",
	opts = function(_, opts)
		local filetypes = require("filetypes")

		opts.linters_by_ft = opts.linters_by_ft or {}

		for filetype, linters in pairs(filetypes.linters) do
			opts.linters_by_ft[filetype] = linters
		end
	end,
}
