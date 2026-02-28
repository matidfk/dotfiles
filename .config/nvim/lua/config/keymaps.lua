-- open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selected lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- paste without replacing register
vim.keymap.set("x", "<leader>p", "\"_dP")
-- same but delete
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"*yy")
vim.keymap.set("v", "<leader>y", "\"*y")

-- paste system clipboard
vim.keymap.set("n", "<leader>p", "\"*p", {noremap = true, nowait = true})
vim.keymap.set("n", "<leader>P", "\"*P")

-- code actions
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
-- rename
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

-- better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)")
vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")
