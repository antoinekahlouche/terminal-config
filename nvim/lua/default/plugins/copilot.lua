return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	cmd = "Copilot",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = false,
			},
			suggestion = {
				enabled = false,
			},
			filetypes = {
				help = true,
				markdown = true,
			},
		})
	end,
}
