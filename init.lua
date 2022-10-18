vim.g.mapleader = " "
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

require 'base'
require 'lsp'
require 'lsp_binds'
require 'misc'
require 'ui'
require 'binds'

vim.o.clipboard = "unnamedplus"
