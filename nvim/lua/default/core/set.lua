-- UI
vim.opt.guicursor = "n-v-c-i:block"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Editing behavior
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.backspace = "indent,eol,start"

-- File handling
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.autoread = true
vim.opt.updatetime = 50

-- Window behavior
vim.opt.splitright = true

-- Misc
vim.opt.clipboard = "unnamedplus"
vim.opt.isfname:append("@-@")

-- Disable netrw early so file explorer plugins can take over.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Keep literal tabs in Makefiles.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "make",
	callback = function()
		vim.opt.expandtab = false
	end,
})

-- Reload buffers when files change outside Neovim.
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	pattern = "*",
	command = "if mode() != 'c' | checktime | endif",
})
