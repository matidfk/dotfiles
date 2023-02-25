-- transparent background
function TransparentBG()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "GitGutterAdd", { bg = "none" })
  vim.api.nvim_set_hl(0, "GitGutterChange", { bg = "none" })
  vim.api.nvim_set_hl(0, "GitGutterDelete", { bg = "none" })
  vim.api.nvim_set_hl(0, "GitGutterChangeDelete", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

TransparentBG()
