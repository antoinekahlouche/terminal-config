vim.g.lazygit_floating_window_scaling_factor = 1

return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	init = function()
		vim.cmd([[cnoreabbrev <expr> git getcmdtype() == ':' && getcmdline() ==# 'git' ? 'LazyGit' : 'git']])
	end,
}
