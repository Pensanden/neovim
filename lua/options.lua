vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true
vim.opt.encoding = "utf-8"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 10

vim.keymap.set("n", "N", vim.diagnostic.open_float, { buffer = bufnr, desc = "Show diagnostic" })

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("wincmd =")
  end,
})

vim.o.termbidi = true
vim.opt.lazyredraw = false
