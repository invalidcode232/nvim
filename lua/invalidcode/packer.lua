-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
    use { 'lewis6991/impatient.nvim' }
    use { 'wbthomason/packer.nvim' }
    use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { "catppuccin/nvim", as = "catppuccin" }
    use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'} }
    use { 'neovim/nvim-lspconfig' }
    use { 'ms-jpq/coq_nvim' }
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'dstein64/vim-startuptime' }
    use { 'ms-jpq/coq.artifacts', { branch =  'artifacts' } }
    use { "windwp/nvim-autopairs" }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use { 'ggandor/leap.nvim' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        "glepnir/lspsaga.nvim",
        branch = "main",
    }
end)
