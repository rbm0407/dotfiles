-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "bashls", "phpactor", "rust_analyzer", "pylsp" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.phpactor.setup {
  --root_dir = function(_)
  --  return vim.loop.cwd()
  --end,
  --init_options = {
  --  ["language_server.diagnostics_on_update"] = false,
  --  ["language_server.diagnostics_on_open"] = false,
  --  ["language_server.diagnostics_on_save"] = false,
  --  ["language_server_phpstan.enabled"] = false,
  --  ["language_server_psalm.enabled"] = false,
  --},
  capabilities = {
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = false
				}
			}
		}
  },
}
