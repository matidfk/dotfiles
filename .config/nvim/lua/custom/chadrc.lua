-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme_toggle = { "doomchad", "catpuccin"},
  transparency = true,
}

-- auto format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

-- space a code actions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)


M.plugins = require "custom.plugins"


return M
