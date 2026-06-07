return {
  "sindrets/diffview.nvim",
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<CR>",            desc = "Diff working tree" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>",   desc = "File history" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<CR>",     desc = "Repo history" },
    { "<leader>gx", "<cmd>DiffviewClose<CR>",           desc = "Close diffview" },
  },
}
