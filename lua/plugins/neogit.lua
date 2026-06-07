return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim", -- optional but recommended
  },
  opts = {
    integrations = { diffview = true },
  },
  keys = {
    { "<leader>gg", "<cmd>Neogit<CR>", desc = "Open Neogit" },
  },
}
