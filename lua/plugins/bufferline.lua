return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      numbers = "none",
      diagnostics = "nvim_lsp",  -- shows error/warning count on the tab
      diagnostics_indicator = function(_, _, diag)
        local icons = { error = " ", warning = " " }
        local ret = (diag.error and icons.error .. diag.error .. " " or "")
          .. (diag.warning and icons.warning .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "Explorer",
          highlight = "Directory",
          separator = true,  -- puts a divider between tree and buffers
        },
      },
      separator_style = "slant",  -- "slant" | "thick" | "thin" | "padded_slant"
    },
  },
  keys = {
    { "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
    { "<leader>bd", "<cmd>bdelete<CR>",         desc = "Close buffer" },
  },
}
