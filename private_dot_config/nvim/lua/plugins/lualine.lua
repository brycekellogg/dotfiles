--
--
--
return {{
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
        options = {
            theme = 'solarized_dark',
            disabled_filetypes = {
                'alpha',
            },
            globalstatus = true,
        },
        sections = {
            lualine_b = {},
            lualine_x = {},
        },
    },
}}

