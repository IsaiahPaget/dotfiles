local plugins = {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "typescript-language-server",
                "pyright"
            }
        }
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false,
        opts = { signs = false }
    },
    {
        "mbbill/undotree",
        lazy = false,
        init = function()
            require "custom.init"
        end
    },
    {
        -- auto save
        "Pocco81/auto-save.nvim",
        lazy = false,
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
}

return plugins
