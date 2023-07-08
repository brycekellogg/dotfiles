--
--
--
return {
    {
        'neovim/nvim-lspconfig',
        config = function(_, opts)
            require('lspconfig').lua_ls.setup({
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
            })
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            ensure_installed = {'lua_ls'},
        },
    },
}
