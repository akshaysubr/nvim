local indent = pcall(require, "indent_blankline")

if indent then
    indent.setup {
        -- for example, context is off by default, use this to turn it on
        show_current_context = true,
        show_current_context_start = true,
    }
end
