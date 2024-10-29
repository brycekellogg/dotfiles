
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
                {
                    name = 'nvim_lsp',
                    entry_filter = function (entry, _)
                        return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
                    end
                },
                { name = 'vsnip' },
            }),
            mapping = {
                ['<Tab>']   = cmp.mapping.confirm({ select = true }),
                ['<Esc>']   = cmp.mapping.abort(),
                ['<Down>'] = cmp.mapping.select_next_item({behavior=cmp.SelectBehavior.Select}),
                ['<Up>']   = cmp.mapping.select_prev_item({behavior=cmp.SelectBehavior.Select}),


                -- When using arrow keys while the completion window is open,
                -- the window stays open when the cursor moves up/down. These
                -- mappings will close the window on cursor up/down.
                -- ['<Down>'] = function ()
                --     if cmp.visible() then cmp.mapping.abort()() end
                --     vim.cmd('norm! j')
                -- end,
                -- ['<Up>'] = function ()
                --     if cmp.visible() then cmp.mapping.abort()() end
                --     vim.cmd('norm! k')
                -- end,
            },
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
            window = {
                completion = cmp.config.window.bordered(),
            },
            view = {
                docs = {auto_open = false},  -- no docs window when doing completion
            },
        })
    end
}}

