vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>q", ":bd<cr>")
vim.keymap.set("n", "<leader>q", ":enew<bar>bd #<cr>")
vim.keymap.set("n", "<leader>t", ":NvimTreeOpen<cr>")
vim.keymap.set("n", "<leader>qq", ":qa<cr>")
vim.keymap.set("n", "<leader><tab>", ":bprevious<cr>")

-- Colemak: hjkl>neio, i>t
vim.api.nvim_set_keymap("n", "n", "h", { noremap = true }) -- move Left
vim.api.nvim_set_keymap("n", "e", "j", { noremap = true }) -- move Down
vim.api.nvim_set_keymap("n", "i", "k", { noremap = true }) -- move Up
vim.api.nvim_set_keymap("n", "o", "l", { noremap = true }) -- move Right
vim.api.nvim_set_keymap("n", "t", "i", { noremap = true }) -- (t)ype           replaces (i)nsert
-- vim.api.nvim_set_keymap("n", "T", "I", { noremap = true })          -- (T)ype at bol    replaces (I)nsert
-- vim.api.nvim_set_keymap("n", "E", "e", { noremap = true })          -- end of word      replaces (e)nd
-- vim.api.nvim_set_keymap("n", "h", "n", { noremap = true })          -- next match       replaces (n)ext
-- vim.api.nvim_set_keymap("n", "k", "N", { noremap = true })          -- previous match   replaces (N) prev

-- Visual Colemak
vim.api.nvim_set_keymap("v", "n", "h", { noremap = true })    -- move Left
vim.api.nvim_set_keymap("v", "e", "j", { noremap = true })    -- move Down
vim.api.nvim_set_keymap("v", "I", "k", { noremap = true })    -- move Up
vim.api.nvim_set_keymap("v", "o", "l", { noremap = true })    -- move Right - shifted to fix [v]isual[i]n[...]
