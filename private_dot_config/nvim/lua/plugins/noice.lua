--
--
--
return {{
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        cmdline = {
            view = 'cmdline',
        },

        routes = {
            {
                filter = {event = 'msg_show', kind = '', find = 'written'},
                opts = {skip = true},
            },
            {
                filter = {event = 'msg_show', kind = '', find = 'lines yanked'},
                opts = {skip = true},
            },
            {
                filter = {event = 'msg_show', kind = '', find = 'more lines'},
                opts = {skip = true}
            },
            {
                filter = {event = 'msg_show', kind = '', find = 'fewer lines'},
                opts = {skip = true}
            },
        },

        lsp = {
            -- This section controls showing function signatures. We disable the
            -- auto_open so that you don't get function docs when typing a function.
            signature = {
                auto_open = {enabled = false},
            },
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
}}
