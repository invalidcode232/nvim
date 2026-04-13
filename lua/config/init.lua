-- Starting point of all our configurations

-- IMPORTANT: Always put remap, then lazy, and then everything else!
require("config.remap")
require("config.lazy") -- This will load all the plugin (and their respective configs/mappings) in lua/plugins

-- Configure our LSP, mainly just enabling them as their configurations are handled by lspconfig
require("config.lsp")

-- Use icons for our signs
require("config.signs")

-- General configuration
vim.cmd.colorscheme "gruvbox"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.showmode = false

vim.opt.cursorline = true

-- Enable nvim 0.12's experimental ui2
require('vim._core.ui2').enable({})
