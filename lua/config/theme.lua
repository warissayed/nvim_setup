require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      inlay_hints = { background = true },
    },
    cmp = true,
    gitsigns = true,
    telescope = true,
    nvimtree = true,
    lualine = true,
    markdown = true,
  },
})

vim.cmd.colorscheme("catppuccin")
