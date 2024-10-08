vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual selection up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Bring line from below up into this line" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Fast scroll down keeping curson in the center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Fast scroll up keeping curson in the center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Go to next selection keeping curson in the center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Go to prev selection keeping curson in the center" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Split window
vim.keymap.set("n", "<leader>ss", "<C-w>s", { silent = true, noremap = true, desc = "Horizontal split" })
vim.keymap.set("n", "<leader>sv", "<C-w>v", { silent = true, noremap = true, desc = "Vertical split" })
vim.keymap.set("n", "<leader>sr", "<C-w>r", { silent = true, noremap = true, desc = "Swap splits" })

vim.keymap.set("n", "<leader>sH", "<C-w>H", { silent = true, noremap = true, desc = "Move split left" })
vim.keymap.set("n", "<leader>sJ", "<C-w>J", { silent = true, noremap = true, desc = "Move split down" })
vim.keymap.set("n", "<leader>sK", "<C-w>K", { silent = true, noremap = true, desc = "Move split up" })
vim.keymap.set("n", "<leader>sL", "<C-w>L", { silent = true, noremap = true, desc = "Move split right" })

vim.keymap.set("n", "<leader>s=", "<C-w>=", { silent = true, noremap = true, desc = "Equalize splits" })
vim.keymap.set("n", "<leader>s+", "<C-w>+", { silent = true, noremap = true, desc = "Increase split height" })
vim.keymap.set("n", "<leader>s-", "<C-w>-", { silent = true, noremap = true, desc = "Decrease split height" })
vim.keymap.set("n", "<leader>s>", "<C-w>>", { silent = true, noremap = true, desc = "Increase split width" })
vim.keymap.set("n", "<leader>s<", "<C-w><", { silent = true, noremap = true, desc = "Decrease split width" })

local n_opts = { silent = true, noremap = true, desc = "Better window navigation" }
local t_opts = { silent = true, desc = "Terminal mode window navigation" }

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", n_opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", n_opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", n_opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", n_opts)

-- Terminal mode
-- vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", t_opts)
-- vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", t_opts)
-- vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", t_opts)
-- vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", t_opts)
-- t_opts.desc = "Exit terminal mode"
-- vim.keymap.set("t", "<esc>", "<C-\\><C-N>", t_opts)
