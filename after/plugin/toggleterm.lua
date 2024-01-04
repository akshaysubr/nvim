local ok, toggleterm = pcall(require, 'toggleterm')

if ok then
    local trim_spaces = true
    -- Send visual selection to terminal
    vim.keymap.set("v", "<space>ts", function()
        toggleterm.send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })
    end)
    -- Send whole file
    vim.keymap.set("n", [[<leader>tsf]], function()
        set_opfunc(function(motion_type)
            toggleterm.send_lines_to_terminal(motion_type, false, { args = vim.v.count })
        end)
        vim.api.nvim_feedkeys("ggg@G''", "n", false)
    end)

    -- Custom terminals
    local aok, ttterm = pcall(require, 'toggleterm.terminal')
    if aok then
        local Terminal = ttterm.Terminal

        -- Lazygit
        -- local lazygit  = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })

        -- function _lazygit_toggle()
        --     lazygit:toggle()
        -- end

        local lazygit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            direction = "float",
            hidden = true,
            float_opts = {
                border = "rounded",
            },
            -- function to run on opening the terminal
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
            end,
            -- function to run on closing the terminal
            on_close = function(term)
                vim.cmd("startinsert!")
            end,
        })

        function _lazygit_toggle()
            lazygit:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

        -- htop
        local htop = Terminal:new({
            cmd = "htop",
            direction = "float",
            float_opts = {
                border = "rounded",
            },
            hidden = true })

        function _htop_toggle()
            htop:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>lua _htop_toggle()<CR>", { noremap = true, silent = true })

        -- nvidia-smi
        local nvsmi = Terminal:new({
            cmd = "watch -n1 nvidia-smi",
            direction = "float",
            float_opts = {
                border = "rounded",
                width = 100,
                height = 36,
            },
            start_in_insert = false,
            hidden = true })

        function _nvsmi_toggle()
            nvsmi:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>lua _nvsmi_toggle()<CR>", { noremap = true, silent = true })
    end
end
