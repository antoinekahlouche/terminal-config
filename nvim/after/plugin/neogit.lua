local neogit = require('neogit')

vim.api.nvim_create_user_command("Git", ":Neogit kind=replace", {})

neogit.setup({
    integrations = {
        diffview = true,
    },
})
