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
      local oai_url = vim.env.OAI_URL
      local oai_api_key = vim.env.OAI_APIKEY
      local oai_model = vim.env.OAI_MODEL

      -- If a `~/.workrc` has set these envvars on this machine,
      -- ensure we use them for LLM access instead of copilot.
      local adapter = 'copilot'
      if oai_url and oai_api_key and oai_model then
        adapter = 'azure_compat'
      end
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
          -- copilot = function()
          --   return require('codecompanion.adapters').extend('copilot', {
          --     schema = {
          --       model = {
          --         default = 'claude-3.7-sonnet',
          --       },
          --     },
          --   })
          -- end,
          azure_compat = function()
            return require('codecompanion.adapters').extend('azure_openai', {
              env = {
                api_key = oai_api_key,
                endpoint = oai_url,
              },
              schema = {
                model = {
                  default = oai_model,
                },
              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = adapter,
          },
          inline = {
            adapter = adapter,
          },
        },
      })
      vim.keymap.set('n', '<leader>a', cc.toggle, { silent = true })
      vim.keymap.set('v', '<leader>a', ':CodeCompanionChat Add<CR>')
    end,
  },
}
