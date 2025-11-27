-- lua/config/lsp.lua
-- Neovim 0.11+ style LSP setup (no require('lspconfig').setup)

-- Mason: install / manage language servers
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    -- JS / TS / React / Next / Node
    "ts_ls",
    "html",
    "cssls",
    "jsonls",
    -- Python
    "pyright",
    -- Go
    "gopls",
    -- Rust
    "rust_analyzer",
    -- Zig
    "zls",
    -- Lua (for Neovim config)
    "lua_ls",
  },
  automatic_installation = true,
})

-- nvim-cmp capabilities
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Global LSP keymaps (recommended Neovim 0.11 way: LspAttach autocmd)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspKeymaps", {}),
  callback = function(args)
    local bufnr = args.buf

    local bufmap = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
    end

    -- VS Code–like LSP shortcuts
    bufmap("n", "gd", vim.lsp.buf.definition)
    bufmap("n", "gD", vim.lsp.buf.declaration)
    bufmap("n", "gr", vim.lsp.buf.references)
    bufmap("n", "gi", vim.lsp.buf.implementation)
    bufmap("n", "K", vim.lsp.buf.hover)
    bufmap("n", "<leader>rn", vim.lsp.buf.rename) -- rename symbol
    bufmap("n", "<leader>ca", vim.lsp.buf.code_action)
    bufmap("n", "[d", vim.diagnostic.goto_prev)
    bufmap("n", "]d", vim.diagnostic.goto_next)
  end,
})

-- List of servers to enable
local servers = {
  "ts_ls",
  "html",
  "cssls",
  "jsonls",
  "pyright",
  "gopls",
  "rust_analyzer",
  "zls",
  "lua_ls",
}

-- Apply capabilities (and any other defaults) to all LSP configs
-- "*" means "all configs" provided by nvim-lspconfig + your own. :contentReference[oaicite:2]{index=2}
vim.lsp.config("*", {
  capabilities = capabilities,
})

-- Extra server-specific config (Lua in your case)
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
    },
  },
})

-- Finally, enable all servers
vim.lsp.enable(servers)
