return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			keymaps = {
				["<CR>"] = "actions.select",
				["<RIGHT>"] = "actions.select",
				["<LEADER><CR>"] = "actions.select_vsplit",
				["<BS>"] = "actions.parent",
				["<LEFT>"] = "actions.parent",
				["g."] = "actions.toggle_hidden",
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name)
					return name == ".." or name:match("_templ.go$")
				end,
			},
		})

		vim.keymap.set("n", "<LEADER>t", ":Oil<CR>")
	end,
}
