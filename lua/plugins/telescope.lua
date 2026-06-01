return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { preview_width = 0.55 },
          file_ignore_patterns = { 
            "node_modules",
            ".git/*",
 "^bin/", "^obj/",
      "%.dll$", "%.exe$", "%.pdb$", "%.nupkg$",
      "%.suo$", "%.user$",
          },
        },
      })

      -- Keymaps

      vim.keymap.set("n", "<leader>fs", builtin.symbols,            { desc = "Find symbols" })
      vim.keymap.set("n", "<leader>ff", builtin.find_files,            { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep,             { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers,               { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags,             { desc = "Help tags" })
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles,              { desc = "Recent files" })
      vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols,  { desc = "Document symbols" })
    end,
  },
}

