-- This module contains Packer => A plugin manager for NeoVim.

-- Determine the packer installation path.
local data_location = vim.fn.stdpath("data")
local desired_packer_location = "/site/pack/packer/start/packer.nvim"
local install_path = data_location .. desired_packer_location

-- Install Packer if not present on the installation path.
if vim.fn.empty(vim.fn.glob(install_path)) ~= 0 then
    local packer_repo = "https://github.com/wbthomason/packer.nvim"
    PACKER_GOT_INSTALLED = vim.fn.system(
        {
            "git", "clone", "--depth", "1", packer_repo, install_path
        }
    )
    vim.cmd("packadd packer.nvim")
    print("[+] Installed Packer -> Restart required")
end

-- Automatically sync Packer on saving this file.
local file = "packer_config.lua"
vim.cmd(
    [[
        augroup packer_user_config
            autocmd!
            autocmd BufWritePost ]] .. file .. [[ source <afile> | PackerSync
        augroup end
    ]]
)

-- Fetch Packer with a protected call.
local fetched, packer = pcall(require, "packer")
if not fetched then
    print("[-] Could not fetch Packer -> " .. packer)
    return
end

packer.init(
    {
        display = {
            open_fn = function()
                return require("packer.util").float(
                    {
                        border = "rounded"
                    }
                )
            end
        }
    }
)


-- Register plugins.
return packer.startup(
    function (register)

        -- Important to register Packer itself.
        register({"wbthomason/packer.nvim"})

        -- Essential package dependancies.
        register({"nvim-lua/popup.nvim"})
        register({"nvim-lua/plenary.nvim"})
        register({"kyazdani42/nvim-web-devicons"})

        -- UI stuff.
        register({"nvim-lualine/lualine.nvim"})
	    register({"marko-cerovac/material.nvim"})
	    register({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})

	    -- Code completion.
	    register({"hrsh7th/nvim-cmp"})
        register({"hrsh7th/cmp-buffer"})
        register({"hrsh7th/cmp-path"})
        register({"hrsh7th/cmp-cmdline"})
        register({"hrsh7th/cmp-nvim-lua"})
        register({"hrsh7th/cmp-nvim-lsp"})
        register({"saadparwaiz1/cmp_luasnip"})
        register({"L3MON4D3/Luasnip"})
        register({"rafamadriz/friendly-snippets"})
        register({"windwp/nvim-autopairs"})

        -- Language server protocols.
        register({"neovim/nvim-lspconfig"})
        register({"williamboman/nvim-lsp-installer"})
        register({"jose-elias-alvarez/null-ls.nvim"})

        -- Fuzzy finder.
        register({"nvim-telescope/telescope.nvim"})
        register({"nvim-telescope/telescope-media-files.nvim"})

        -- Lazy commenting.
        register({"numToStr/Comment.nvim"})
        register({"JoosepAlviste/nvim-ts-context-commentstring"})

        -- Version control.
        register({"lewis6991/gitsigns.nvim"})

        -- Project tree.
        register({"kyazdani42/nvim-tree.lua"})

        -- Bufferlines.
        register({"akinsho/bufferline.nvim"})

        -- Terminal.
        register({"akinsho/toggleterm.nvim"})

        -- Dashboard.
        register({"glepnir/dashboard-nvim"})

        -- Sync Packer if it was just installed.
        if PACKER_GOT_INSTALLED then
            packer.sync()
        end
    end
)
