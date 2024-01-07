return {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
        local toggleterm = require("toggleterm")

        toggleterm.setup({
            -- size can be a number or function which is passed the current terminal
            size = function(term)
                if term.direction == "horizontal" then
                    return 20
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<c-t>]],
            hide_numbers = true, -- hide the number column in toggleterm buffers
            direction = 'horizontal',
            -- This field is only relevant if direction is set to 'float'
            float_opts = {
                -- The border key is *almost* the same as 'nvim_open_win'
                -- see :h nvim_open_win for details on borders however
                -- the 'curved' border is a custom border type
                -- not natively supported but implemented in this plugin.
                border = 'rounded',
                -- like `size`, width and height can be a number or function which is passed the current terminal
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },

        })

        local trim_spaces = true
        -- Send visual selection to terminal
        vim.keymap.set("v", "<space>ts", function()
            toggleterm.send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })
        end, { desc = "Send visual selection to terminal" })
        -- Send whole file
        vim.keymap.set("n", [[<leader>tsf]], function()
            set_opfunc(function(motion_type)
                toggleterm.send_lines_to_terminal(motion_type, false, { args = vim.v.count })
            end)
            vim.api.nvim_feedkeys("ggg@G''", "n", false)
        end, { desc = "Send whole file to terminal" })

        -- Custom terminals
        local ttterm = require('toggleterm.terminal')
        local Terminal = ttterm.Terminal

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
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>",
                    { noremap = true, silent = true })
            end,
            -- function to run on closing the terminal
            on_close = function(term)
                vim.cmd("startinsert!")
            end,
        })

        function _lazygit_toggle()
            lazygit:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>",
            { noremap = true, silent = true, desc = "Toggle LazyGit" })

        -- htop
        local htop = Terminal:new({
            cmd = "htop",
            direction = "float",
            float_opts = {
                border = "rounded",
            },
            hidden = true
        })

        function _htop_toggle()
            htop:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>lua _htop_toggle()<CR>",
            { noremap = true, silent = true, desc = "Toggle htop" })

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
            hidden = true
        })

        function _nvsmi_toggle()
            nvsmi:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>lua _nvsmi_toggle()<CR>",
            { noremap = true, silent = true, desc = "Toggle nvidia-smi" })
    end
}
