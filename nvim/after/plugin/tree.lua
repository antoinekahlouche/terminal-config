local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')
    api.config.mappings.default_on_attach(bufnr)

    -- remove a default
    vim.keymap.del('n', 'e', { buffer = bufnr })

    -- override a default
    -- vim.keymap.set('n', '<C-e>', api.tree.reload,                       opts('Refresh'))

    -- add your mappings
    -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
    ---
end

require("nvim-tree").setup({
    view = {
        width = 50,
    },
    on_attach = my_on_attach,
})
