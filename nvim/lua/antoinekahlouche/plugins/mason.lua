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
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"cssls",
				"emmet_ls",
				"gopls",
				"html",
				"lua_ls",
				"tailwindcss",
				"tsserver",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"eslint_d",
				"goimports",
				"prettier",
				"stylua",
				"templ",
			},
		})
	end,
}
