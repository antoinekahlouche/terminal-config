vim.g.mapleader = " "

vim.keymap.set("n", "<leader>q", ":bd<cr>")            -- Close current buffer
-- vim.keymap.set("n", "<leader>q", ":enew<bar>bd #<cr>")
vim.keymap.set("n", "<leader>t", ":NvimTreeOpen<cr>")  -- Open Tree
vim.keymap.set("n", "<leader>qq", ":qa<cr>")           -- Close Nvim
vim.keymap.set("n", "<leader><tab>", ":bprevious<cr>") -- Previous buffer

vim.keymap.set("n", "<leader><leader>", ":lua vim.lsp.buf.format()<cr>")

vim.api.nvim_set_keymap("n", "<M-Left>", "b", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-Right>", "w", { noremap = true })
vim.api.nvim_set_keymap("v", "<M-Left>", "b", { noremap = true })
vim.api.nvim_set_keymap("v", "<M-Right>", "w", { noremap = true })
