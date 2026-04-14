-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function can_persist_buffer(bufnr)
	return vim.api.nvim_buf_is_valid(bufnr)
		and vim.bo[bufnr].buftype == ""
		and vim.fn.bufname(bufnr) ~= ""
		and vim.bo[bufnr].modifiable
		and not vim.bo[bufnr].readonly
		and vim.bo[bufnr].modified
end

local autosave_group = vim.api.nvim_create_augroup("autosave_on_change", { clear = true })

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
	group = autosave_group,
	callback = function(args)
		local bufnr = args.buf
		if not can_persist_buffer(bufnr) then
			return
		end

		vim.api.nvim_buf_call(bufnr, function()
			vim.cmd("silent write")
		end)
	end,
})
