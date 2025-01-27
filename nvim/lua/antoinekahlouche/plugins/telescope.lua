return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				-- layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
				file_ignore_patterns = { "node_modules", "package-lock.json" },
				mappings = {
					i = {
						["<ESC>"] = actions.close,
						["∂"] = actions.delete_buffer, -- <Opt-d> on MacOS
						["<LEADER><CR>"] = actions.select_vertical,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		vim.keymap.set("n", "<LEADER>f", builtin.find_files, {})
		vim.keymap.set("n", "<LEADER>g", builtin.live_grep, {})
		-- vim.keymap.set("n", "<LEADER>b", builtin.buffers, {})
		vim.keymap.set("n", "<LEADER>p", "<CMD>TodoTelescope<CR>", {})
	end,
}
