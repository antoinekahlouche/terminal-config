return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"moll/vim-bbye",
	},
	config = function()
		vim.opt.termguicolors = true
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				tab_size = 20,
				offsets = {
					{
						filetype = "NvimTree",
						text = "Tree",
						text_align = "center",
						separator = false,
					},
				},
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		})

		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		map("n", "<LEADER><LEFT>", "<Cmd>BufferLineCyclePrev<CR>", opts)
		map("n", "<LEADER><RIGHT>", "<Cmd>BufferLineCycleNext<CR>", opts)

		map("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
		map("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
		map("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
		map("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
		map("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
		map("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
		map("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
		map("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
		map("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)

		map("n", "q", "<Cmd>Bdelete<CR>", opts)
		-- map("n", "qo", "<Cmd>BufferLineCloseOthers<CR>", opts)
	end,
}
