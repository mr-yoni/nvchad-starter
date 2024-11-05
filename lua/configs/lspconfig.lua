-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "tsserver",
  "eslint",
  "pyright",
  "ruff_lsp",
  "dockerls",
  "marksman",
  "jsonls",
  "terraformls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

if servers["jsonls"] then
  lspconfig.jsonls.setup {
    settings = {
      json = {
        validate = { enable = true },
        schemastore = {
          enable = false,
          url = "",
        },
      },
    },
  }
end
