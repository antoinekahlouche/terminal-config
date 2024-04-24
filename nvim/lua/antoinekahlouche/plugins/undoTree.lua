return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "U", ":UndotreeToggle<CR>")
	end,
}
