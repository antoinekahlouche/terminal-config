local telescope = require('telescope')
local actions = require("telescope.actions")
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<LEADER>f', builtin.find_files, {})
vim.keymap.set('n', '<LEADER>g', builtin.live_grep, {})
vim.keymap.set('n', '<LEADER>b', builtin.buffers, {})

telescope.load_extension('fzf')
telescope.setup({
    defaults = {
        file_ignore_patterns = { "node_modules", "target", "%_templ.go", "go.sum", "package-lock.json" },
        mappings = {
            i = {
                ["<ESC>"] = actions.close,
                ["∂"] = actions.delete_buffer, -- <Opt-d> on MacOS
                -- ["<A-d>"] = actions.delete_buffer,
                ["<LEADER><CR>"] = actions.select_vertical,
            },
        },
    },
})
