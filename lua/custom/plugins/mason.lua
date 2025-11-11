return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "clangd",
                "cmake",
                "dockerls",
                "jsonls",
                "ltex",
                "lua_ls",
                "pyright",
                --"ruff_lsp",
                "taplo",
                "yamlls",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "clang-format",
                "prettier", -- prettier formatter
                "prettierd",
                "stylua",   -- lua formatter
                "isort",    -- python formatter
                "black",    -- python formatter
                "ruff",     -- python linter
                "mypy",     -- python type checker
                "debugpy",  -- python debugger
                -- "markdownlint",
                "jq",
            },
        })
    end,
}
