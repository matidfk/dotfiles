vim.pack.add({ 'https://github.com/akinsho/toggleterm.nvim' })

require('toggleterm').setup({
    direction = "float",
    -- Alt + enter to open
    open_mapping = [[<A-CR>]],
    -- Allow same shortcut to close
    terminal_mappings = true,
})
