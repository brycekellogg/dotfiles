vim.pack.add({
    'https://github.com/nvim-neo-tree/neo-tree.nvim',
    'https://github.com/akinsho/bufferline.nvim',
    'https://github.com/alexghergh/nvim-tmux-navigation',
    'https://github.com/lewis6991/gitsigns.nvim',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/b0o/incline.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/mcauley-penney/visual-whitespace.nvim',
    'https://github.com/nvim-lua/plenary.nvim',        -- dependency for: neo-tree, telescope
    'https://github.com/nvim-tree/nvim-web-devicons',  -- dependency for: neo-tree, lualine, telescope
    'https://github.com/MunifTanjim/nui.nvim',         -- dependency for: neo-tree
    'https://github.com/echasnovski/mini.bufremove',   -- dependency for: bufferline close command
})


-- File Tree Explorer
--
-- ???
require('neo-tree').setup({
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
})
vim.keymap.set({'n', 'i', 'v'}, '<C-b>', function() require("neo-tree.command").execute({toggle = true}) end)


-- Buffer Line
--
-- ???
require('bufferline').setup({
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
})
vim.keymap.set({'n', 'i'}, '<C-PageUp>',   function() require('bufferline').cycle(-1)    end)
vim.keymap.set({'n', 'i'}, '<C-PageDown>', function() require('bufferline').cycle(1)     end)
vim.keymap.set({'n', 'i', 'v'}, '<C-H>',   function() require('mini.bufremove').delete() end)


-- Tmux Navigation
--
-- ???
require('nvim-tmux-navigation').setup({
    options = {
        disable_when_zoomed = true,
    }
})
vim.keymap.set({'n', 'i', 'v'}, '<M-Left>',  function() require('nvim-tmux-navigation').NvimTmuxNavigateLeft()  end)
vim.keymap.set({'n', 'i', 'v'}, '<M-Right>', function() require('nvim-tmux-navigation').NvimTmuxNavigateRight() end)
vim.keymap.set({'n', 'i', 'v'}, '<M-Up>',    function() require('nvim-tmux-navigation').NvimTmuxNavigateUp()    end)
vim.keymap.set({'n', 'i', 'v'}, '<M-Down>',  function() require('nvim-tmux-navigation').NvimTmuxNavigateDown()  end)


-- Git Signs
--
-- ???
require('gitsigns').setup({
    signs = {
        add    = {text = "█"},
        change = {text = "█"},
    },
    signs_staged = {
        add    = {text = "█"},
        change = {text = "█"},
    }
})


-- Status Line
--
-- ???
require('lualine').setup({
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
})



-- Incline
--
-- Shows the filename of the open buffer
-- in the upper right corner of the pane.
require('incline').setup({
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
})


-- Telescope
--
--
require('telescope').setup({
    defaults = {
        -- path_display = {'smart'},
        scroll_strategy = 'limit',
        layout_strategy = 'bottom_pane',
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
})
vim.keymap.set({'n', 'i'}, '<C-p>', function() require('telescope.builtin').find_files()  end)
vim.keymap.set({'n', 'i'}, '<C-f>', function() require('telescope.builtin').live_grep()   end)
vim.keymap.set({'n'},      '?',     function() require('telescope.builtin').grep_string() end)


-- Treesitter
--
-- ???
require('nvim-treesitter').setup({
    ensure_installed = {
        "c",
        "cpp",
        -- "lua",
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
        "yaml",
        "html",
        "svelte",
    },
    ignore_installed = {"help"},
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
})

