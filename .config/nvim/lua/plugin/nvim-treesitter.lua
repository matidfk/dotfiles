vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

require('nvim-treesitter').setup({
    highlight = { enable = true }
})

-- vim.api.nvim_create_autocmd('BufReadPost', {
--    pattern = "*",
--    callback = function()
--        vim.treesitter.start()
--    end,
--    once = true,
--})

-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = {'<filetype>'},
--     callback = function() vim.treesitter.start() end,
-- })

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("EnableTreesitterHighlighting", { clear = true }),
  desc = "Try to enable tree-sitter syntax highlighting",
  pattern = "*", -- run on *all* filetypes
  callback = function()
    pcall(function() vim.treesitter.start() end)
  end,
})
