return {
	"saghen/blink.cmp",
	optional = true,
	opts = {
		keymap = {
			preset = "none",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},
		completion = {
			list = {
				selection = {
					preselect = false,
				},
			},
		},
	},
}
