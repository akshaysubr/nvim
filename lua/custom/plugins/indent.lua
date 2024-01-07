return {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        local ibl = require("ibl")

        local highlight = {
            "ScopeHighlight",
        }

        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "ScopeHighlight", { fg = "#cdcecf" })
        end)
        ibl.setup {
            -- indent = { highlight = highlight },
            scope = { enabled = true,
                show_start = true,
                highlight = highlight,
            },
        }
    end
}
