require('neogit').setup({
    integrations = {
        diffview = true,
    },
})

vim.api.nvim_create_user_command("Git", ":Neogit kind=replace", {})