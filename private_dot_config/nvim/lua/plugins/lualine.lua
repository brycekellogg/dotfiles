--
--
--

local function brycedebugb()
    local winid = vim.fn.win_getid()
    local wininfo = vim.fn.getwininfo(winid)
    local offset = wininfo[1]['textoff']
    return string.rep('~', offset)
end

local function brycedebugc() return
    [[                             c]]
end

return {{
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
        options = {
            theme = 'solarized_dark',
            disabled_filetypes = {
                'alpha',
                winbar = {
                    'neo-tree'
                },
            },
            globalstatus = true,
        },
        sections = {
            lualine_b = {},
            lualine_x = {},
        },
    },
}}

