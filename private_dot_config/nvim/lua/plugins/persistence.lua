--
--
--
return {{
  "folke/persistence.nvim",
  lazy = true,
  event = "BufReadPre",
  opts = {
      options = {"buffers", "winsize"},
  },
}}
