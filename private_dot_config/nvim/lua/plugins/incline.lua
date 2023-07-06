--
--
return {{
    'b0o/incline.nvim',
    event = 'VeryLazy',
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
            if row == 1 then
                return {{res, guibg='#' .. string.format('%06x', hlCursor)}}
            end

            -- return default
            return {{res, guibg='NONE'}}
        end,
    },
    config = function(_, opts)
        require('incline').setup(opts)
    end,
}}
