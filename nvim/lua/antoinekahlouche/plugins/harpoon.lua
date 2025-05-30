return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		})

		local toggle_opts = {
			style = "minimal",
			title = "",
			border = "rounded",
			title_pos = "center",
			ui_width_ratio = 0.40,
			bg = "#282c34",
		}

		vim.keymap.set("n", "<LEADER>w", function()
			harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
		end)
		vim.keymap.set("n", "<LEADER>a", function()
			harpoon:list():add()
		end)

		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<C-i>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<C-o>", function()
			harpoon:list():select(4)
		end)
	end,
}
