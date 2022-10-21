use {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        local saga = require("lspsaga")

        saga.init_lsp_saga()
    end,
}

-- Lspsaga Mappings
keyset('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', silent)
keyset('n', '<leader>cd', '<cmd>Lspsaga show_cursor_diagnostics<CR>', silent)
keyset('n', '<leader>cd', '<cmd>Lspsaga show_line_diagnostics<CR>', silent)
keyset('n', 'rn', '<cmd>Lspsaga rename<CR>', silent)
keyset({'n','v'}, '<leader>ca', '<cmd>Lspsaga code_action<CR>', silent)
keyset('n', 'K', '<cmd>Lspsaga hover_doc<CR>', silent)
keyset('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', silent)

keyset('n', '<Space>gg', '<cmd>Lspsaga open_floaterm lazygit<CR>', silent)
keyset('t', '<A-x>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], silent)
