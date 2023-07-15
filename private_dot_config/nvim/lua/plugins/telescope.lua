--
--
--



-- live_grep config (:h telescope.builtin.live_grep()) --
---------------------------------------------------------
local live_grep = {
    disable_coordinates = true,  -- don't show the line & row numbers
}

-- oldfiles config (:h telescope.builtin.oldfiles) --
-----------------------------------------------------
local oldfiles = {
    cwd_only = true  -- show only files in the cwd
}


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
            live_grep = live_grep,
            oldfiles = oldfiles,
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
}}

