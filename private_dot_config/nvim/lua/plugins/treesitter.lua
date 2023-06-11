--
--
return {{   
    'nvim-treesitter/nvim-treesitter',       -- git URL of plugin
    event = {"BufReadPost", "BufNewFile"},  -- lazy load on these vim events
}}
