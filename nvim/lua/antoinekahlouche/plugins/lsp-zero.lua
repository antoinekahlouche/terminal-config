return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "L3MON4D3/LuaSnip" },
	},
	config = function()
		local lsp = require("lsp-zero").preset({})

		lsp.on_attach(function(_, bufnr)
			lsp.default_keymaps({ buffer = bufnr })
		end)

		vim.filetype.add({
			extension = {
				templ = "templ",
			},
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local lspconfig = require("lspconfig")

		-- html
		lspconfig.html.setup({
			capabilities = capabilities,
		})

		-- scss/css/ls
		lspconfig.cssls.setup({
			capabilities = capabilities,
			settings = {
				css = {
					lint = {
						unknownAtRules = "ignore",
					},
				},
			},
		})

		-- js/typescript
		lspconfig.tsserver.setup({
			capabilities = capabilities,
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
		})

		-- lua
		lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

		-- htmx
		lspconfig.htmx.setup({
			capabilities = capabilities,
			filetypes = { "html", "templ" },
		})

		-- go.templ
		lspconfig.templ.setup({})

		-- tailwindcss
		lspconfig.tailwindcss.setup({
			filetypes = {
				"templ",
				"astro",
				"html",
				"markdown",
				"mdx",
				"css",
				"postcss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"svelte",
			},
			init_options = {
				userLanguages = {
					templ = "html",
				},
			},
		})

		lsp.setup()
	end,
}
