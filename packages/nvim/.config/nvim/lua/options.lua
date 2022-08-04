-- This module contains generic nvim option configurations.
-- https://neovim.io/doc/user/options.html

local OPTIONS = {
    clipboard = "unnamedplus",      -- Share system clipboard.
    conceallevel = 0,               -- Text is shown normally.
    fileencoding = "utf-8",         -- File encoding.
    ignorecase = true,              -- Ignore case when searching.
    showtabline = 2,                -- Always show tablines.
    smartindent = true,             -- Autoindent on newline.
    splitbelow = true,              -- Force horizontal splits down.
    splitright = true,              -- Force vertical splits right.
    undofile = true,                -- Save undo history.
    expandtab = true,               -- Convert tabs to spaces.
    shiftwidth = 4,                 -- Sets tab as n spaces.
    tabstop = 4,                    -- Sets tab as n spaces.
    softtabstop = 4,                -- Sets tab as n spaces.
    number = true,                  -- Enable line numbering.
    relativenumber = true,          -- Enable relative line numbering.
    mouse = "a",                    -- Enble mouse controls.
    scrolloff = 12,                 -- Minimal lines around cursor, t/b.
    sidescrolloff = 12,             -- Minimal lines around cursor, l/r.
    termguicolors = true,           -- Enable termgui colors.
    textwidth = 79,                 -- Maximum line length.
    colorcolumn = {80},             -- Set a linelength guide.
    updatetime = 500, 		        -- Set autocompletion time.	
    modifiable = true               -- Set buffers as modifiable.
}

for option, value in pairs(OPTIONS) do
    vim.opt[option] = value
end

