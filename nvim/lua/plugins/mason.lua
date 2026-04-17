return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = function(_, opts)
		opts.ensure_installed = opts.ensure_installed or {}

		local ensure_installed = {
			-- LSP servers
			"astro",
			"docker_compose_language_service",
			"dockerls",
			"html",
			"jsonls",
			"lua_ls",
			"marksman",
			"oxlint",
			"stylua",
			"tsgo",

			-- DAP adapters

			-- Linters
			"oxlint",

			-- Formatters
			"oxfmt",
			"prettier",
			"stylua",
		}

		for _, tool in ipairs(ensure_installed) do
			if not vim.tbl_contains(opts.ensure_installed, tool) then
				table.insert(opts.ensure_installed, tool)
			end
		end
	end,
}
