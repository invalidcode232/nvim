-- Enable LSPs using nvim 0.12 `vim.lsp`

vim.lsp.enable({'lua_ls', 'pyright', 'clangd'})
vim.diagnostic.config({ virtual_text = true, })
