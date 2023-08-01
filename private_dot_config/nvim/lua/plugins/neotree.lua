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
        popup_border_style = "rounded",
        close_if_last_window = true,
        use_popups_for_input = false,  -- uses noice via vim.ui.input()
        window = {
            mappings = {
                ['<C-PageUp>']   = 'prev_source',
                ['<C-PageDown>'] = 'next_source',
                ['|'] = 'open_vsplit',
                ['-'] = 'open_split',
                ['='] = 'toggle_auto_expand_width',
                ['<'] = 'none',
                ['>'] = 'none',
                ['S'] = 'none',
                ['s'] = 'none',
                ['q'] = 'none',
                ['e'] = 'none',
            },
        },
        default_component_configs = {
            name = {
                use_git_status_colors = false,
            },
            container = {
                enable_character_fade = false,
            },
        },
        filesystem = {
            use_libuv_file_watcher = true,
            group_empty_dirs = false,  -- setting this to true causes refresh errors (maybe)
            filtered_items = {
                hide_dotfiles = false,
            },
        },
        source_selector = {
            winbar = true,
            content_layout = 'center',
        },
        renderers = {
            message = {
                { "indent", with_markers = true },        -- needed to fix indent markers on hidden items
                { "name", highlight = "NeoTreeMessage" }, -- nneded to fix indent markers on hidden items
          },
        },
        event_handlers = {
            {
                event = "file_opened",
                handler = function(_)
                    require("neo-tree.command").execute({ action = "close" })
                end
          },
        }
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

