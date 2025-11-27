-- Basic options
require("config.options")

-- Keymaps
require("config.keymaps")

-- Lazy.nvim plugin manager bootstrap
require("config.lazy")
require("lualine").setup()
require("gitsigns").setup()
require("Comment").setup()
-- Theme
require("config.theme")
-- LSP setup
require("config.lsp")
require("config.tree")
require("config.bufferline")
