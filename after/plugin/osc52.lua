local ok, osc52 = pcall(require, 'osc52')

if ok then
    osc52.setup {
        max_length = 0,          -- Maximum length of selection (0 for no limit)
        silent = false,          -- Disable message on successful copy
        trim = false,            -- Trim surrounding whitespaces before copy
        tmux_passthrough = false,-- Use tmux passthrough (requires tmux: set -g allow-passthrough on)
    }

    vim.keymap.set('n', '<leader>c', osc52.copy_operator, { expr = true })
    vim.keymap.set('n', '<leader>cc', '<leader>c_', { remap = true })
    vim.keymap.set('v', '<leader>c', osc52.copy_visual)

    function copy()
        if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
            osc52.copy_register('+')
        end
    end

    vim.api.nvim_create_autocmd('TextYankPost', { callback = copy })
end
