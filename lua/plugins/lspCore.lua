return {
  { "williamboman/mason.nvim", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "lua_ls", "pyright", "ts_ls" },
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("*", {
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local map = function(k, f, d)
            vim.keymap.set("n", k, f, { buffer = ev.buf, desc = d })
          end
          map("gd",         vim.lsp.buf.definition,   "Go to definition")
          map("K",          vim.lsp.buf.hover,         "Hover docs")
          map("<leader>rn", vim.lsp.buf.rename,        "Rename")
          map("<leader>ca", vim.lsp.buf.code_action,   "Code action")
          map("gr",         vim.lsp.buf.references,    "References")
          map("[d",         vim.diagnostic.goto_prev,  "Prev diagnostic")
          map("]d",         vim.diagnostic.goto_next,  "Next diagnostic")
        end,
      })
    end,
  },
}

