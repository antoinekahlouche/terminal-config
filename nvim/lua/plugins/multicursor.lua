return {
	"jake-stewart/multicursor.nvim",
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()

		vim.keymap.set("n", "<M-LEFTMOUSE>", mc.handleMouse)
		vim.keymap.set("n", "<M-LEFTDRAG>", mc.handleMouseDrag)
		vim.keymap.set("n", "<M-LEFTRELEASE>", mc.handleMouseRelease)
	end,
}
