local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    -- auto format onn save
    -- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    lsp.default_keymaps({ buffer = bufnr })
end)

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.htmx.setup{}
lspconfig.tailwindcss.setup{}

lsp.setup()

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
