local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- change leader key to space --
local g = vim.g
g.mapleader = " "
g.maplocalleader = " "

require("lazy").setup {
    -- Theme --
    { "getomni/neovim" },
    -- Harpoon --
    {
        "theprimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- Indents --
    { "lukas-reineke/indent-blankline.nvim" },
    -- File Browser --
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },

    -- Transparent
    -- { "xiyaowong/transparent.nvim" }

    -- Colorizer
    { "NvChad/nvim-colorizer.lua" },

    { "lewis6991/async.nvim" },

    {
        {"akinsho/toggleterm.nvim", version = "*", config = true}
    },

    -- Copilot --
    { 
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({})
        end,

    },
    -- lsp & completion --
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support --
            { "neovim/nvim-lspconfig" },
            {
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion --
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            {
                "L3MON4D3/LuaSnip",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                    "saadparwaiz1/cmp_luasnip",
                },
            },
            { "dcampos/nvim-snippy" },
            { "dcampos/cmp-snippy" },
            { "onsails/lspkind.nvim" },
        },
    },
    { "williamboman/mason.nvim" },
    -- startup --
    {
        "startup-nvim/startup.nvim",
        lazy = true,
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
    },
    { "folke/todo-comments.nvim" },
    { "folke/which-key.nvim" },
    { "ThePrimeagen/vim-be-good" },
}
