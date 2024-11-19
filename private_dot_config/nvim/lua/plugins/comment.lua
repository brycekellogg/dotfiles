--
--
return {{
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
}}

