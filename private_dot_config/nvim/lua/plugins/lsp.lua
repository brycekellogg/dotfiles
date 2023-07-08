--
-- Dependencies are used to ensure the correct order of:
--    1) mason.nvim
--    2) mason-lspconfig.nvim
--    3) nvim-lspconfig
--
return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        ft = {
            'lua',
        },
        opts = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {'vim'},
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        },
        config = function(_, opts)

            vim.diagnostic.config({
                virtual_text = true,
                signs = false,
            })

            require('lspconfig').lua_ls.setup(opts)
        end,
    },
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate', -- :MasonUpdate updates registry contents
        lazy = true,
        opts = {},
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
        },
        lazy = true,
        opts = {
            ensure_installed = {'lua_ls'},
        },
    },
}
