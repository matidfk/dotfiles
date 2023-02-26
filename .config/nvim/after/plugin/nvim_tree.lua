require("nvim-tree").setup {
    hijack_cursor = true,

    modified = {
        enable = true
    },

    git = {
        enable = false
    },

    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
    }
}

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

-- open on startup
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle <CR>")
