local excluded_patterns = { ".git", "node_modules", ".DS_Store" }

return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			sources = {
				explorer = { hidden = true, ignored = true, exclude = excluded_patterns },
				files = { hidden = true, ignored = true, exclude = excluded_patterns },
				grep = { hidden = true, ignored = true, exclude = excluded_patterns },
			},
		},
	},
}
