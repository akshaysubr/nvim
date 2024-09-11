return {
    'mfussenegger/nvim-dap-python',
    ft = "python",
    dependencies = {
        'mfussenegger/nvim-dap',
    },
    keys = {
        { "<leader>dpm", function() require('dap-python').test_method() end, desc = "Debug Python Method" },
        { "<leader>dpc", function() require('dap-python').test_class() end,  desc = "Debug Python Class" },
        { "<leader>dps", function() require('dap-python').debug_selection() end,  desc = "Debug Python Selection" },
      },
    config = function()
        -- Install python specific config
        local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
        local path = mason_path .. "packages/debugpy/venv/bin/python"
        -- local path = "/usr/bin/python3.10"
	local dap_python = require('dap-python')
        dap_python.setup(path) -- path to mason debugpy install
        -- vim.keymap.set('n', '<leader>dpm', dap_python.test_method(), { desc = 'Test python method' })
        -- vim.keymap.set('n', '<leader>dpc', dap_python.test_class(), { desc = 'Test python class' })
        -- vim.keymap.set('n', '<leader>dps', dap_python.debug_selection(), { desc = 'Test python selection' })
    end,
}
