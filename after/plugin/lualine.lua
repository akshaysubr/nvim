local custom_theme = require'lualine.themes.base16'

if custom_theme then
    require('lualine').setup {
        options = { theme  = custom_theme },
    }
end
