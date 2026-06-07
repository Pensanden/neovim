return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "horizon",
      globalstatus = true,
      section_separators = "",
      component_separators = "|",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "encoding", "filetype" },
      lualine_y = {
        { function() return vim.fn.fnamemodify(vim.fn.getcwd(), ":t") end, icon = "󰉋" },
      },
      lualine_z = { "location" },
    },
  },
}

