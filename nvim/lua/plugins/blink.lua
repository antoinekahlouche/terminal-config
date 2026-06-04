return {
	"saghen/blink.cmp",
	optional = true,
	opts = {
		keymap = {
			preset = "none",
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},
		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},
		},
	},
}
