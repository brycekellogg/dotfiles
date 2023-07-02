--
--
return {{   
    'nvim-neo-tree/neo-tree.nvim',  -- git URL of plugin
    opts = {
        add_blank_line_at_top = true,
        close_if_last_window = true,
        default_component_configs = {
            name = {
                use_git_status_colors = false,
            },
        },
        filesystem = {
            use_libuv_file_watcher = true,
        },
    },
    cmd = "Neotree",                -- lazy load plugin on this command
    keys = {                        -- lazy load plugin on these key presses
        {
            "<C-b>",                -- key combo
            function()              -- function to execute
                require("neo-tree.command").execute({toggle = true})
            end,
            desc = "Toggle File Explorer"
        }
    }
}}
