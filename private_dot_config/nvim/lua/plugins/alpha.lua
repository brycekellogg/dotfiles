--
--
--


return {{
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    cond = function() return 0 == vim.fn.argc() end,  -- only launch alpha when no file opened
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      -- This is the header that gets d
      dashboard.section.header.val = {
          " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
          " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
          " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
          " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
          " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
          " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("a", "? " .. " Git status", ":Neogit <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
    config = function(_, dashboard)
        vim.api.nvim_create_autocmd('User', {
            pattern = 'AlphaReady',
            desc = 'hide cursor for alpha',
            callback = function()

                -- vim.cmd('hi Cursor blend=100')
                -- local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
                -- hl.blend = 100
                -- vim.api.nvim_set_hl(0, 'Cursor', hl)
                -- vim.opt.guicursor:append('a:Cursor/lCursor')
            end,
        })
        vim.api.nvim_create_autocmd('BufUnload', {
            buffer = 0,
            desc = 'show cursor after alpha',
            callback = function()
                -- local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
                -- hl.blend = 0
                -- vim.cmd('hi Cursor blend=0')
                -- vim.api.nvim_set_hl(0, 'Cursor', hl)
                -- vim.opt.guicursor:remove('a:Cursor/lCursor')
            end,
        })

        require("alpha").setup(dashboard.opts)
    end,
}}

