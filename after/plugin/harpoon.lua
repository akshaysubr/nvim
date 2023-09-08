local mark = pcall(require, "harpoon.mark")
local ui = pcall(require, "harpoon.ui")

if mark then
    vim.keymap.set("n", "<leader>a", mark.add_file)
end
if ui then
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
end

-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
-- vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
