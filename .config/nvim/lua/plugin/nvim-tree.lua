vim.pack.add({ 'https://github.com/nvim-tree/nvim-tree.lua', 'https://github.com/nvim-tree/nvim-web-devicons' })

require('nvim-tree').setup({
	hijack_cursor = true,

	modified = {
		enable = true
	}
})

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- leader + e to open
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle <CR>")

-- open on startup
local function open_nvim_tree(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
