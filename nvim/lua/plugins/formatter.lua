return {
	"stevearc/conform.nvim",
	opts = function(_, opts)
		opts.format_on_save = false

		opts.formatters_by_ft = opts.formatters_by_ft or {}

		-- Astro
		opts.formatters_by_ft.astro = { "prettier" }

		-- Bash
		opts.formatters_by_ft.bash = { "shfmt" }
		opts.formatters_by_ft.sh = { "shfmt" }
		opts.formatters_by_ft.zsh = { "shfmt" }

		-- CSS
		opts.formatters_by_ft.css = { "oxfmt" }

		-- Docker

		-- HTML
		opts.formatters_by_ft.html = { "oxfmt" }

		-- JavaScript
		opts.formatters_by_ft.javascript = { "oxfmt" }
		opts.formatters_by_ft.javascriptreact = { "oxfmt" }

		-- JSON
		opts.formatters_by_ft.json = { "oxfmt" }
		opts.formatters_by_ft.jsonc = { "oxfmt" }

		-- Lua
		opts.formatters_by_ft.lua = { "stylua" }

		-- Markdown
		opts.formatters_by_ft.markdown = { "oxfmt" }
		opts.formatters_by_ft.mdx = { "oxfmt" }

		-- YAML
		opts.formatters_by_ft.yaml = { "oxfmt" }

		-- Python
		opts.formatters_by_ft.python = { "ruff" }

		-- Solid
		opts.formatters_by_ft.solid = { "oxfmt" }

		-- TOML
		opts.formatters_by_ft.toml = { "oxfmt" }

		-- TypeScript
		opts.formatters_by_ft.typescript = { "oxfmt" }
		opts.formatters_by_ft.typescriptreact = { "oxfmt" }
	end,
}
