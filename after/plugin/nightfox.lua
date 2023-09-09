local ok, nightfox = pcall(require, 'nightfox')
if ok then
    nightfox.setup({
        options = {
            -- Compiled file's destination location
            transparent = true,            -- Disable setting background
            dim_inactive = false,           -- Non focused panes set to alternative background
        },
    })

    -- setup must be called before loading
    vim.cmd("colorscheme nordfox")
end
