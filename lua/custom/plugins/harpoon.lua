return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        -- set keymaps
        local keymap = vim.keymap -- for conciseness
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        keymap.set(
            "n",
            "<leader>ha",
            mark.add_file,
            { desc = "Mark file with harpoon" }
        )
        keymap.set("n", "<leader>hm", ui.toggle_quick_menu,
            { desc = "Toggle harpoon quick menu" })
        keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, { desc = "Navigate to harpoon file 1" })
        keymap.set("n", "<leader>h2", function() ui.nav_file(2) end, { desc = "Navigate to harpoon file 2" })
        keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, { desc = "Navigate to harpoon file 3" })
        keymap.set("n", "<leader>h4", function() ui.nav_file(4) end, { desc = "Navigate to harpoon file 4" })
    end,
}
