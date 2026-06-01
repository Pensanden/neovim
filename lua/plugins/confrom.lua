return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			cs = { "csharpier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
		},
		-- Tell conform to look in Mason's bin dir
		formatters = {
			stylua = { command = vim.fn.stdpath("data") .. "/mason/bin/stylua.cmd" },
			csharpier = { command = vim.fn.stdpath("data") .. "/mason/bin/csharpier.cmd" },
			prettier = { command = vim.fn.stdpath("data") .. "/mason/bin/prettier.cmd" },
		},
	},
	keys = {
		{
			"<C-K>",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = { "n", "v" },
			desc = "Format file",
		},
	},
}
