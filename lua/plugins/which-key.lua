return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    delay = 500, -- ms before popup appears
    icons = {
      mappings = false, -- disable icons if your font doesn't support them
    },
    spec = {
      -- group labels so the popup is organized
      { "<leader>h", group = "git hunks" },
      { "<leader>d", group = "diagnostics" },
      -- add more groups as needed
    },
  },
  keys = {
    -- open the full cheatsheet manually
    {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "Buffer keymaps (which-key)",
    },
  },
}

