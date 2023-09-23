local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.bashls.setup {
  capabilities = capabilities,
}

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.cmake.setup {
  capabilities = capabilities,
}

lspconfig.dockerls.setup {
  capabilities = capabilities,
}

lspconfig.jedi_language_server.setup {
  capabilities = capabilities,
}

lspconfig.lua_ls.setup {
  capabilities = capabilities,
}

lspconfig.marksman.setup {
  capabilities = capabilities,
}

lspconfig.texlab.setup {
  capabilities = capabilities,
}
