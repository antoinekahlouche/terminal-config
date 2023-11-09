local builtin = require('telescope.builtin')
vim.keymap.set('n', '<LEADER>ff', builtin.find_files, {})
vim.keymap.set('n', '<LEADER>fg', builtin.live_grep, {})
vim.keymap.set('n', '<LEADER>fb', builtin.buffers, {})

local actions = require("telescope.actions")

require('telescope').load_extension('fzf')
require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<ESC>"] = actions.close,
                ["∂"] = actions.delete_buffer,
            },
        },
    },
})
