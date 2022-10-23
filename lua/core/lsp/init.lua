local signs = { Error = "✘", Warn = "", Hint = "•", Info = "" }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Could be '●', '▎', 'x'
    }
})

local function setup()
  require 'core.lsp.lspconfig'
  require 'core.lsp.autopairs'
  require 'core.lsp.cmp'
  require 'core.lsp.comment'
  require 'core.lsp.lspsaga'
  require 'core.lsp.markdown-preview'
  require 'core.lsp.trouble'
end

return {
  setup = setup,
}
