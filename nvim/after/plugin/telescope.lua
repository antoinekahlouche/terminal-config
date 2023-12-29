local actions = require("telescope.actions")
local fb_actions = require "telescope".extensions.file_browser.actions

require('telescope').load_extension('fzf')
require('telescope').setup({
    defaults = {
        file_ignore_patterns = { "node_modules", "target", "%_templ.go", "go.sum" },
        mappings = {
            i = {
                ["<ESC>"] = actions.close,
                ["∂"] = actions.delete_buffer, -- <Opt-d> on MacOS
            },
        },
    },
    extensions = {
        file_browser = {
            grouped = true,
            prompt_path = true,
            select_buffer = true,
            hide_parent_dir = true,
            mappings = {
                ["i"] = {
                    ["å"] = fb_actions.create,
                    ["®"] = fb_actions.rename,
                    ["∂"] = fb_actions.remove,
                    ["˙"] = fb_actions.toggle_hidden,
                    ["<CR>"] = "select_default"
                }
            }
        }
    },

})

require('telescope').load_extension('file_browser')
