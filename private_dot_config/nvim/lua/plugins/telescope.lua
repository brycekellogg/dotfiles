--
--
-- 'silent = true' is used in the key map to prevent a command popup in the background
--
return {{
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
                },
            },
        },
        pickers = {
            oldfiles = {cwd_only = true},  -- when listing recent files, only show ones in the CWD tree
        },
    },
    cmd = "Telescope",
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
}}

