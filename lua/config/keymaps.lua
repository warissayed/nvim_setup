local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Save / close
map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>a", opts)
map("n", "<C-w>", ":bd<CR>", opts) -- close buffer (like close tab)

-- File tree toggle (like VS Code Explorer)
map("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { silent = true })


-- Telescope: file search (Ctrl+P)
map("n", "<C-p>", ":Telescope find_files<CR>", opts)

-- Telescope: live grep (Ctrl+Shift+F)
map("n", "<C-S-f>", ":Telescope live_grep<CR>", opts)

-- Buffer navigation (like tabs)
map("n", "<C-Tab>", ":bnext<CR>", opts)
map("n", "<C-S-Tab>", ":bprevious<CR>", opts)

-- LSP keymaps will be set in lsp.lua (per-buffer)

-- Switch between open files (like Ctrl+Tab / Ctrl+Shift+Tab)
vim.keymap.set("n", "<C-Tab>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<C-S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })

-- Close file (buffer) — like clicking X
vim.keymap.set("n", "<C-w>", ":bd<CR>", { silent = true })

-- Reopen last closed (like Ctrl+Shift+T in VS Code)
vim.keymap.set("n", "<leader>ur", ":e#<CR>", { silent = true })

