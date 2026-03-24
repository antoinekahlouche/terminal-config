return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.config("ts_ls", {})
		vim.lsp.config("lua_ls", {})

		vim.lsp.enable("ts_ls")
		vim.lsp.enable("lua_ls")

		vim.diagnostic.config({
			float = { border = "single" },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅙",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "󰋼",
					[vim.diagnostic.severity.HINT] = "󰌵",
				},
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)

				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_group = vim.api.nvim_create_augroup("lsp-document-highlight", { clear = false })
					local highlighted_word = nil

					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = args.buf,
						group = highlight_group,
						callback = function()
							highlighted_word = vim.fn.expand("<cword>")
							vim.lsp.buf.document_highlight()
						end,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = args.buf,
						group = highlight_group,
						callback = function()
							if highlighted_word and vim.fn.expand("<cword>") ~= highlighted_word then
								highlighted_word = nil
								vim.lsp.buf.clear_references()
							end
						end,
					})

					vim.api.nvim_create_autocmd({ "InsertEnter", "BufLeave" }, {
						buffer = args.buf,
						group = highlight_group,
						callback = function()
							highlighted_word = nil
							vim.lsp.buf.clear_references()
						end,
					})
				end

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
	end,
}
