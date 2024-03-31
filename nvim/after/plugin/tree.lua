vim.keymap.set("n", "<LEADER>t", ":NvimTreeOpen<CR>")

local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    -- remove a default
    vim.keymap.del('n', 'e', { buffer = bufnr })

    -- override a default
    vim.keymap.set('n', '<Esc>', api.tree.close, opts('Close'))
    vim.keymap.set('n', '<Right>', api.node.open.edit, opts('Edit'))
    vim.keymap.set('n', '<Left>', api.node.open.preview, opts('Preview'))
    vim.keymap.set('n', '<LEADER><CR>', api.node.open.vertical, opts('Open: Vertical Split'))

    -- add your mappings
    -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
    ---
end

require("nvim-tree").setup({
    hijack_cursor = true,
    view = {
        width = 50,
        number = true,
        relativenumber = true,
    },
    renderer = {
        -- add_trailing = true,
        indent_width = 4,
        icons = {
            show = {
                file = false,
                folder = false,
                folder_arrow = false,
                git = false,
            }
        }
    },
    actions = {
        open_file = {
            -- quit_on_open = true,
        },
    },
    on_attach = my_on_attach,
})
