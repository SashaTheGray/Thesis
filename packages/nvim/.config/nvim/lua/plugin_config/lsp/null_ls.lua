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
		-- Formatters.
		formatting.prettier.with({
			extra_args = {
				"--no-semi",
				"--double-quote",
				"--jsx-double-quote",
			},
		}),
		formatting.autopep8.with({ 
            extra_args = {
                "-max-line-length 79",
                "--jobs -1",  -- Match CPU count of parallel jobs.
            } 
        }),
		formatting.stylua,
		formatting.beautysh,

		-- Linters.
		diagnostics.flake8.with({
			extra_args = {
				"--doctests",
				"--max-line-length 79",
				"--max-doc-length 72",
			},
		}),
		diagnostics.shellcheck,
	},
})
