local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    -- auto format onn save
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    lsp.default_keymaps({ buffer = bufnr })
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
