local null_ls = require("null-ls")

if null_ls then
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
            null_ls.builtins.diagnostics.flake8.with({ extra_args = { "--max-line-length", "88", "--extend-ignore=E203" } }),
            null_ls.builtins.completion.spell,
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.diagnostics.markdownlint,
        },
    })
end
