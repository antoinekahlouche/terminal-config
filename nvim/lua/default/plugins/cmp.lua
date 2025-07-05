return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
        "saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
            formatting = {
                fields = { cmp.ItemField.Abbr, cmp.ItemField.Kind },
            },

            snippet = {
                expand = function(args)
                    require'luasnip'.lsp_expand(args.body)
                end
            },

			enable = true,

			sources = {
				{ name = "path" },
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
			},

			preselect = cmp.PreselectMode.Items,

			completion = {
				-- autocomplete = false,
				completeopt = "menu,menuone,noinsert",
			},

            window = {
                completion = { border = 'rounded' },
                documentation = { border = 'rounded' },
            },

			mapping = cmp.mapping.preset.insert({
				["<C-SPACE>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<ESC>"] = cmp.mapping.abort(),
			}),
		})
	end,
}

