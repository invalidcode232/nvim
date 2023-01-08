local lspsaga = require 'lspsaga'
lspsaga.init_lsp_saga()

vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', silent)
vim.keymap.set('n', '<leader>cd', '<cmd>Lspsaga show_cursor_diagnostics<CR>', silent)
vim.keymap.set('n', '<leader>cd', '<cmd>Lspsaga show_line_diagnostics<CR>', silent)
vim.keymap.set('n', 'rn', '<cmd>Lspsaga rename<CR>', silent)
vim.keymap.set({'n','v'}, '<leader>ca', '<cmd>Lspsaga code_action<CR>', silent)
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', silent)
vim.keymap.set('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', silent)

vim.keymap.set('n', '<Space>gg', '<cmd>Lspsaga open_floaterm lazygit<CR>', silent)
vim.keymap.set('t', '<A-x>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], silent)
