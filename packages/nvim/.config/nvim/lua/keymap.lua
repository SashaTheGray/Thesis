---@diagnostic disable: redefined-local
-- This module configures the Neovim keymap.

-----------------------------------------
--          TABLE OF CONTENTS          --
-----------------------------------------
--                                     --
--      I.      GLOBALS                --
--      II.     NORMAL MODE            --
--      III.    INSERT MODE            --
--      IV.     VISUAL MODE            --
--      V.      VISUAL BLOCK MODE      --
--      VI.     TERMINAL               --
-----------------------------------------

-------------
-- GLOBALS --
-------------

local SHARED_OPTIONS = {
	noremap = true, -- No recursive mapping.
	silent = true, -- Stay silent.
}

local TERMINAL_OPTIONS = {
	silent = true, -- Stay silent.
}

local map = vim.api.nvim_set_keymap

-- Map leader key.
map("", "<Space>", "<Nop>", SHARED_OPTIONS)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------
-- NORMAL MODE --
-----------------

local mode = "n"

-- Window navigation.
map(mode, "<C-h>", "<C-w>h", SHARED_OPTIONS) -- Hop left.
map(mode, "<C-l>", "<C-w>l", SHARED_OPTIONS) -- Hop right.
map(mode, "<C-j>", "<C-w>j", SHARED_OPTIONS) -- Hop down.
map(mode, "<C-k>", "<C-w>k", SHARED_OPTIONS) -- Hop up.

-- Resize windows.
map(mode, "<C-Left>", ":resize +2<CR>", SHARED_OPTIONS)
map(mode, "<C-Right>", ":resize -2<CR>", SHARED_OPTIONS)
map(mode, "<C-Down>", ":vertical resize -2<CR>", SHARED_OPTIONS)
map(mode, "<C-Up>", ":vertical resize +2<CR>", SHARED_OPTIONS)

-- Buffer navigation.
map(mode, "<S-h>", ":bprevious<CR>", SHARED_OPTIONS)
map(mode, "<S-l>", ":bnext<CR>", SHARED_OPTIONS)

-- Toggle project tree.
map(mode, "<leader>e", ":NvimTreeToggle<CR>", SHARED_OPTIONS)

-- Dashboard shortcuts.
map(mode, "<leader>n", "<cmd>:DashboardNewFile<CR>", SHARED_OPTIONS)
map(mode, "<leader>f", "<cmd>:Telescope find_files<CR>", SHARED_OPTIONS)
map(mode, "<leader>h", "<cmd>:Telescope oldfiles<CR>", SHARED_OPTIONS)
map(mode, "<leader>c", "<cmd>:edit $HOME/.config/nvim/init.lua<CR>", SHARED_OPTIONS)

-----------------
-- INSERT MODE --
-----------------

local mode = "i"

-- Insert mode exit.
map(mode, "kj", "<ESC>", SHARED_OPTIONS)

-----------------
-- VISUAL MODE --
-----------------

local mode = "v"

-- Persist selection when indenting.
map(mode, "<", "<gv", SHARED_OPTIONS)
map(mode, ">", ">gv", SHARED_OPTIONS)

-- Move a line.
map(mode, "<A-j>", ":m .+1<CR>==", SHARED_OPTIONS)
map(mode, "<A-k>", ":m .-2<CR>==", SHARED_OPTIONS)

-- Persist selection after pasting.
map(mode, "p", '"_dP', SHARED_OPTIONS)

-----------------------
-- VISUAL BLOCK MODE --
-----------------------

local mode = "x"

-- Move a block.
map(mode, "J", ":move '>+1<CR>gv-gv", SHARED_OPTIONS)
map(mode, "K", ":move '<-2<CR>gv-gv", SHARED_OPTIONS)
map(mode, "<A-j>", ":move '>+1<CR>gv-gv", SHARED_OPTIONS)
map(mode, "<A-k>", ":move '<-2<CR>gv-gv", SHARED_OPTIONS)

-------------------
-- TERMINAL MODE --
-------------------

local mode = "t"

-- Terminal navigation.
map(mode, "<C-h>", "<-\\><C-N><C-w>h", TERMINAL_OPTIONS)
map(mode, "<C-j>", "<-\\><C-N><C-w>j", TERMINAL_OPTIONS)
map(mode, "<C-k>", "<-\\><C-N><C-w>k", TERMINAL_OPTIONS)
map(mode, "<C-l>", "<-\\><C-N><C-w>l", TERMINAL_OPTIONS)
