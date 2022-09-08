-- This module contains the lsp handler factory.

local HANDLER = {}

HANDLER.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, {
			texthl = sign.name,
			text = sign.text,
			numhl = "",
		})
	end

	local config = {
		virtual_text = false,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end

local function lsp_highlight_document(client)
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
                augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup END
            ]],
			false
		)
	end
end

local function lsp_keymap(bufnr)
	-- https://neovim.io/doc/user/lsp.html
	local mode = "n"
	local map = vim.api.nvim_buf_set_keymap
	local opts = { noremap = true, silent = true }

	-- Display hover information about the symbol under the cursor.
	map(bufnr, mode, "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

	-- List all the references to the symbol under the cursor.
	-- "give references"
	map(bufnr, mode, "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

	-- Select a code action available at the current cursor position.
	-- "give action"
	map(bufnr, mode, "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

	-- Go to definition of the symbol under the cursor.
	-- "go-to definition"
	map(bufnr, mode, "gd", "<cmd>lua vim.lsp.buf.definitions()<CR>", opts)

	-- List all implementation of the symbol under the cursor.
	-- "give implementations"
	map(bufnr, mode, "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

	-- Show problems with line.
	-- "give line-diagnostics"
	map(bufnr, mode, "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

	-- Format the buffer using the attached language server clients.
	-- "format file"
	map(bufnr, mode, "ff", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)

	-- Rename the definition under the cursor.
	map(bufnr, mode, "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
end

HANDLER.on_attach = function(client, bufnr)
	-- Avoid clashes with null-ls.

	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end

	if client.name == "sumneko_lua" then
		client.resolved_capabilities.document_formatting = false
	end

	if client.name == "jsonls" then
		client.resolved_capabilities.document_formatting = false
	end

	lsp_keymap(bufnr)
	lsp_highlight_document(client)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	print("[-] Cannot load cmp_nvim_lsp -> " .. cmp_nvim_lsp)
	return
end

-- Add capabilites.
local capabilities = vim.lsp.protocol.make_client_capabilities()
HANDLER.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return HANDLER
