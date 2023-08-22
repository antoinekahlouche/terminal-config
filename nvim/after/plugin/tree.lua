local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

    api.config.mappings.default_on_attach(bufnr)

    -- remove a default
    vim.keymap.del('n', 'e', { buffer = bufnr })

    -- override a default
    -- vim.keymap.set('n', '<C-e>', api.tree.reload,                       opts('Refresh'))
    vim.keymap.set('n', '<esc>', api.tree.close, opts('Close'))

    -- add your mappings
    -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
    ---
end

local HEIGHT_RATIO = 0.9 -- You can change this
local WIDTH_RATIO = 0.8  -- You can change this too

require("nvim-tree").setup({
    -- disable_netrw = true,
    -- hijack_netrw = true,
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
    hijack_cursor = true,
    view = {
        width = 50,
        relativenumber = true,
        -- float = {
        --     enable = true,

        --     open_win_config = function()
        --         local screen_w = vim.opt.columns:get()
        --         local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        --         local window_w = screen_w * WIDTH_RATIO
        --         local window_h = screen_h * HEIGHT_RATIO
        --         local window_w_int = math.floor(window_w)
        --         local window_h_int = math.floor(window_h)
        --         local center_x = (screen_w - window_w) / 2
        --         local center_y = ((vim.opt.lines:get() - window_h) / 2)
        --                          - vim.opt.cmdheight:get()
        --         return {
        --           border = "rounded",
        --           relative = "editor",
        --           row = center_y,
        --           col = center_x,
        --           width = window_w_int,
        --           height = window_h_int,
        --         }
        --     end,
        -- },
        -- width = function()
        --     return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        -- end,
    },
    actions = {
        open_file = {
          quit_on_open = true,
        },
    },
    on_attach = my_on_attach,
})
