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
		local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
		local win_separator = vim.api.nvim_get_hl(0, { name = "WinSeparator" })
		local bg = normal.bg
		local border = win_separator.fg or normal.fg
		local base = {
			bg = bg,
			underline = true,
			sp = border,
		}

		local function extend(opts)
			return vim.tbl_extend("force", base, opts or {})
		end

		bufferline.setup({
			options = {
				tab_size = 20,
				indicator = {
					style = "none",
				},
				separator_style = { "", "" },
				offsets = {
					{
						filetype = "NvimTree",
						text = function()
							return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
						end,
						text_align = "center",
						separator = true,
					},
				},
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
			highlights = {
				fill = extend(),
				background = extend(),
				buffer_visible = extend(),
				buffer_selected = extend({ bold = true }),
				offset_separator = {
					bg = bg,
					sp = border,
				},
				indicator_visible = extend(),
				indicator_selected = extend(),
				trunc_marker = extend({ bold = true }),
			},
		})

		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		-- map("n", "<LEADER><LEFT>", "<Cmd>BufferLineCyclePrev<CR>", opts)
		-- map("n", "<LEADER><RIGHT>", "<Cmd>BufferLineCycleNext<CR>", opts)

		map("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
		map("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
		map("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
		map("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
		map("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
		map("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
		map("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
		map("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
		map("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
		map("n", "<A-0>", "<Cmd>BufferLineGoToBuffer 10<CR>", opts)

		map("n", "q", "<Cmd>Bdelete!<CR>", opts)
		-- map("n", "qo", "<Cmd>BufferLineCloseOthers<CR>", opts)
	end,
}
