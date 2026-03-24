return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local configs = require("nvim-treesitter.configs")
		local ok, parsers = pcall(require, "nvim-treesitter.parsers")

		if ok and parsers.ft_to_lang == nil and vim.treesitter.language.get_lang then
			parsers.ft_to_lang = function(ft)
				return vim.treesitter.language.get_lang(ft) or ft
			end
		end

		configs.setup({
			ensure_installed = {
				"astro",
				"svelte",
				"css",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"query",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})
	end,
}
