--
--
return {{   
    'nvim-treesitter/nvim-treesitter',      -- git URL of plugin
    event = {"BufReadPost", "BufNewFile"},  -- lazy load plugin on these vim events
}}
