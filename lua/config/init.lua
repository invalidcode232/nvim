-- Starting point of all our configurations

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy as plugin manager
require("config.lazy")

-- Other keymaps
require("config.keymaps")

-- Configure our LSP 
require("config.lsp")

-- General configuration
vim.cmd.colorscheme "gruvbox"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.clipboard = "unnamedplus"

vim.opt.breakindent = true

vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.hlsearch = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = true

-- Enable nvim 0.12's experimental ui2
require('vim._core.ui2').enable({})
