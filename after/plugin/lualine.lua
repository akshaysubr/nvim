local ok, custom_theme = pcall(require, 'lualine.themes.base16')

if ok then
    require('lualine').setup {
        options = { theme  = custom_theme },
    }
end
