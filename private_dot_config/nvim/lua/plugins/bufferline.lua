--
--
--
return {{
    'akinsho/bufferline.nvim',
    dependencies = {'echasnovski/mini.bufremove'}, -- for close command
    event = 'BufAdd',
    opts = {
        options = {
            separator_style = "slant",
            show_buffer_icons = false,
            close_command = function() MiniBufremove.delete() end,  -- TODO: incorrectly closes current buffer, not clicked buffer
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
}}
