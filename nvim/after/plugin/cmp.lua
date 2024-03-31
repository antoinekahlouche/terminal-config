local cmp = require('cmp')

cmp.setup({
    enable = true,
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' }
    },
    preselect = cmp.PreselectMode.Items,
    completion = {
        autocomplete = false,
        completeopt = 'menu,menuone,noinsert',
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-SPACE>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<ESC>'] = cmp.mapping.abort(),
    }),
})
