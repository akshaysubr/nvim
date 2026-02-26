return {
  {
    'zbirenbaum/copilot.lua',
    lazy = true, -- Make it fully lazy loaded, seems to cause slow startup?
    cmd = 'Copilot', -- Keep this to make it accessible via command
    config = function()
      require('copilot').setup({})
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'codecompanion' },
  },
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local cc = require('codecompanion')

      cc.setup({
        display = {
          chat = {
            window = {
              layout = 'float',
              height = 0.8,
              width = 0.8,
            },
          },
        },
        adapters = {
          acp = {
            opencode = function()
              return require("codecompanion.adapters").extend("opencode", {
                defaults = {
                  model = "github-copilot/claude-opus-4.5",
                },
              })
            end,
          },
          http = {
            copilot = function()
              return require('codecompanion.adapters').extend('copilot', {
                schema = {
                  model = {
                    default = 'claude-sonnet-4',
                  },
                },
              })
            end,
          },
        },
        interactions = {
          chat = {
            adapter = "opencode",
          },
          inline = {
            adapter = {
              name = "copilot",
              model = "claude-sonnet-4",
            },
          },
        },
      })
      -- vim.keymap.set('n', '<leader>a', '<cmd>CodeCompanionChat Toggle<CR>', { silent = true })
      -- vim.keymap.set('v', '<leader>a', '<cmd>CodeCompanionChat Add<CR>', { silent = true })
    end,
  },
}
