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

vim.lsp.config('pyright', {
    cmd = { 'pyright' },
    filetypes = { 'python' },
})

vim.lsp.enable('pyright')
