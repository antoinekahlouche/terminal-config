-- Leader key
vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, "<SPACE>", "<Nop>", { silent = true })

-- Move lines up and down
vim.keymap.set("n", "<A-k>", ":m -2<CR>", { silent = true })
vim.keymap.set("n", "<A-j>", ":m +1<CR>", { silent = true })
vim.keymap.set("n", "<A-Up>", ":m -2<CR>", { silent = true })
vim.keymap.set("n", "<A-Down>", ":m +1<CR>", { silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { silent = true })

-- Exit terminal mode in the builtin terminal with <esc><esc>
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
