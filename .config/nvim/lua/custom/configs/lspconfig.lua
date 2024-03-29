local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
})

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"},
})

lspconfig.gdscript.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
    filetypes = { "gd", "gdscript", "gdscript3"},
})
