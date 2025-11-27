local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.cursorline = true
vim.opt.hidden = true
opt.signcolumn = "yes"

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.splitbelow = true
opt.splitright = true

opt.ignorecase = true
opt.smartcase = true

opt.updatetime = 250
opt.timeoutlen = 400

opt.clipboard = "unnamedplus" -- use system clipboard (like VS Code)
