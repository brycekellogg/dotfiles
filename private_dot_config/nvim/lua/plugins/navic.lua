--
--
--
return {{
    'SmiteshP/nvim-navic',
    lazy = true,
    dependencies = {
        'neovim/nvim-lspconfig'
    },
    opts = {
        lsp = {
            auto_attach = true,
        },
    },
}}
