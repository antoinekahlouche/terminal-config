return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = function(_, opts)
		opts.ensure_installed = opts.ensure_installed or {}

		local ensure_installed = {
			-- Astro
			"prettier",

			-- Bash
			"shellcheck",
			"shfmt",

			-- CSS
			"oxfmt",
			"stylelint",

			-- Docker

			-- HTML
			"markuplint",

			-- JavaScript
			"oxlint",

			-- JSON
			"jsonlint",

			-- Lua
			"stylua",

			-- Markdown

			-- Python
			"ruff",

			-- Solid

			-- TOML

			-- TypeScript

			-- YAML
		}

		for _, tool in ipairs(ensure_installed) do
			if not vim.tbl_contains(opts.ensure_installed, tool) then
				table.insert(opts.ensure_installed, tool)
			end
		end
	end,
}
