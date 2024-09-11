return {
    'nvim-telescope/telescope.nvim',
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        -- local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                path_display = { "truncate " },
                -- mappings = {
                --     i = {
                --         ["<C-k>"] = actions.move_selection_previous,     -- move to prev result
                --         ["<C-j>"] = actions.move_selection_next,         -- move to next result
                --         ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                --     },
                -- },
            },
        })

        telescope.load_extension("fzf")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" }) -- Needs ripgrep available
        -- keymap.set("n", "<leader>fs", builtin.grep_string({ search = vim.fn.input("Grep > ") }), { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List open buffers in current neovim instance" })
        keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "List items in the quickfix list" })
        keymap.set("n", "<leader>fq", builtin.keymaps, { desc = "List normal mode keymappings" })
    end,
}
