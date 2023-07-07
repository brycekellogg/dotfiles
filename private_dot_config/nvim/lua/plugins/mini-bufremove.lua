--
--
--
return {{
    'echasnovski/mini.bufremove',
    event = 'BufAdd',
    config = function(_, opts)
        require('mini.bufremove').setup(opts)
    end,
    keys = {
        {
            "<C-c>",
            function()
                MiniBufremove.delete()
            end,
            desc = "Close Buffer"
        }
    }
}}
