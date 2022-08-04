-- This module contains configurations for the lsp-installer.
-- https://github.com/williamboman/nvim-lsp-installer

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	print("[-] Cannot load lsp_installer -> " .. lsp_installer)
end

lsp_installer.on_server_ready(
	function(server)
		local opts = {
			on_attach = require("plugin_config.lsp.handler").on_attach,
			capabilities = require("plugin_config.lsp.handler").capabilities
		}

		if server.name == "jsonls" then
			local jsonls_opts = require("plugin_config.lsp.settings.json_ls")
			opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
		end

		if server.name == "sumneko_lua" then
			local sumneko_opts = require("plugin_config.lsp.settings.sumneko_lua")
			opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
		end

        if server.name == "bashls" then
            local bashls_opts = require("plugin_config.lsp.settings.bashls")
            opts = vim.tbl_deep_extend("force", bashls_opts, opts)
        end

		server:setup(opts)
	end
)
