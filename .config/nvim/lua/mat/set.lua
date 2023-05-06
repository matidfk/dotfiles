vim.opt.nu = true
vim.opt.relativenumber = true

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

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50

vim.diagnostic.config({
    virtual_text = true
})

vim.g.mapleader = " "

vim.opt.foldmethod = "expr"
vim.opt.foldlevelstart = 20
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

function _G.MyFoldText()
    return vim.fn.getline(vim.v.foldstart) .. ' ... ' .. vim.fn.getline(vim.v.foldend):gsub("^%s*", "")
end

vim.opt.foldtext = 'v:lua.MyFoldText()'
vim.opt.fillchars:append({ fold = " " })

-- format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
