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
        -- postcss = 'css',
        templ = 'templ',
    }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lspconfig = require 'lspconfig'

-- html
require 'lspconfig'.html.setup {
    capabilities = capabilities,
}

-- scss/css/ls
require 'lspconfig'.cssls.setup {
    capabilities = capabilities,
    settings = {
        css = {
            lint = {
                unknownAtRules = 'ignore',
            },
        },
    }
}

-- js/typescript
require 'lspconfig'.tsserver.setup {
    capabilities = capabilities,
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
}

-- lua
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

-- htmx
lspconfig.htmx.setup {}

-- go.templ
lspconfig.templ.setup {}

-- tailwindcss
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


lsp.setup()
