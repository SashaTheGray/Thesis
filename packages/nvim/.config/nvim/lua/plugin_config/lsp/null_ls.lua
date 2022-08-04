-- This module contains null-ls configurations.

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	print("[-] Cannot load null-ls -> " .. null_ls)
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			extra_args = {
				"--no-semi",
				"--double-quote",
				"--jsx-double-quote",
			},
		}),

		formatting.black.with({
			extra_args = {
				"--fast",
				"--line-length 79",
			},
		}),

		formatting.stylua,
		formatting.beautysh,
		diagnostics.shellcheck,
		diagnostics.flake8,
	},
})
