-- LSP related settings

-- Enable the following LSPs
local lsps = {"lua_ls", "pyright", "clangd"}
vim.lsp.enable(lsps)

-- Use icons as signs
local signs = {
    Error = " ",
    Warn = " ",
    Hint = "󰌵 ",
    Info = " "
}

local signConf = {
  text = {},
  texthl = {},
  numhl = {},
}

for type, icon in pairs(signs) do
  local severityName = string.upper(type)
  local severity = vim.diagnostic.severity[severityName]
  local hl = "DiagnosticSign" .. type
  signConf.text[severity] = icon
  signConf.texthl[severity] = hl
  signConf.numhl[severity] = hl
end

vim.diagnostic.config({
  signs = signConf,
  virtual_text = true
})
