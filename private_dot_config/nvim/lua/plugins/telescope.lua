--
--
return {{   
    'nvim-telescope/telescope.nvim',
    opts = {
        defaults = {
            path_display = {smart},
            scroll_strategy = "limit",
        },
        pickers = {
            oldfiles = {cwd_only = true},  -- when listing recent files, only show ones in the CWD tree
        },
    },
    cmd = "Telescope",
    keys = {
        {
            '<C-t>',
            function() require('telescope.builtin').builtin() end,
            mode = {'n', 'i'},
            desc = "Telescope"
        },
        {
            '<C-p>',
            function() require('telescope.builtin').find_files() end,
            mode = {'n', 'i'},
            desc = "Telescope: Find Files"
        },
        {
            '<C-f>',
            function() require('telescope.builtin').live_grep() end,
            mode = {'n', 'i'},
            desc = "Telescope: Live Grep"
        },
        {
            '?',
            function() require('telescope.builtin').grep_string() end,
            mode = {'n'},
            desc = "Telescope: Grep String"
        },
    }
}}

