--
--
--
return {{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
      routes = {
        {
            filter = {event = 'msg_show', kind = '', find = 'written'},
            opts = {skip = true},
        },
        {
            filter = {event = 'msg_show', kind = '', find = 'lines yanked'},
            opts = {skip = true},
        },
        {
            filter = {event = 'msg_show', kind = '', find = 'more lines'},
            opts = {skip = true}
        },
        {
            filter = {event = 'msg_show', kind = '', find = 'fewer lines'},
            opts = {skip = true}
        },
      },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    }
}}
