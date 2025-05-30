return {
    'stevearc/conform.nvim',

    config = function()
        local conform = require("conform")
            
        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier", stop_after_first = true },
                javascriptreact = { "prettier", stop_after_first = true },
                typescriptreact = { "prettier", stop_after_first = true },
                astro = { "prettier", stop_after_first = true },
                css = { "prettier", stop_after_first = true },
                html = { "prettier", stop_after_first = true },
                json = { "prettier", stop_after_first = true },
                lua = { "stylua", stop_after_first = true },
                markdown = { "prettier", stop_after_first = true },
                typescript = { "prettier", stop_after_first = true },
                yaml = { "prettier", stop_after_first = true },
            },
        })

        vim.api.nvim_create_autocmd("InsertLeave", {
            pattern = "*",
            callback = function(args)
                conform.format({ bufnr = args.buf })
            end,
        })
    end
}