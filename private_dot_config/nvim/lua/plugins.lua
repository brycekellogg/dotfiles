return {

    --
    --
    --
    {
        'goolord/alpha-nvim',
        event = 'VimEnter',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        cond = function() return 0 == vim.fn.argc() end,  -- only launch alpha when no file opened
        opts = function()
          local dashboard = require("alpha.themes.dashboard")

          -- This is the header that gets d
          dashboard.section.header.val = {
              " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
              " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
              " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
              " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
              " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
              " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
          }

          dashboard.section.buttons.val = {
            dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
            dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
            dashboard.button("a", "? " .. " Git status", ":Neogit <CR>"),
            dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
            dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
            dashboard.button("q", " " .. " Quit", ":qa<CR>"),
          }
          for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
          end
          dashboard.section.header.opts.hl = "AlphaHeader"
          dashboard.section.buttons.opts.hl = "AlphaButtons"
          dashboard.section.footer.opts.hl = "AlphaFooter"
          dashboard.opts.layout[1].val = 8
          return dashboard
        end,
        config = function(_, dashboard)
            vim.api.nvim_create_autocmd('User', {
                pattern = 'AlphaReady',
                desc = 'hide cursor for alpha',
                callback = function()

                    -- vim.cmd('hi Cursor blend=100')
                    -- local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
                    -- hl.blend = 100
                    -- vim.api.nvim_set_hl(0, 'Cursor', hl)
                    -- vim.opt.guicursor:append('a:Cursor/lCursor')
                end,
            })
            vim.api.nvim_create_autocmd('BufUnload', {
                buffer = 0,
                desc = 'show cursor after alpha',
                callback = function()
                    -- local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
                    -- hl.blend = 0
                    -- vim.cmd('hi Cursor blend=0')
                    -- vim.api.nvim_set_hl(0, 'Cursor', hl)
                    -- vim.opt.guicursor:remove('a:Cursor/lCursor')
                end,
            })

            require("alpha").setup(dashboard.opts)
        end,
    },


    --- 
    ---
    ---
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {},
        config = function(_, opts)
            local autopairs = require('nvim-autopairs')
            local Rule = require('nvim-autopairs.rule')
            autopairs.setup(opts)
            autopairs.add_rules({
                Rule('/*', '*/', 'typescript')
            })

        end,
    },


    {
        'akinsho/bufferline.nvim',
        dependencies = {'echasnovski/mini.bufremove'}, -- for close command
        event = 'BufAdd',
        opts = {
            options = {
                separator_style = "slant",
                show_buffer_icons = false,
                close_command = function(bufnum)
                    require('mini.bufremove').delete(bufnum)
                    vim.cmd('redraw!')
                end,
                offsets = {
                    {
                        filetype = 'neo-tree',
                        text = "EXPLORER",
                        text_align = "center",
                        separator = false,
                        highlight = "BufferLineFill",
                    },
                },
            }
        },
        keys = {
            {
                '<C-PageUp>',
                function() require('bufferline').cycle(-1) end,
                mode = {'n', 'i'},
            },
            {
                '<C-PageDown>',
                function() require('bufferline').cycle(1) end,
                mode = {'n', 'i'},
            },
        },
    },


    -- ???
    -- ???
    -- ???
    {
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
    },


    --------------------------------------------
    -- Incline                                --
    --                                        --
    -- Shows the filename of the open buffer  --
    -- in the upper right corner of the pane. --
    --------------------------------------------
    {
        'b0o/incline.nvim',
        event = 'BufAdd',
        opts = {
            window = {
                padding = 0,
            },
            render = function(props)
                -- get filename
                local bufname = vim.api.nvim_buf_get_name(props.buf)
                local res = bufname ~= '' and vim.fn.fnamemodify(bufname, ':t') or '[No Name]'

                -- change highlight if overlapping cursorline
                local hlCursor  = vim.api.nvim_get_hl(0, {name='CursorLine'}).bg
                local row = vim.api.nvim_win_get_cursor(props.win)[1]
                if row == 1 and props.focused and vim.o.cursorline then
                    return {{res, guibg='#' .. string.format('%06x', hlCursor)}}
                end

                -- return default
                return {{res, guibg='NONE'}}
            end,
        },
    },


    ----------------
    -- LSP Config --
    ----------------
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        ft = {
            'lua',
            'python',
            'typescript',
            'typescriptreact',
        },
        opts = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {'vim'},
                        disable = {'unused-local'},
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        },
        config = function(_, opts)

            -- This disables the signs in the sign column
            vim.diagnostic.config({
                virtual_text = true,
                signs = false,
            })

            -- Setup each individual server
            require('lspconfig').lua_ls.setup(opts)
            require('lspconfig').vtsls.setup(opts)  -- typescript
            -- require('lspconfig').pylsp.setup(opts)
            -- require('lspconfig').clangd.setup(opts)
        end,
    },
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate', -- :MasonUpdate updates registry contents
        lazy = true,
        opts = {},
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
        },
        lazy = true,
        opts = {
            ensure_installed = {
                'lua_ls',
                'pylsp',
                'clangd',
                'vtsls',
            },
        },
    },


    -- Status Line
    --
    -- ???
    {
        'nvim-lualine/lualine.nvim',
        event = 'BufEnter',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                icons_enabled = false,
                theme = 'solarized_dark',
                globalstatus = true,
            },
            sections = {
                lualine_b = {},
                lualine_c = {{'filename', path=1}},
                lualine_x = {'filetype'},
            },
        },
    },
    {
        'echasnovski/mini.bufremove',
        event = 'BufAdd',
        keys = {
            {
                "<C-H>",  -- actually <C-Backspace>
                function() require('mini.bufremove').delete() end,
                desc = "Close Buffer"
            }
        }
    },


    -- File Tree
    --
    -- ???
    {
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
            enable_diagnostics = false,
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

                    -- When using yank-line (like in normal mode), we want to
                    -- copy the file path relative to the CWD to the clipboard.
                    ['y'] = 'none',
                    ['yy'] = function (state)
                        local node = state.tree:get_node()
                        local filename = vim.fn.fnamemodify(node.path, ":.")
                        vim.fn.setreg('+', filename)
                        vim.notify("Copied: " .. filename)
                    end,

                    -- The key combo declared below for toggling doesn't seem
                    -- to work if neo-tree has focus. This makes sure we close
                    -- if neo-tree is open and focused.
                    ["<C-b>"] = function(state)
                        require("neo-tree.command").execute({ action = "close" })
                    end,

                    -- A telescope string search initiated from neotree should only search
                    -- files that are children of the currently selected file/folder.
                    ['<C-f>'] = function (state)
                        local root = state.tree:get_node().path
                        require("neo-tree.command").execute({ action = "close" })
                        require('telescope.builtin').live_grep({cwd=root})
                    end,

                    -- A telescope file search initiated from neotree should only search
                    -- files that are children of the currently selected file/folder.
                    ['<C-p>'] = function (state)
                        local root = state.tree:get_node().path
                        require("neo-tree.command").execute({ action = "close" })
                        require('telescope.builtin').find_files({cwd=root})
                    end,
                },
            },
            buffers = {
                show_unloaded = true,
            },
            default_component_configs = {
                name = {
                    use_git_status_colors = false,
                },
                container = {
                    enable_character_fade = false,
                },
                git_status = {
                    symbols = {
                        -- Disable "change type" git symbols
                        added     = "",
                        deleted   = "",
                        modified  = "",
                        renamed   = "",
                        -- Modify "status type" git symbols
                        staged    = "✚",
                        unstaged  = "󰏫",
                    },
                    align = "right",
                },
                symlink_target = {
                    enabled = true,
                },
            },
            filesystem = {
                use_libuv_file_watcher = true,
                group_empty_dirs = false,  -- setting this to true causes refresh errors (maybe)
                filtered_items = {
                    hide_dotfiles = false,
                    hide_by_name = {
                        ".git",
                    },
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
    },


    -----------------------
    -- Completion Plugin --
    -----------------------
    {
        'saghen/blink.cmp',
        version = '1.*',
        opts = {

        },
    },


    ------------------------
    -- Persistence Plugin --
    ------------------------
    {
      "folke/persistence.nvim",
      lazy = true,
      event = "BufReadPre",
      opts = {
          options = {"buffers", "winsize"},
      },
    },


    ---------------
    -- Telescope --
    ---------------
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            -- TODO: telescope-fzf-native.nvim
        },
        opts = {
            defaults = {
                -- path_display = {'smart'},
                scroll_strategy = 'limit',
                mappings = {
                    i = {
                        ['<esc>'] = function(_) require('telescope.actions').close(_) end,  -- close on first escape
                        ['<LeftMouse>'] = function(_) end, -- do nothing
                    },
                },
            },
            pickers = {
                live_grep = { disable_coordinates = true },
                oldfiles  = { cwd_only = true },
            },
        },
        cmd = "Telescope",

        -- 'silent = true' is used in the key map to prevent a command popup in the background
        keys = {
            {
                '<C-p>',
                function() require('telescope.builtin').find_files() end,
                mode = {'n', 'i'},
                silent = true,
                desc = "Telescope: Find Files"
            },
            {
                '<C-f>',
                function() require('telescope.builtin').live_grep() end,
                mode = {'n', 'i'},
                silent = true,
                desc = "Telescope: Live Grep"
            },
            {
                '?',
                function() require('telescope.builtin').grep_string() end,
                mode = {'n'},
                silent = true,
                desc = "Telescope: Grep String"
            },
        }
    },


    -- Treesitter
    --
    -- ???
    {
        'nvim-treesitter/nvim-treesitter',
        event = {"BufReadPost", "BufNewFile"},
        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "lua",
                "fish",
                "vim",
                "vimdoc",
                "query",
                "elixir",
                "python",
                "c_sharp",
                "bash",
                "typescript",
                "javascript",
                "tsx",
                "make",
                "toml",
            },
            ignore_installed = {"help"},
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end,
    },
    {
        'nvim-treesitter/playground',
        cmd = 'TSPlaygroundToggle',
    },
    {
        'mcauley-penney/visual-whitespace.nvim',
        config = true,
    },


    -- Tmux Navigation
    --
    -- ???
    {
        'alexghergh/nvim-tmux-navigation',
        opts = {
            disable_when_zoomed = true,
        },
        keys = {
            {
                '<M-Left>',
                function() require('nvim-tmux-navigation').NvimTmuxNavigateLeft() end,
                mode = {'n', 'i', 'v'},
                silent = true,
            },
            {
                '<M-Right>',
                function() require('nvim-tmux-navigation').NvimTmuxNavigateRight() end,
                mode = {'n', 'i', 'v'},
                silent = true,
            },
            {
                '<M-Up>',
                function() require('nvim-tmux-navigation').NvimTmuxNavigateUp() end,
                mode = {'n', 'i', 'v'},
                silent = true,
            },
            {
                '<M-Down>',
                function() require('nvim-tmux-navigation').NvimTmuxNavigateDown() end,
                mode = {'n', 'i', 'v'},
                silent = true,
            },
        }
    },


    -- Folding
    -- {
    --     'kevinhwang91/nvim-ufo',
    --     dependencies = {'kevinhwang91/promise-async'},
    --
    --     opts = {
    --         provider_selector = function(bufnr, filetype, buftype)
    --             return {'treesitter', 'indent'}
    --         end
    --     },
    --
    --     config = function(_, opts)
    --         vim.o.foldcolumn = '6'
    --         vim.o.foldlevel = 99
    --         vim.o.foldlevelstart = 99
    --         vim.o.foldnestmax = 2
    --         vim.o.foldenable = true
    --         require('ufo').setup(opts)
    --     end,
    -- },
}
