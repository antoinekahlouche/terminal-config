require("toggleterm").setup({
    open_mapping = "<LEADER><BS>",
    hide_numbers = true,
    start_in_insert = true,
    direction = "float",
    auto_scroll = true,
    float_opts = {
        width = function()
            return math.floor(vim.o.columns * 0.9)
        end,
        height = function()
            return math.floor(vim.o.lines * 0.9)
        end,
    },
})
