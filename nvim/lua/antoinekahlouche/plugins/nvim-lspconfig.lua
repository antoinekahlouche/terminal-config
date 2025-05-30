-- https://medium.com/@ns090200/setting-up-neovim-from-scratch-3-lsp-08f2aea0d3e1
return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require('lspconfig')

        lspconfig.eslint.setup ({})
        lspconfig.ts_ls.setup {}
        lspconfig.lua_ls.setup {}
        lspconfig.astro.setup {}

    end
}