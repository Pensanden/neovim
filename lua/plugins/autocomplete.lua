return {
	"saghen/blink.cmp",
	version = "false",
	opts = {
		fuzzy = { implementation = "lua" },
		keymap = {
			preset = "none",
			["<C-x>"] = { "show", "show_documentation", "hide_documentation" },
			["<CR>"] = { "accept", "fallback" },
			["<>"] = { "hide", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<C-k>"] = { "scroll_documentation_up", "fallback" },
			["<C-j>"] = { "scroll_documentation_down", "fallback" },
		},
		sources = { default = { "lsp", "path", "buffer" } },

		completion = {
			ghost_text = { enabled = false },
      menu = { auto_show = true },
		},

	},
}
