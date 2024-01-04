local ok, oil = pcall(require, 'oil')

if ok then
    vim.keymap.set("n", "-", oil.open_float, { desc = "Open parent directory in a floating window" })
end
