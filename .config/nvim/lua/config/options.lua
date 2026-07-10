-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50

-- tab = 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.showmode = false

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

require('vim._core.ui2').enable({})

vim.diagnostic.config({
    virtual_text = true
})

--
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldlevelstart = 20
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- function _G.MyFoldText()
--     return vim.fn.getline(vim.v.foldstart) .. ' ... ' .. vim.fn.getline(vim.v.foldend):gsub("^%s*", "")
-- end
--
-- vim.opt.foldtext = 'v:lua.MyFoldText()'
-- vim.opt.fillchars:append({ fold = " " })

vim.diagnostic.config {
    update_in_insert = true
}


-- format on save
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]


-- remove terminal padding on edges
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.defer_fn(function()
            vim.cmd("silent !kitty @ set-spacing padding=0")
        end, 10)
    end,
})

vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
        vim.cmd("silent !kitty @ set-spacing padding=default")
    end,
})
