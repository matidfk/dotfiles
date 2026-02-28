vim.lsp.config('luals', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
})

vim.lsp.enable('luals')


vim.lsp.config('rust-analyzer', {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
})

vim.lsp.enable('rust-analyzer')
