local ok, builtin = pcall(require, 'telescope.builtin')

if ok then
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>fs', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end)
end
