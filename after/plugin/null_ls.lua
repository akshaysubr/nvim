local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
        null_ls.builtins.diagnostics.flake8.with({ extra_args = { "--max-line-length", "88", "--extend-ignore=E203" } }),
        null_ls.builtins.completion.spell,
    },
})
