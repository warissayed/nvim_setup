require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua", "vim", "vimdoc",
    "javascript", "typescript", "tsx",
    "json", "html", "css",
    "python", "go", "rust", "zig",
    "bash", "markdown", "markdown_inline",
  },
  highlight = { enable = true },
  indent = { enable = true },

})
