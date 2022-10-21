-- This module contains dashboard configurations.
-- https://github.com/glepnir/dashboard-nvim

local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
	print("[-] Cannot load dashboard -> " .. dashboard)
	return
end

local HEADER = {
	"                                                              ",
	"    ⢀⣀⣤⣤⣤⠤⢤⣤⣤⣤⣤⣄⣀⡀           ⢀⣠⣤⣄⡀            ⣀⣀⣀⣤⣤⣤⣤⣤⣤⣤⣤⣀⡀   ",
	" ⢀⣤⠚⠩⠁⡄ ⠠⣤⠒⠒⣂ ⢈⣨⣭⣿⠛⠶⣦⣤⣄⡀   ⢠⣾⡟⠉⠉⠝⠿⠇    ⢀⣠⡤⠔⠒⣻⠟⠋⠩⠉⢁⣀⡀  ⣶  ⠙⡛⠷  ",
	" ⠸⢟⡠⠒⢊⡤  ⠋⣠ ⠈⣉⣉⣉⣉⣀⣛⣿⡒⠭⡿⢿⣷⣤⣤⣀⣽⣇⣴⠆⣴⡃⢀⣠⣤⠴⣚⣫⡥ ⠒⠛⠁⣀⣉⣉⣙⢏⡉  ⢀⣼⣤⣜⠳⡦⠂  ",
	"   ⠐⠚⠫⣤⠖⢣⣤⡕ ⠉⣩⣤⠔ ⠂⣋⣭⣥⣤⠴⠛⣛⠈⢩⣿⠿⠛⢉  ⡐⠞⠫⢍⠙⣓⠢⠴⣥⣍⣙⠛⢓⡢⢤⣬⠉⠅ ⣤⡜⢛⠻⠛⠉⠁   ",
	"      ⠘⢔⢎⣡⡔⠂⣠⡿⠁⠒⢛⡻⢛⣩⠅  ⠉  ⠚⣯⣄⢠⣿⢀⣾⠇ ⠓ ⠁⠂⠈⠍⠐⠈⡉⣿⠛⣛⠛⠉⣤⣰⣿⣿⡟⠛⠁      ",
	"        ⠙⠛⠐⠚⠋ ⠒⣲⡿⠇⣋        ⢺⡏⠈⣀ ⠉⠈        ⠙⢿⠟⢰⣖⡢ ⠂⠒⠚⠉         ",
	"             ⣴⠛⠅⢀⣾⠟⢃       ⢹⠃⠠⠁⠈⠩         ⢠⣿ ⣀⢹⣿⡷             ",
	"             ⢿⣤⢚⣫⠅         ⢸⠇ ⢚ ⢀         ⣸⡇ ⠉⣿⣿⠇             ",
	"             ⠈⠛⢻⣥⡚⠔⣠⢣⣄⡀    ⢸⡇ ⢘ ⠈ ⠠⠈    ⣀⣰⡿⣧⣄⠾⠋⠁              ",
	"                ⠈⠑⠁        ⠘⣿⡀⣈⣀    ⠈  ⠈⠙⠁                    ",
	"                            ⠘⣷⠁                               ",
	"                             ⠙⣤                               ",
	"                              ⠛⠂                              ",
	"                                                              ",
}

local number_of_plugins = vim.fn.len(vim.fn.globpath("$HOME/.local/share/nvim/site/pack/packer/start", "*", 0, 1))

-- Set layout.
dashboard.custom_header = HEADER
dashboard.custom_center = {
	-- Create a new script.
	{
		icon = " ",
		desc = "Create a new file           ",
		action = "DashboardNewFile",
		shortcut = "SPC n",
	},

	-- Find a file.
	{
		icon = " ",
		desc = "Find a file                 ",
		action = "Telescope find_files",
		shortcut = "SPC f",
	},

	-- Telescope histroy.
	{
		icon = " ",
		desc = "History                     ",
		action = "Telescope oldfiles",
		shortcut = "SPC h",
	},

	-- NeoVim config.
	{
		icon = "漣 ",
		desc = "NeoVim config              ",
		action = "edit $HOME/.config/nvim/init.lua",
		shortcut = "SPC c",
	},
}
dashboard.custom_footer = {
	"煉 NeoVim loaded with " .. number_of_plugins .. " plugins 煉 ",
}

-- Set options.
dashboard.preview_file_height = 0
dashboard.preview_file_width = 0
dashboard.hide_statusline = true
dashboard.hide_tabline = true
dashboard.header_pad = 1
dashboard.center_pad = 1
dashboard.footer_pad = 1
