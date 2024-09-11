return {
    "nvimtools/none-ls.nvim",            -- configure formatters & linters
    -- lazy = true,
    event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
    dependencies = {
        "jay-babu/mason-null-ls.nvim",
    },
    config = function()
        local mason_null_ls = require("mason-null-ls")

        local null_ls = require("null-ls")

        local null_ls_utils = require("null-ls.utils")

        mason_null_ls.setup({
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua", -- lua formatter
                "black", -- python formatter
                -- "isort", -- python linter
                "ruff", -- python linter
                "mypy", -- python type checker
                "markdownlint", -- markdown linter
            },
        })

        -- for conciseness
        local formatting = null_ls.builtins.formatting -- to setup formatters
        local diagnostics = null_ls.builtins.diagnostics -- to setup linters

        -- to setup format on save
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        -- configure null_ls
        null_ls.setup({
            -- setup formatters & linters
            sources = {
                --  to disable file types use
                --  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
                formatting.black,
                -- formatting.isort,
                formatting.clang_format,
                formatting.jq,
                formatting.prettier,
                -- formatting.stylua, -- lua formatter
                diagnostics.ruff,
                diagnostics.mypy.with({
                    extra_args = { "--ignore-missing-imports" },
                }),
                diagnostics.markdownlint,
            },
            -- configure format on save
            -- on_attach = function(current_client, bufnr)
            -- 	if current_client.supports_method("textDocument/formatting") then
            -- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            -- 		vim.api.nvim_create_autocmd("BufWritePre", {
            -- 			group = augroup,
            -- 			buffer = bufnr,
            -- 			callback = function()
            -- 				vim.lsp.buf.format({
            -- 					filter = function(client)
            -- 						--  only use null-ls for formatting instead of lsp server
            -- 						return client.name == "null-ls"
            -- 					end,
            -- 					bufnr = bufnr,
            -- 				})
            -- 			end,
            -- 		})
            -- 	end
            -- end,
        })
    end,
}
