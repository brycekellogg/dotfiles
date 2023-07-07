--
--
return {{
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
}}
