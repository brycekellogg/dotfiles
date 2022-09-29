-- Vim-Plug
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('alexghergh/nvim-tmux-navigation')
Plug('nvim-treesitter/nvim-treesitter')
Plug('micha/vim-colors-solarized')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.0' })

vim.call('plug#end')

vim.cmd('colorscheme solarized')


-- Configure Tmux Navigation
local nvim_tmux_navigation = require('nvim-tmux-navigation')
nvim_tmux_navigation.setup { disable_when_zoomed = true }
vim.keymap.set('n', '<M-Left>',  nvim_tmux_navigation.NvimTmuxNavigateLeft)
vim.keymap.set('n', '<M-Right>', nvim_tmux_navigation.NvimTmuxNavigateRight)
vim.keymap.set('n', '<M-Up>',    nvim_tmux_navigation.NvimTmuxNavigateUp)
vim.keymap.set('n', '<M-Down>',  nvim_tmux_navigation.NvimTmuxNavigateDown)

-- Configure treesitter
local treesitter = require('nvim-treesitter.configs')
treesitter.setup {
    ensure_installed = {"c", "lua", "fish"},
    highlight = {
        enable = true
    }
}
