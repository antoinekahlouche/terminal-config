return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local comment = require("Comment")
		local ft = require("Comment.ft")

		comment.setup()
		ft({ "templ" }, ft.get("go"))
	end,
}
