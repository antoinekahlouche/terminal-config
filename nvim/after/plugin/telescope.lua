local actions = require("telescope.actions")

require('telescope').load_extension('fzf')
require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<ESC>"] = actions.close,
                ["∂"] = actions.delete_buffer, -- <Opt-d> on MacOS
            },
        },
    },
})
