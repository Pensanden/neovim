return {
  "Wansmer/symbol-usage.nvim",
  event = "LspAttach",
  opts = {
    vt_position = "above",   -- "above" | "end_of_line" | "textwidth"
    vt_gravity = "left",
    text_format = function(symbol)
      local res = {}
      local round_start = { " ", "DiagnosticHint" }
      local round_end   = { "usages", "DiagnosticHint" }

      if symbol.references then
        local usage = symbol.references <= 1
          and "1 "
          or symbol.references .. " "
        table.insert(res, round_start)
        table.insert(res, { usage, "DiagnosticHint" })
        table.insert(res, round_end)
      end

      if symbol.definition then
        table.insert(res, { "  " .. symbol.definition .. " defs", "DiagnosticHint" })
      end

      if symbol.implementation then
        table.insert(res, { "  " .. symbol.implementation .. " impls", "DiagnosticHint" })
      end

      return res
    end,
  },
}
