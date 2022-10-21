-- This module contains completion configurations.
-- https://github.com/hrsh7th/nvim-cmp/

-- Load cmp.
local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
    print("[-] Cannot load CMP -> " .. cmp)
end

-- Load luasnip.
---@diagnostic disable-next-line: redefined-local
local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
    print("[-] Cannot load Luasnip -> " .. luasnip)
end

require("luasnip/loaders/from_vscode").lazy_load()

-- Used in conjuntion with the super-tab mapping.
-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
local has_words_before = function()
    local line, column = unpack(vim.api.nvim_win_get_cursor(0))
    return column ~= 0
    and vim.api.nvim_buf_get_lines(
        0,
        line - 1,
        line,
        true
    )[1]:sub(column, column):match("%s") == nil
end

-- https://www.nerdfonts.com/cheat-sheet
local ICONS = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

-- Configure cmp.
cmp.setup(
    {
        -- Snippet engine.
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },

        -- Completion UI.
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
        },

        -- Keymap.
        mapping = cmp.mapping.preset.insert(
            {
                -- Scroll down the suggestion window.
                ["<C-j>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, {"i", "s"}
                ),

                -- Scroll up the suggestion window.
                ["<C-k>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {"i", "s"}
                ),

                -- Scroll up the documentation window.
                ["<C-b>"] = cmp.mapping(
                    cmp.mapping.scroll_docs(-4),
                    {"i", "c"}
                ),
                -- Scroll down the documentation window.
                ["<C-f>"] = cmp.mapping(
                    cmp.mapping.scroll_docs(4),
                    {"i", "c"}
                ),

                -- Abort suggestions.
                ["<C-e>"] = cmp.mapping(
                    {
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close()
                    }
                ),

                -- Show all available completions.
                ["<C-Space>"] = cmp.mapping(
                    cmp.mapping.complete(),
                    {"i", "c"}
                ),

                -- Confirm selection. If nothing selected -> select first.
                ["<Tab>"] = cmp.mapping.confirm({select = true}),
            }
        ),

        -- Suggestion window content formatting.
        formatting = {
            fields = {"kind", "abbr", "menu"},
            format = function(entry, vim_item)
                vim_item.kind = string.format("%s", ICONS[vim_item.kind])
                vim_item.menu = (
                    {
                        nvim_lsp = "[NVIM_LSP]",
                        nvim_lua = "[NVIM_LUA]",
                        luasnip = "[Luasnip]",
                        buffer = "[Buffer]",
                        path = "[Path]"
                    }
                )[entry.source.name]
                return vim_item
            end
        },

        -- Configure suggestion sources.
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"},
                {name = "nvim_lua"},
                {name = "luasnip"},
                {name = "buffer"},
                {name = "path"}
            }
        ),
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        },

        -- Disable completions in comments.
        --[[ enabled = function() ]]
        --[[     local context = require("cmp.config.context") ]]
        --[[     if vim.api.nvim_get_mode().mode == "c" then ]]
        --[[         return true ]]
        --[[     else ]]
        --[[         return not context.in_treesitter_capture("comment") ]]
        --[[         and not context.in_syntax_group("Comment") ]]
        --[[     end ]]
        --[[ end ]]
    }
)
