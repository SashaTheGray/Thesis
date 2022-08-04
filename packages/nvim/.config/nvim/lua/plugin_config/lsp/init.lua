-- This package contains LSP configurations.

local status_ok, error = pcall(require, "lspconfig")
if not status_ok then
    print("[-] Cannot load lspconfig -> " .. error)
end

require("plugin_config.lsp.installer")
require("plugin_config.lsp.handler").setup()
