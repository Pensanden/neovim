return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "modern", -- "modern" | "classic" | "minimal" | "powerline" | "ghost" | "simple" | "nonerdfont" | "amongus"
			options = {
				show_source = true,
				throttle = 20,
				enable_on_insert = true,
				multilines = {
					enabled = true,
					always_show = true,
					severity = { vim.diagnostic.severity.ERROR }, -- only errors always visible
				},
				-- warnings still show on cursorline via normal behavior
			},
		})
		-- disable neovim's default inline diagnostics so they don't overlap
		vim.diagnostic.config({ virtual_text = false })
	end,
}
