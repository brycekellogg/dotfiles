--
--
return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = {"BufReadPost", "BufNewFile"},
        opts = {
            ensure_installed = {"c", "cpp", "lua", "fish", "vim"},
            ignore_installed = {"help"},
            highlight = {
                enable = true
            },

            -- Config for nvim-ts-rainbow
            -- Currently disable until colors
            -- are fixed. Looks bad right now.
            rainbow = {
                enable = false,
                extended_mode = true,
                max_file_lines = nil,
            },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end,
    },
    {
        'nvim-treesitter/playground',
        cmd = 'TSPlaygroundToggle',
    },
}
