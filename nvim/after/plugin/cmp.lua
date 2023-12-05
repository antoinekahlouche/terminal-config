local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' }
    },
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = {
        -- `Enter` key to confirm completion
        ['<Cr>'] = cmp.mapping.confirm({ select = false }),
        -- `Escape` key to abort completion
        ['<Esc>'] = cmp.mapping.abort(),
    }
})
