vim.g.mapleader = " "
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.cmd "set noshowmode"

require 'base'
require 'lsp'
require 'lsp_binds'
require 'misc'
require 'ui'
require 'binds'

vim.o.clipboard = "unnamedplus"
