return {
	"neovim/nvim-lspconfig",
	opts = function()
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
				},
			},
		})
	end,
}
