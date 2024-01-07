return {
    {
        "EdenEast/nightfox.nvim",
        name = 'nightfox',
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("nightfox").setup({
                options = {
                    -- Compiled file's destination location
                    transparent = true, -- Disable setting background
                    dim_inactive = false, -- Non focused panes set to alternative background
                },
            })
            -- load the colorscheme here
            vim.cmd([[colorscheme nordfox]])
        end,
    }
}
