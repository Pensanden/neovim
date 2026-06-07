-- ~/.config/nvim/lua/plugins/dadbod.lua
-- Requires: Microsoft ODBC Driver for SQL Server
-- https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server

return {
	-- 1. Core engine — loaded on demand by the UI
	{
		"tpope/vim-dadbod",
		lazy = true,
	},

	-- 2. Completion source — lazy per filetype
	{
		"kristijanhusak/vim-dadbod-completion",
		ft = { "sql", "mysql", "plsql" },
		lazy = true,
		config = function()
			local ok, cmp = pcall(require, "cmp")
			if ok then
				cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
					sources = cmp.config.sources({
						{ name = "vim-dadbod-completion" },
						{ name = "buffer" },
					}),
				})
			end
		end,
	},

	-- 3. UI — owns the commands/keys; pulls in dadbod as a hard dep
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = { "tpope/vim-dadbod" }, -- ensures dadbod loads first
		cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
		keys = {
			{ "<leader>db", "<cmd>DBUIToggle<CR>", desc = "DB UI Toggle" },
			{ "<leader>da", "<cmd>DBUIAddConnection<CR>", desc = "DB UI Add Connection" },
			{ "<leader>df", "<cmd>DBUIFindBuffer<CR>", desc = "DB UI Find Buffer" },
		},
		init = function()
			-- ── UI appearance ──────────────────────────────────────────────────
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_show_database_icon = 1
			vim.g.db_ui_force_echo_notifications = 1
			vim.g.db_ui_win_position = "left"
			vim.g.db_ui_winwidth = 40
			vim.g.db_ui_execute_on_save = 0
			vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/dadbod_queries"

			-- ── Env-variable fallback (per-project) ───────────────────────────
			-- Export DATABASE_URL in your shell / .env and it's picked up automatically
			vim.g.db_ui_env_variable_url = "DATABASE_URL"
			vim.g.db_ui_env_variable_name = "DATABASE_NAME"

			-- ── MSSQL connections ──────────────────────────────────────────────
			-- Format: sqlserver://user:password@host:port/database
			vim.g.dbs = {
				{
					name = "VandadManagement",
					url = "sqlserver://sa:1qaz!QAZ@localhost:1433/Redacted",
				},
				-- Named instance:
				-- {
				--   name = "sqlexpress",
				--   url  = "sqlserver://sa:YourPassword@localhost\\SQLEXPRESS:1433/YourDatabase",
				-- },
				-- Windows / Azure AD auth via ODBC DSN:
				-- {
				--   name = "azure_mssql",
				--   url  = "odbc://DSN=MyAzureDSN",
				-- },
			}
		end,
	},
}
