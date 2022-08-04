-- This module contains MaterialUI configurations.
-- https://github.com/marko-cerovac/material.nvim

local status_ok, material = pcall(require, "material")
if not status_ok then
    print("Cannot fetch MaterialUI => " .. material)
end


material.setup(
    {

        contrast = {
            sidebars = false,
            floating_windows = false,
            line_numbers = false,
            sign_column = false,
            cursor_line = false,
            non_current_windows = false,
            popup_menu = false,
        },

        italics = {
            comments = false,
            keywords = false,
            functions = false,
            strings = false,
            variables = false
        },

        contrast_filetypes = {
            "terminal", -- Darker terminal background
            "packer", -- Darker packer background
            "qf" -- Darker qf list background
        },

        high_visibility = {
            lighter = false,
            darker = false
        },

        disable = {
            colored_cursor = false,
            borders = false,
            background = false,
            term_colors = false,
            eob_lines = false
        },

        lualine_style = "stealth",
        async_loading = true,
        custom_highlights = {},

        plugins = {
            trouble = true,
            nvim_cmp = true,
            neogit = true,
            gitsigns = true,
            git_gutter = true,
            telescope = true,
            nvim_tree = true,
            sidebar_nvim = true,
            lsp_saga = true,
            nvim_dap = true,
            nvim_navic = true,
            which_key = true,
            sneak = true,
            hop = true,
            indent_blankline = true,
            nvim_illuminate = true,
            mini = true,
        }
    }
)
