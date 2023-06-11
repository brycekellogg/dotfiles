--
--
return {{   
    'nvim-neo-tree/neo-tree.nvim',  -- git URL of plugin
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
