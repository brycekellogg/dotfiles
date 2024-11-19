return {{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
    config = function(_, opts)
        local autopairs = require('nvim-autopairs')
        local Rule = require('nvim-autopairs.rule')
        autopairs.setup(opts)
        autopairs.add_rules({
            Rule('/*', '*/', 'typescript')
        })

    end,
}}
