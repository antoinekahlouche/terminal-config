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
	config = function()
		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "term://*lazygit",
			callback = function(args)
				vim.keymap.set("t", "<Esc>", function()
					local job = vim.b[args.buf].terminal_job_id

					if job ~= nil then
						vim.api.nvim_chan_send(job, "q")
					end
				end, { buffer = args.buf, nowait = true, silent = true })
			end,
		})
	end,
}
