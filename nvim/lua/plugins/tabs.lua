return {
	"akinsho/bufferline.nvim",
	opts = {
		options = {
			always_show_bufferline = true,
			middle_mouse_command = function(bufnum)
				require("snacks").bufdelete(bufnum)
			end,
		},
	},
}
