-- This module contains telescope configurations.

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print("[-] Cannot load telescope -> " .. telescope)
	return
end

-- For pre-viewing media files in Distro desktop mode.
telescope.load_extension("media_files")

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		path_display = { "smart" },

		-- Keymap.
		mappings = {

			-- Insert mode.
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["C-c"] = actions.close,
			},

			-- Normal mode.
			n = {},
		},
	},

	pickers = {},
	extensions = {
		media_files = {
			-- Filetype whitelist.
			-- Defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "jpg", "jpeg", "png" },
		},
	},
})
