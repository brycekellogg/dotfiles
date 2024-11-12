--
--
--
return {{
    'lewis6991/gitsigns.nvim',
    event = 'BufAdd',
    opts = {
        signs = {
            add    = {text = "█"},
            change = {text = "█"},
        },
        signs_staged = {
            add    = {text = "█"},
            change = {text = "█"},
        }
    },
}}
