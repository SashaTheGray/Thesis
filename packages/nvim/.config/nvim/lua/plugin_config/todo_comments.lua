-- https://github.com/folke/todo-comments.nvim

-- Below are examples of currently implemented 'todo-comments'.

-- INFO: Some information here.
-- NOTE: This is a note.

-- PERFORMANCE: This is very perfomance instensive.
-- OPTIMIZE: This should be optimized.

-- TODO: Design an algorithm that solves A, B, and C.
-- FINISH: Finish this please!

-- ISSUE: number 294 -- see <Github link>.
-- BUG: There is a bug here!
-- FIX: This needs fixing!
-- IMPLEMENT: This function should do A, B, and C.

-- ATTENTION: I like attention!
-- HACKING: This injects A into B.

-- WARNING: !!!!!

local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
	print("[-] Cannot load todo-comments -> " .. todo_comments)
end

todo_comments.setup({
	signs = true, -- show icons in the signs column
	sign_priority = 8, -- sign priority
	keywords = {
		FIX = { icon = " ", color = "error", alt = { "BUG", "ISSUE", "IMPLEMENT" } },
		TODO = { icon = " ", color = "hint", alt = { "FINISH" } },
		HACKING = { icon = " ", color = "warning", alt = { "ATTENTION" } },
		WARNING = { icon = " ", color = "warning" },
		PERFORMANCE = { icon = " ", alt = { "OPTIMIZE" } },
		NOTE = { icon = " ", color = "info", alt = { "INFO" } },
	},
	merge_keywords = true, -- merge custom keywords with default keywords.
	highlight = {
		before = "", -- "fg" or "bg" or empty
		keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
		after = "fg", -- "fg" or "bg" or empty
		pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
		comments_only = true, -- uses treesitter to match keywords in comments only
		max_line_len = 400, -- ignore lines longer than this
		exclude = {}, -- list of file types to exclude highlighting
	},
	colors = {
		error = { "#FF5370" },
		warning = { "#FFD740" },
		info = { "#89DDFF" },
		hint = { "#C3E88D" },
		default = { "Identifier", "#7C3AED" },
	},
	-- FIX: This is currently broken, dependency conflicts related to ripgrep.
	search = {
		command = "rgrep",
		args = {
			"--color=never",
			"--with-filename",
			"--line-number",
		},
		pattern = [[\b(KEYWORDS):]], -- ripgrep regex
	},
})
