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
		vim.keymap.set("n", "k", function()
			vim.diagnostic.open_float()
		end)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end)

		local lsp = require("lsp-zero").preset({})

		lsp.on_attach(function(_, bufnr)
			lsp.default_keymaps({ buffer = bufnr })
		end)

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local lspconfig = require("lspconfig")

        vim.lsp.enable('astro')
		-- astro --
		-- lspconfig.astro.setup({
		-- 	capabilities = capabilities,
        --     on_attach = on_attach,
		-- 	filetypes = { "astro" },
		-- })

		-- html
		-- lspconfig.html.setup({
		-- 	capabilities = capabilities,
		-- 	filetypes = { "html" },
		-- })

		-- scss/css/ls
		-- lspconfig.cssls.setup({
		-- 	capabilities = capabilities,
		-- 	settings = {
		-- 		css = {
		-- 			lint = {
		-- 				unknownAtRules = "ignore",
		-- 			},
		-- 		},
		-- 	},
		-- })

		-- js/typescript
		-- lspconfig.ts_ls.setup({
		-- 	capabilities = capabilities,
		-- 	filetypes = {
		-- 		"javascript",
		-- 		"javascriptreact",
		-- 		"javascript.jsx",
		-- 		"typescript",
		-- 		"typescriptreact",
		-- 		"typescript.tsx",
		-- 	},
		-- })

		-- lua
		-- lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

		-- tailwindcss
		-- lspconfig.tailwindcss.setup({
		-- 	capabilities = capabilities,
		-- 	filetypes = {
		-- 		"astro",
        --         "svelte",
		-- 		"html",
		-- 		"markdown",
		-- 		"mdx",
		-- 		"css",
		-- 		"postcss",
		-- 		"javascript",
		-- 		"javascriptreact",
		-- 		"typescript",
		-- 		"typescriptreact",
		-- 	},
		-- 	settings = {
		-- 		tailwindCSS = {
		-- 			experimental = {
		-- 				classRegex = {
		-- 					{ "cva\\(((?:[^()]|\\([^()]*\\))*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
		-- 					{ "cx\\(((?:[^()]|\\([^()]*\\))*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- })

		lsp.setup()
	end,
}
