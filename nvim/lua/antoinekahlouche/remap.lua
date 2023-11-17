-- Global
vim.g.mapleader = " "
vim.keymap.set({ 'n', 'v' }, '<SPACE>', '<Nop>', { silent = true })
vim.keymap.set("n", "<LEADER>qq", ":bd<CR>")           -- Close current buffer
vim.keymap.set("n", "<LEADER>qa", ":qa<CR>")           -- Close Nvim
vim.keymap.set("n", "<LEADER><TAB>", ":bprevious<CR>") -- Previous buffer

-- Kahboard
vim.api.nvim_set_keymap("n", "<M-LEFT>", "b", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-RIGHT>", "w", { noremap = true })
vim.api.nvim_set_keymap("v", "<M-LEFT>", "b", { noremap = true })
vim.api.nvim_set_keymap("v", "<M-RIGHT>", "w", { noremap = true })

-- Tree
vim.keymap.set("n", "<LEADER>tt", ":NvimTreeOpen<CR>") -- Open Tree

-- Autosave
vim.keymap.set("n", "<LEADER>ss", ":lua vim.lsp.buf.format()<CR>")

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<LEADER>ff', builtin.find_files, {})
vim.keymap.set('n', '<LEADER>fg', builtin.live_grep, {})
vim.keymap.set('n', '<LEADER>fb', builtin.buffers, {})
