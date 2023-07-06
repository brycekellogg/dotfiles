--
--
return {{
    'b0o/incline.nvim',
    event = 'VeryLazy',
    config = function(_, opts)
        require('incline').setup(opts)
    end,
}}
