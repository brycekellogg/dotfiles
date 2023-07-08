--
--
return {{   
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'main', -- NerdFont fix not released yet
    dependencies = {
        "nvim-lua/plenary.nvim",
        'nvim-tree/nvim-web-devicons',
        "MunifTanjim/nui.nvim",
    },
    opts = {
        add_blank_line_at_top = true,
        close_if_last_window = true,
        window = {
            mappings = {
                ['<C-PageUp>']   = 'prev_source',
                ['<C-PageDown>'] = 'next_source',
                ['|'] = 'open_vsplit',
                ['-'] = 'open_split',
                ['<'] = 'none',
                ['>'] = 'none',
                ['S'] = 'none',
                ['s'] = 'none',
            },
        },
        default_component_configs = {
            name = {
                use_git_status_colors = false,
            },
        },
        filesystem = {
            use_libuv_file_watcher = true,
        },
        source_selector = {
            winbar = true,
            content_layout = 'center',
        },
    },
    cmd = "Neotree",
    keys = {
        {
            "<C-b>",
            function()
                require("neo-tree.command").execute({toggle = true})
            end,
            desc = "Toggle File Explorer"
        }
    }
}}

