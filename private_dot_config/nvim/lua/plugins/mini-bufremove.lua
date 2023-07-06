--
--
--
return {{
    'echasnovski/mini.bufremove',
    event = 'VeryLazy',
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
