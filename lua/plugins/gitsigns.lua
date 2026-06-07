return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add          = { text = "▎" },
      change       = { text = "▎" },
      delete       = { text = "" },
      topdelete    = { text = "" },
      changedelete = { text = "▎" },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map("n", "]h", gs.next_hunk, "Next hunk")
      map("n", "[h", gs.prev_hunk, "Prev hunk")

      -- Revert
      map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
      map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

      -- Stage (useful before committing selectively)
      map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
      map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

      -- Visual mode: revert or stage only selected lines
      map("v", "<leader>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset selected lines")
      map("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage selected lines")

      -- Preview the diff inline
      map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

      -- Blame
      map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
    end,
  },
}

