local cmp = require'cmp'
cmp.setup {
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    },
    formatting = {
        format = require('lspkind').cmp_format(),
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },

        ['<Tab>'] = function(fallback)
            if not cmp.select_next_item() then
            if vim.bo.buftype ~= 'prompt' and has_words_before() then
                cmp.complete()
            else
                fallback()
            end
            end
        end,

        ['<S-Tab>'] = function(fallback)
            if not cmp.select_prev_item() then
            if vim.bo.buftype ~= 'prompt' and has_words_before() then
                cmp.complete()
            else
                fallback()
            end
            end
        end,
    },
}