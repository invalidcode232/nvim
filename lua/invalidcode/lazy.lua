vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    --@region Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },

    --@region LSP
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    --@region CMP
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip', -- Snippet engine
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'onsails/lspkind.nvim',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',

    --@region Code editing
    'numToStr/Comment.nvim',
    'windwp/nvim-ts-autotag',
    'windwp/nvim-autopairs',
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    --@region QoL
    'ggandor/leap.nvim',

    --@region UI
    'romgrk/barbar.nvim', -- Buffers
    'nvim-lualine/lualine.nvim',
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    },
    {
        "catppuccin/nvim",
        as = "catppuccin"
    },
    'j-hui/fidget.nvim',

    --@region Writing
    'ellisonleao/glow.nvim', -- Markdown preview
    'folke/twilight.nvim', -- Zen mode
    'folke/zen-mode.nvim',
}

require("lazy").setup(plugins)
