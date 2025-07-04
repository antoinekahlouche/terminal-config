return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		-- lspconfig.eslint.setup({})
		lspconfig.ts_ls.setup({})
		lspconfig.lua_ls.setup({})
		-- lspconfig.astro.setup({})

		vim.diagnostic.config({
			float = { border = "single" },
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function()
				local bufmap = function(mode, lhs, rhs)
					local opts = { buffer = true }
					vim.keymap.set(mode, lhs, rhs, opts)
				end

				-- Displays hover information about the symbol under the cursor
				bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")

				-- Jump to the definition
				bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

				-- Jump to declaration
				bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")

				-- Lists all the implementations for the symbol under the cursor
				bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")

				-- Jumps to the definition of the type symbol
				bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")

				-- Lists all the references
				bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")

				-- Displays a function's signature information
				bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

				-- Renames all references to the symbol under the cursor
				bufmap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")

				-- Selects a code action available at the current cursor position
				bufmap("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")

				-- Show diagnostics in a floating window
				bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

				-- Move to the previous diagnostic
				bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

				-- Move to the next diagnostic
				bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
			end,
		})

		local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }

		for name, icon in pairs(symbols) do
			local hl = "DiagnosticSign" .. name
			vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
		end
	end,
}
