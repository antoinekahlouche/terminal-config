local actions = require("telescope.actions")

require('telescope').load_extension('fzf')
require('telescope').setup({
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
