return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local custom_theme = require('lualine.themes.base16')

        require('lualine').setup {
            options = { theme = custom_theme },
        }
    end,
}
