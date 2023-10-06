local ok, lsp = pcall(require, 'lsp-zero')

if ok then
    lsp.preset('recommended')

    require('mason').setup({})
    require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
            lsp.default_setup,
        }
    })

    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    })

    lsp.setup_nvim_cmp({
        mapping = cmp_mappings,
        preselect = 'none',
        completion = {
            completeopt = 'menu,menuone,noinsert,noselect'
        },
    })

    -- local cmp = require('cmp')
    -- local cmp_select = { behavior = cmp.SelectBehavior.Select }

    -- cmp.setup({
    --     sources = {
    --         { name = 'path' },
    --         { name = 'nvim_lsp' },
    --         { name = 'nvim_lua' },
    --     },
    --     formatting = lsp.cmp_format(),
    --     mapping = cmp.mapping.preset.insert({
    --         ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    --         ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    --         ['<cr>'] = cmp.mapping.confirm({ select = true }),
    --         ['<C-Space>'] = cmp.mapping.complete(),
    --     }),
    --     preselect = 'none',
    --     completion = {
    --         completeopt = 'menu,menuone,noinsert,noselect'
    --     },
    -- })

    lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    end)

    -- lsp.skip_server_setup({'clangd'})

    lsp.setup()

    -- require('clangd_extensions').setup()
end
