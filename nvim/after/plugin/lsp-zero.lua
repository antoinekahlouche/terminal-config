local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    -- auto format on exit insert
    vim.cmd [[autocmd InsertLeave <buffer> lua vim.lsp.buf.format()]]
    -- auto format on save
    -- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    lsp.default_keymaps({ buffer = bufnr })
end)

vim.filetype.add({
    extension = {
        postcss = 'css',
        stpl = 'html',
        templ = 'templ',
    }
})

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.htmx.setup {}
lspconfig.templ.setup {}
lspconfig.tailwindcss.setup {
    filetypes = {
        "templ", "astro", "html", "markdown", "mdx", "css", "postcss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte"
    },
    init_options = {
        userLanguages = {
            templ = "html"
        }
    }
}
-- lspconfig.cssls.setup({
--     settings = {
--         css = {
--             lint = {
--                 unknownAtRules = 'ignore',
--             },
--         },
--     }
-- })
-- lspconfig.rust_analyzer.setup {
--     filetypes = { "rust", "html" }
-- }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require 'lspconfig'.html.setup {
    capabilities = capabilities,
}

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
