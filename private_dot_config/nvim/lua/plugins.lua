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
                    MiniBufremove.delete(bufnum)
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
    },

    {
        'numToStr/comment.nvim',  -- git URL of plugin
        opts = {                  -- options to be passed to setup
            toggler = {
                line = '<C-_>',   -- toggle comment in normal mode
            },
        },
        keys = {                  -- lazy load plugin on these key presses
            {
                '<C-_>',          -- key combo
                function()        -- function to execute
                    local comment = require('Comment.api')
                    local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
                    vim.api.nvim_feedkeys(esc, 'nx', false)
                    comment.toggle.linewise(vim.fn.visualmode())
                end,
                mode = {'x'},     -- modes for these key combos
                desc = "Toggle comment"
            },
            {
                '<C-_>',            -- key combo
                function()          -- function to execute
                    local comment = require('Comment.api')
                    comment.toggle.linewise.current()
                end,
                mode = {'n', 'i'},  -- modes for these key combos
                desc = "Toggle comment"
            }
        }
    },
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
        config = function(_, opts)

            -- currently, incline doesn't refresh on these events,
            -- apply hack to refresh anyway
            vim.api.nvim_create_autocmd({'FocusLost', 'FocusGained'}, {
                callback = function()
                    require('incline').enable()
                end,
            })

            require('incline').setup(opts)
        end,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        ft = {
            'lua',
            'python',
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
    {
        'nvim-lualine/lualine.nvim',
        event = 'BufEnter',
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
                    function ()
                        local navic = require('nvim-navic')
                        local name = vim.fn.expand('%')

                        return name .. "   " .. navic.get_location()
                    end
                },
                lualine_x = {},
            },
        },
    },
    {
        'echasnovski/mini.bufremove',
        event = 'BufAdd',
        config = function(_, opts)
            require('mini.bufremove').setup(opts)
        end,
        keys = {
            {
                "<C-H>",  -- actually <C-BS>
                function()
                    MiniBufremove.delete()
                end,
                desc = "Close Buffer"
            }
        }
    },
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
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        },
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                sources = cmp.config.sources({
                    {
                        name = 'nvim_lsp',
                        entry_filter = function (entry, _)
                            return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
                        end
                    },
                    { name = 'vsnip' },
                }),
                mapping = {
                    ['<Tab>']   = cmp.mapping.confirm({ select = true }),
                    ['<Esc>']   = cmp.mapping.abort(),
                    ['<Down>'] = cmp.mapping.select_next_item({behavior=cmp.SelectBehavior.Select}),
                    ['<Up>']   = cmp.mapping.select_prev_item({behavior=cmp.SelectBehavior.Select}),


                    -- When using arrow keys while the completion window is open,
                    -- the window stays open when the cursor moves up/down. These
                    -- mappings will close the window on cursor up/down.
                    -- ['<Down>'] = function ()
                    --     if cmp.visible() then cmp.mapping.abort()() end
                    --     vim.cmd('norm! j')
                    -- end,
                    -- ['<Up>'] = function ()
                    --     if cmp.visible() then cmp.mapping.abort()() end
                    --     vim.cmd('norm! k')
                    -- end,
                },
                completion = {
                    completeopt = 'menu,menuone,noinsert',
                },
                window = {
                    completion = cmp.config.window.bordered(),
                },
                view = {
                    docs = {auto_open = false},  -- no docs window when doing completion
                },
            })
        end
    },
    {
      "folke/persistence.nvim",
      lazy = true,
      event = "BufReadPre",
      opts = {
          options = {"buffers", "winsize"},
      },
    },
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
            },
            ignore_installed = {"help"},
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            },

            -- Config for nvim-ts-rainbow
            -- Currently disable until colors
            -- are fixed. Looks bad right now.
            rainbow = {
                enable = false,
                extended_mode = true,
                max_file_lines = nil,
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
    {
        'alexghergh/nvim-tmux-navigation',
    },
}
