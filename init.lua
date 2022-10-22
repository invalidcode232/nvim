vim.g.mapleader = " "
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.cmd "set noshowmode"
vim.cmd 'autocmd filetype markdown setlocal nonumber' 
vim.cmd 'set number'
vim.cmd 'se cursorline'


require 'base'

require 'core.misc'.setup()
require 'core.ui'.setup()
require 'core.lsp'.setup()

require 'binds'

vim.o.clipboard = "unnamedplus"

