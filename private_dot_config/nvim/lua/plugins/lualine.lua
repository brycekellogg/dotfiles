--
--
--
return {{
    'nvim-lualine/lualine.nvim',
    event = 'BufAdd',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'SmiteshP/nvim-navic',
    },
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
            lualine_c = {
                'navic',
            },
            lualine_x = {},
        },
    },
}}

