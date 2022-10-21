-- This module contains ToggleTerm configurations.

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	print("[-] Could not load ToggleTerm -> " .. toggleterm)
	return
end

toggleterm.setup({
	open_mapping = [[<c-\>]],
	size = 20,
	hide_numbers = true,
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	persist_mode = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})
