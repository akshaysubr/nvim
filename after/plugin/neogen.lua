local neogen = require('neogen')

neogen.setup {
    enabled = true, --if you want to disable Neogen
    input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
    languages = {
        python = {
            template = {
                annotation_convention = "numpydoc"
            }
        },
    }
}

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>nc", function() return neogen.generate({ type = 'class' }) end, opts)
vim.keymap.set("n", "<leader>nf", function() return neogen.generate({ type = 'func' }) end, opts)
vim.keymap.set("n", "<leader>nt", function() return neogen.generate({ type = 'type' }) end, opts)
vim.keymap.set("n", "<leader>nm", function() return neogen.generate({ type = 'file' }) end, opts)
