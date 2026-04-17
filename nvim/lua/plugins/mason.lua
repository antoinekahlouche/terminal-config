return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = function(_, opts)
		local filetypes = require("filetypes")

		opts.ensure_installed = opts.ensure_installed or {}

		for _, tool in ipairs(filetypes.mason) do
			if not vim.tbl_contains(opts.ensure_installed, tool) then
				table.insert(opts.ensure_installed, tool)
			end
		end
	end,
}
