vim.g.mapleader = " "

vim.keymap.set("n", "<LEADER>q", ":bd<CR>")            -- Close current buffer
vim.keymap.set("n", "<LEADER>t", ":NvimTreeOpen<CR>")  -- Open Tree
vim.keymap.set("n", "<LEADER>qq", ":qa<CR>")           -- Close Nvim
vim.keymap.set("n", "<LEADER><TAB>", ":bprevious<CR>") -- Previous buffer

vim.keymap.set("n", "<LEADER>s", ":lua vim.lsp.buf.format()<CR>")

vim.api.nvim_set_keymap("n", "<M-LEFT>", "b", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-RIGHT>", "w", { noremap = true })
vim.api.nvim_set_keymap("v", "<M-LEFT>", "b", { noremap = true })
vim.api.nvim_set_keymap("v", "<M-RIGHT>", "w", { noremap = true })

