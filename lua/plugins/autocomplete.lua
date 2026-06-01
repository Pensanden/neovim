return {
  "saghen/blink.cmp",
  version = "false",
  opts = {
   fuzzy = { implementation = "lua" },
    keymap = { preset = "default" },
    sources = { default = { "lsp", "path", "buffer" } },
    completion = {
      ghost_text = { enabled = false },
    },
  },
}

