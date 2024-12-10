--
--
return {{
    "lukas-reineke/indent-blankline.nvim",
    event = 'BufAdd',
    main = 'ibl',
    config = true,
    opts = {
        indent = {
            char = '┃'
        },
        scope = {enabled = false},
    },
}}
