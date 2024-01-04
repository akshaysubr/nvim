-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

-- Protected call to make sure that packer is installed
local status_ok, packer = pcall(require, "packer")

if not status_ok then
    return
end

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        "EdenEast/nightfox.nvim",
        as = 'nightfox',
        -- config = function()
        --     vim.cmd("colorscheme nordfox")
        -- end
    })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            -- Snippet Collection (Optional)
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use('p00f/clangd_extensions.nvim')

    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('lukas-reineke/indent-blankline.nvim')

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        "danymat/neogen",
        config = function()
            require('neogen').setup {}
        end,
        requires = "nvim-treesitter/nvim-treesitter",
        -- Uncomment next line if you want to follow only stable versions
        -- tag = "*"
    }

    use { 'akinsho/git-conflict.nvim', tag = "v1.1.0", config = function()
        require('git-conflict').setup({
            default_mappings = true,     -- disable buffer local mapping created by this plugin
            default_commands = true,     -- disable commands created by this plugin
            disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
            highlights = {
                -- They must have background color, otherwise the default color will be used
                incoming = 'DiffText',
                current = 'DiffAdd',
            }
        })
    end }

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup({
            -- size can be a number or function which is passed the current terminal
            size = function(term)
                if term.direction == "horizontal" then
                    return 20
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<c-t>]],
            hide_numbers = true, -- hide the number column in toggleterm buffers
            direction = 'horizontal',
            -- This field is only relevant if direction is set to 'float'
            float_opts = {
                -- The border key is *almost* the same as 'nvim_open_win'
                -- see :h nvim_open_win for details on borders however
                -- the 'curved' border is a custom border type
                -- not natively supported but implemented in this plugin.
                border = 'rounded',
                -- like `size`, width and height can be a number or function which is passed the current terminal
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },

        })
    end }

    use { 'ojroques/nvim-osc52' }

    use { "stevearc/oil.nvim", config = function()
        require("oil").setup({
            columns = {
                "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },
            -- Configuration for the floating window in oil.open_float
            float = {
                -- Padding around the floating window
                padding = 2,
                max_width = 100,
                max_height = 60,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
                -- This is the config that will be passed to nvim_open_win.
                -- Change values here to customize the layout
                override = function(conf)
                    return conf
                end,
            },
        })
    end,
    }

    use { "folke/which-key.nvim", config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    end
    }

    -- use {
    --     'chipsenkbeil/distant.nvim',
    --     branch = 'v0.3',
    --     config = function()
    --         require('distant'):setup()
    --     end
    -- }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
