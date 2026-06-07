return {
	{ "williamboman/mason.nvim", config = true },
	{
		"Hoffs/omnisharp-extended-lsp.nvim", -- handles OmniSharp's non-standard APIs
		lazy = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = { "lua_ls", "pyright", "ts_ls", "omnisharp", "powershell_es" },
			automatic_installation = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("*", {
				capabilities = vim.lsp.protocol.make_client_capabilities(),
			})

			vim.lsp.config("omnisharp", {
				root_dir = vim.fs.root(0, { "*.sln", "*.csproj" }),
				cmd = {
					"omnisharp",
					"--languageserver",
					"--hostPID",
					tostring(vim.fn.getpid()),
				},
				settings = {
					["csharp|code_lens"] = {
						dotnet_enable_references_code_lens = false,
					},
				},
				init_options = {
					-- fixes the Razor.Compiler analyzer crash
					enableRoslynAnalyzers = true,
					enableEditorConfigSupport = true,
					organizeImportsOnFormat = true,
					enableDecompilationSupport = true,
					-- disable Razor/HTML handling (it crashes your setup)
					RazorPluginPath = "",
					enableRazorLanguageServer = false,
					inlayHintsOptions = {
						enableForParameters = true,
						forLiteralParameters = true,
						forIndexerParameters = true,
						forObjectCreationParameters = true,
						forOtherParameters = true,
						suppressForParametersThatDifferOnlyBySuffix = false,
						suppressForParametersThatMatchMethodIntent = false,
						suppressForParametersThatMatchArgumentName = false,
						enableForTypes = true,
						forImplicitVariableTypes = true,
						forLambdaParameterTypes = true,
						forImplicitObjectCreation = true,
					},
				},
				handlers = {
					["textDocument/definition"] = require("omnisharp_extended").handler,
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)

					-- inlay hints
					if client and client.name == "omnisharp" then
						vim.defer_fn(function()
							if vim.api.nvim_buf_is_valid(ev.buf) then
								vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
							end
						end, 3000)
					else
						vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
					end

					-- keymaps
					vim.keymap.set(
						"n",
						"<C-.>",
						vim.lsp.buf.code_action,
						{ buffer = ev.buf, desc = "Quick actions / refactors" }
					)
					vim.keymap.set(
						"n",
						"<F2>",
						vim.lsp.buf.rename,
						{ buffer = ev.buf, desc = "Rename with references" }
					)

					local map = function(k, f, d)
						vim.keymap.set("n", k, f, { buffer = ev.buf, desc = d })
					end

					map("gd", vim.lsp.buf.definition, "Go to definition")
					map("K", vim.lsp.buf.hover, "Hover docs")
					map("<leader>rn", vim.lsp.buf.rename, "Rename")
					map("<leader>ca", vim.lsp.buf.code_action, "Code action")
					map("gr", vim.lsp.buf.references, "References")
					map("[d", vim.diagnostic.goto_prev, "Prev diagnostic")
					map("]d", vim.diagnostic.goto_next, "Next diagnostic")
					map("<leader>ih", function()
						vim.lsp.inlay_hint.enable(
							not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }),
							{ bufnr = ev.buf }
						)
					end, "Toggle inlay hints")
				end,
			})
		end,
	},
}
