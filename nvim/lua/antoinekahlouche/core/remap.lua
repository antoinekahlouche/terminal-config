-- Global
vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, "<SPACE>", "<Nop>", { silent = true })
vim.keymap.set("n", "q", ":bd<CR>") -- Close current buffer
vim.keymap.set("n", "<LEADER><ENTER>", ":bprev<CR>")
vim.keymap.set("n", "<LEADER><BACKSPACE>", ":bnext<CR>")
vim.keymap.set("n", "<LEADER>q", ":qa<CR>") -- Close Nvim
vim.keymap.set({ "n", "v" }, "<A-UP>", ":m -2<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<A-DOWN>", ":m +1<CR>", { silent = true })

-- Kahboard
vim.keymap.set("n", "<M-LEFT>", "b")
vim.keymap.set("n", "<M-RIGHT>", "w")
vim.keymap.set("v", "<M-LEFT>", "b")
vim.keymap.set("v", "<M-RIGHT>", "w")

-- Pane moving
vim.keymap.set("n", "<LEADER>n", "<C-w><LEFT>")
vim.keymap.set("n", "<LEADER>e", "<C-w><BOTTOM>")
vim.keymap.set("n", "<LEADER>i", "<C-w><TOP>")
vim.keymap.set("n", "<LEADER>o", "<C-w><RIGHT>")
