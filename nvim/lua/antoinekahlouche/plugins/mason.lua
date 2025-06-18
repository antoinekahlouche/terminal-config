return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				width = 1,
				height = 1,
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = nil,
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"cssls",
				"emmet_ls",
				"html",
				"svelte",
				"lua_ls",
				"tailwindcss",
				"ts_ls",
				"astro",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"eslint_d",
				"prettier",
				"stylua",
				"biome",
			},
		})
	end,
}
