-- This file initializes the neovim lua configurations.

-- Register Packages.
require("packer_config")
require("plugin_config.autopairs")
require("plugin_config.completion")
require("plugin_config.lualine")
require("plugin_config.material_ui")
require("plugin_config.telescope")
require("plugin_config.treesitter")
require("plugin_config.lsp")
require("plugin_config.lsp.null_ls")
require("plugin_config.comments")
require("plugin_config.gitsigns")
require("plugin_config.nvimtree")
require("plugin_config.bufferline")
require("plugin_config.toggleterm")
require("plugin_config.dashboard")
require("plugin_config.glow")

-- Register general config.
require("options")
require("keymap")

-- Set colorscheme.
vim.cmd("colorscheme material")
vim.g.material_style = "deep ocean"
