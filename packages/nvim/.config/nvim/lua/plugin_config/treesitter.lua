-- This module contains Treesitter configurations.
-- https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    print("[-] Cannot load Treesitter -> " .. treesitter)
    print("[!] Exiting ...")
    return
end

treesitter.setup(
    {
        ensure_installed = {"lua", "python"},
        sync_install = false,
        auto_install = true,
        ignore_install = { "javascript"},

        highlight = {
            enable = true,
            disable = {"c", "rust"},
            additional_vim_regex_highlighting = false,
        },
    }
)
