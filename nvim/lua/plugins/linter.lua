return {
	"mfussenegger/nvim-lint",
	opts = function(_, opts)
		opts.linters_by_ft = opts.linters_by_ft or {}

		opts.linters_by_ft.javascript = { "oxlint" }
		opts.linters_by_ft.javascriptreact = { "oxlint" }
		opts.linters_by_ft.typescript = { "oxlint" }
		opts.linters_by_ft.typescriptreact = { "oxlint" }
	end,
}
