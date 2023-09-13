-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- NvimTree (Side file tree)
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Color schemes
    use('ayu-theme/ayu-vim')
    use('joshdick/onedark.vim')
    use('arcticicestudio/nord-vim')

    -- TreeSitter (Syntax Highlighting)
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- LSPZero (LSP Support)
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    -- ToggleTerm (Floating Terminal)
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup {
            -- floating terminal
            direction = "float",
            -- Ctrl + \ to open
            open_mapping = [[<c-\>]],
            -- Allow same shortcut to close
            terminal_mappings = true,
        }
    end }

    -- Comment (Comments)
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Lualine (Statusline)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }


    -- WebDevIcons (Icons)
    use 'nvim-tree/nvim-web-devicons'

    -- BarBar (Tabs)
    use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }

    -- AutoPairs (Bracket matching)
    use "windwp/nvim-autopairs"


    if packer_bootstrap then 
	    require('packer').sync()
    end
end)
