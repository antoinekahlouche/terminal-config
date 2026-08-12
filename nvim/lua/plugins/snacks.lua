local excluded_patterns = { ".git", "node_modules", ".DS_Store" }

local function format_explorer_item(item, picker)
	local formatted = require("snacks.picker.format").file(item, picker)

	if item.dir then
		local icon = item.open and picker.opts.icons.files.dir_open or picker.opts.icons.files.dir
		local highlight = item.ignored and "SnacksPickerPathIgnored" or "SnacksPickerDirectory"
		local filename_index

		for index, part in ipairs(formatted) do
			if part.field == "file" then
				part[2] = highlight
				filename_index = index
			end
		end

		for index = (filename_index or 1) - 1, 1, -1 do
			local part = formatted[index]
			if part.virtual and type(part[1]) == "string" then
				part[1] = Snacks.picker.util.align(icon, picker.opts.formatters.file.icon_width or 2)
				part[2] = highlight
				break
			end
		end
	end

	return formatted
end

local function set_explorer_highlights()
	local highlights = {
		SnacksPickerFile = "#abb2bf",
		SnacksPickerPathIgnored = "#5c6370",
		SnacksPickerGitStatusIgnored = "#5c6370",
		SnacksPickerGitStatusAdded = "#98c379",
		SnacksPickerGitStatusUntracked = "#98c379",
		SnacksPickerGitStatusModified = "#d19a66",
		SnacksPickerGitStatusDeleted = "#d19a66",
		SnacksPickerGitStatusRenamed = "#d19a66",
		SnacksPickerGitStatusCopied = "#d19a66",
		SnacksPickerGitStatusStaged = "#d19a66",
	}

	for group, color in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, { fg = color })
	end
end

return {
	"folke/snacks.nvim",
	dependencies = { "nvim-mini/mini.icons" },
	config = function(_, opts)
		require("snacks").setup(opts)
		set_explorer_highlights()
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("explorer_colors", { clear = true }),
			callback = set_explorer_highlights,
		})
	end,
	opts = {
		explorer = {},
		picker = {
			sources = {
				explorer = {
					hidden = true,
					ignored = true,
					exclude = excluded_patterns,
					format = format_explorer_item,
				},
				files = { hidden = true, ignored = true, exclude = excluded_patterns },
				grep = { hidden = true, ignored = true, exclude = excluded_patterns },
			},
		},
	},
}
