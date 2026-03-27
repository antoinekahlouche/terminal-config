return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"saadparwaiz1/cmp_luasnip",
		"zbirenbaum/copilot-cmp",
	},
	config = function()
		local cmp = require("cmp")
		require("copilot_cmp").setup()

		cmp.setup({
			formatting = {
				fields = { cmp.ItemField.Abbr, cmp.ItemField.Kind },
			},

			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			enable = true,

			sources = {
				{ name = "copilot" },
				{ name = "codeium" },
				{ name = "path" },
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
			},

			preselect = cmp.PreselectMode.ItemField,

			completion = {
				autocomplete = { cmp.TriggerEvent.TextChanged },
				completeopt = "menu,menuone,noinsert",
			},

			window = {
				completion = { border = "rounded" },
				documentation = { border = "rounded" },
			},

			mapping = {
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-CR>"] = cmp.mapping.confirm({ select = false }),
				["<ESC>"] = cmp.mapping.abort(),
			},
		})
	end,
}
