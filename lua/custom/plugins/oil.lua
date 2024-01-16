return {
    "stevearc/oil.nvim",
    config = function()
        local oil = require('oil')
        oil.setup({
            columns = {
                "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },
            -- Configuration for the floating window in oil.open_float
            float = {
                -- Padding around the floating window
                padding = 2,
                max_width = 100,
                max_height = 60,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
                -- This is the config that will be passed to nvim_open_win.
                -- Change values here to customize the layout
                override = function(conf)
                    return conf
                end,
            },
        })
        vim.keymap.set("n", "-", oil.open_float, { desc = "Open parent directory in a floating window" })
    end,
}
