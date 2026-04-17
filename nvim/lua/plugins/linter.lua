return {
	"mfussenegger/nvim-lint",
	opts = function(_, opts)
		opts.linters_by_ft = opts.linters_by_ft or {}

		-- Astro

		-- Bash
		opts.linters_by_ft.bash = { "shellcheck" }
		opts.linters_by_ft.sh = { "shellcheck" }
		opts.linters_by_ft.zsh = { "shellcheck" }

		-- CSS
		opts.linters_by_ft.css = { "stylelint" }


		-- Docker

		-- HTML
		opts.linters_by_ft.html = { "markuplint" }

		-- JavaScript
		opts.linters_by_ft.javascript = { "oxlint" }
		opts.linters_by_ft.javascriptreact = { "oxlint" }

		-- JSON
		opts.linters_by_ft.json = { "jsonlint" }
		opts.linters_by_ft.jsonc = { "jsonlint" }

		-- Lua

		-- Markdown

		-- Python
		opts.linters_by_ft.python = { "ruff" }

		-- Solid
		opts.linters_by_ft.solid = { "oxlint" }

		-- TOML

		-- TypeScript
		opts.linters_by_ft.typescript = { "oxlint" }
		opts.linters_by_ft.typescriptreact = { "oxlint" }

		-- YAML
	end,
}
