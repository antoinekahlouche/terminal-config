return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			api.config.mappings.default_on_attach(bufnr)

			vim.keymap.del("n", "e", { buffer = bufnr })

			vim.keymap.set("n", "<Esc>", api.tree.close, opts("Close"))
			vim.keymap.set("n", "<Right>", api.node.open.edit, opts("Edit"))
			vim.keymap.set("n", "<Left>", api.node.open.preview, opts("Preview"))
			vim.keymap.set("n", "<LEADER><CR>", api.node.open.vertical, opts("Open: Vertical Split"))
		end

		local nvimtree = require("nvim-tree")

		nvimtree.setup({
			hijack_cursor = true,
			view = {
				width = 50,
				number = false,
				relativenumber = false,
			},
			renderer = {
				indent_width = 4,
				-- indent_markers = {
				-- 	enable = true,
				-- 	inline_arrows = true,
				-- 	icons = {
				-- 		corner = "┊",
				-- 		edge = "┊",
				-- 		item = "┊",
				-- 		bottom = " ",
				-- 		none = "┊",
				-- 	},
				-- },
				icons = {
					show = {
						file = false,
						folder = false,
						folder_arrow = false,
						git = false,
					},
				},
			},
			on_attach = my_on_attach,
		})

		vim.keymap.set("n", "<LEADER>t", ":NvimTreeOpen<CR>")
	end,
}
