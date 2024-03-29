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
vim.keymap.set("n", "<LEADER>t", ":NvimTreeOpen<CR>") -- Open Tree
-- vim.keymap.set("n", "<LEADER>T", ":NvimTreeClose<CR>") -- Close Tree
-- vim.api.nvim_set_keymap("n", "<LEADER>t", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })

-- Autosave
-- vim.keymap.set("n", "<LEADER>ss", ":lua vim.lsp.buf.format()<CR>")

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<LEADER>f', builtin.find_files, {})
vim.keymap.set('n', '<LEADER>g', builtin.live_grep, {})
vim.keymap.set('n', '<LEADER>b', builtin.buffers, {})

-- UndoTree
vim.keymap.set('n', 'U', ":UndotreeToggle<CR>")

-- Lazygit
vim.api.nvim_create_user_command('Git', ':LazyGit', {})

-- Pane moving
vim.api.nvim_set_keymap("n", "<LEADER>n", "<C-w><LEFT>", { noremap = true })
vim.api.nvim_set_keymap("n", "<LEADER>e", "<C-w><BOTTOM>", { noremap = true })
vim.api.nvim_set_keymap("n", "<LEADER>i", "<C-w><TOP>", { noremap = true })
vim.api.nvim_set_keymap("n", "<LEADER>o", "<C-w><RIGHT>", { noremap = true })
