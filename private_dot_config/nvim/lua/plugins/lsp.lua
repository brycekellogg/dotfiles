--
--
--
return {
    {
        'neovim/nvim-lspconfig',
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
        'williamboman/mason-lspconfig.nvim',
        opts = {
            ensure_installed = {'lua_ls'},
        },
    },
}
