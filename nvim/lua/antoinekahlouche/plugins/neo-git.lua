return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local neogit = require("neogit")

		neogit.setup({
			integrations = {
				diffview = true,
			},
		})

		vim.api.nvim_create_user_command("Git", ":Neogit", {})
	end,
}
