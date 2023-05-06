require 'bufferline'.setup {
    icons = {
    diagnostics = { { enabled = true }, { enabled = true }, { enabled = true }, { enabled = true } }
    }
}

local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
    return require 'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
    bufferline_api.set_offset(get_tree_size() + 1)
end)

nvim_tree_events.subscribe('Resize', function()
    bufferline_api.set_offset(get_tree_size() + 1)
end)

nvim_tree_events.subscribe('TreeClose', function()
    bufferline_api.set_offset(0)
end)

-- Move to previous/next
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>')

-- Pin/unpin buffer
vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>')
-- Close buffer
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>')
