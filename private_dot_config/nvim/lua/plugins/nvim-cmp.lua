
return {{
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
    },
    config = function()
        local cmp = require('cmp')

        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'vsnip' },
            }),
            mapping = {
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping.select_next_item({behavior=cmp.SelectBehavior.Select}),
                ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior=cmp.SelectBehavior.Select}),
                ['<Esc>'] = cmp.mapping.close(),
            },
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
        })
    end
}}

