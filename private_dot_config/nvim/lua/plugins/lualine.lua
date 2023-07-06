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
        winbar = {
            lualine_a = {},
            lualine_b = {{
                brycedebugb,
                padding = 0,
                color = 'LualineWinbarActive_b',
            }},
            lualine_c = {{
                brycedebugc,
                color = 'LualineWinbarActive_c',
            }},
            lualine_x = {{
                'filename',
                color = 'LualineWinbarActive_x',
            }},
            lualine_y = {},
            lualine_z = {},
        },
        inactive_winbar = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {{
                'inactive',
                color = 'LualineWinbarInactive_c',
            }},
            lualine_x = {{
                'filename',
                color = 'LualineWinbarInactive_x',
            }},
            lualine_y = {},
            lualine_z = {}
        },
    },
}}

