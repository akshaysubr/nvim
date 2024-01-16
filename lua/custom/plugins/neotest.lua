return {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    optional = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-python",
    },
    opts = {
        adapters = {
            ["neotest-python"] = {
                -- Here you can specify the settings for the adapter, i.e.
                dap = {
                    justMyCode = false,
                    console = "integratedTerminal",
                },
                runner = "pytest",
                -- python = ".venv/bin/python",
            },
        },
    },
}
