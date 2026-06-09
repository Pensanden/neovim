return {
  "okuuva/auto-save.nvim",
  opts = {
    debounce_delay = 2000, -- wait 2s after last change before saving
    condition = function(buf)
      -- don't autosave special buffers
      if vim.bo[buf].buftype ~= "" then return false end
      if vim.bo[buf].filetype == "oil" then return false end
      return true
    end,
  },
}
