--
--
--
return {{
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    opts = {
        options = {
            separator_style = "slant",
            show_buffer_icons = false,
            close_command = function() MiniBufremove.delete() end,
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
