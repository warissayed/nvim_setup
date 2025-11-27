local null_ls = require("null-ls")

require("mason-null-ls").setup({
  ensure_installed = {
    -- JS/TS/React/Next
    "prettier",
    "eslint_d",
    -- Python
    "black",
    "isort",
    -- Go
    "gofumpt",
    "goimports",
    -- Rust
    "rustfmt",
    -- Zig formatter is built into zig itself (zig fmt)
  },
  automatic_installation = true,
})

null_ls.setup({
  sources = {
    -- JS/TS/React
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,

    -- Python
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,

    -- Go
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports,

    -- Rust
    null_ls.builtins.formatting.rustfmt,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = "LspFormatting", buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", {}),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
