local fn = vim.fn

-- Bootstrap lazy.nvim
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- UI / aesthetics
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-lua/plenary.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
 

  -- Buffer tabs like VS Code  ← your plugin
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  
  -- Fuzzy find / search (Ctrl+P / Ctrl+Shift+F feel)
  { "nvim-telescope/telescope.nvim", tag = "0.1.8" },

  -- LSP + installer
  "neovim/nvim-lspconfig",
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- Autocomplete (VS Code–style IntelliSense)
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- Formatting / linting
  "jose-elias-alvarez/null-ls.nvim",  -- or "nvimtools/none-ls.nvim" if you prefer
  "jay-babu/mason-null-ls.nvim",

  -- Git
  "lewis6991/gitsigns.nvim",

  -- Better UI for LSP (optional but nice)
  { "glepnir/lspsaga.nvim", branch = "main" },

  -- Comment toggling
  "numToStr/Comment.nvim",
})
