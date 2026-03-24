return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local function sync_tree_highlights()
			vim.api.nvim_set_hl(0, "NvimTreeFolderName", { link = "NvimTreeFileName" })
			vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { link = "NvimTreeFolderName" })
			vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { link = "NvimTreeFolderName" })
			vim.api.nvim_set_hl(0, "NvimTreeImageFile", { link = "NvimTreeFileName" })
			vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { link = "Directory" })
			vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderIcon", { link = "Directory" })
		end

		sync_tree_highlights()
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("nvim-tree-highlights", { clear = true }),
			callback = sync_tree_highlights,
		})

		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			api.config.mappings.default_on_attach(bufnr)

			vim.keymap.del("n", "e", { buffer = bufnr })

			vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory or Go to Parent"))
			vim.keymap.set("n", "<Left>", api.node.navigate.parent_close, opts("Close Directory or Go to Parent"))

			vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "<Right>", api.node.open.edit, opts("Open"))

			-- vim.keymap.set("n", "<LeftRelease>", api.node.open.preview, opts("Preview"))
		end

		local nvimtree = require("nvim-tree")

		nvimtree.setup({
			git = {
				ignore = false,
			},
			filters = {
				git_ignored = false,
				custom = { ".DS_Store" },
			},
			hijack_cursor = true,
			view = {
				width = 40,
				relativenumber = true,
			},
			renderer = {
				add_trailing = false,
				special_files = {},
				root_folder_label = false,
				indent_width = 3,
				highlight_git = true,
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = false,
					},
				},
			},
			on_attach = my_on_attach,
		})

		vim.keymap.set("n", "<LEADER>t", ":NvimTreeOpen<CR>")
	end,
}
