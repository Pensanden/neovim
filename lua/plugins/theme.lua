return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({ bold = true , italic = {strings = false, comments = true}} )
    vim.cmd.colorscheme("gruvbox")
  end,
}
