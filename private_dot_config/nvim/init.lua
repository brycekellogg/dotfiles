vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1



-- Vim-Plug
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('alexghergh/nvim-tmux-navigation')
Plug('nvim-treesitter/nvim-treesitter')
Plug('micha/vim-colors-solarized')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.0' })
Plug('kyazdani42/nvim-tree.lua')
-- Plug('p00f/nvim-ts-rainbow')

vim.call('plug#end')

vim.cmd('colorscheme solarized')

-- Configure Tree Plugin
require('nvim-tree').setup()

-- Configure Tmux Navigation
local nvim_tmux_navigation = require('nvim-tmux-navigation')
nvim_tmux_navigation.setup { disable_when_zoomed = true }

-- Configure treesitter
local treesitter = require('nvim-treesitter.configs')
treesitter.setup {
    ensure_installed = {"c", "lua", "fish"},
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
}

-- Configure telescope
require('telescope').setup {
    defaults = {
        path_display={shorten=2},
    },
}


-- Disable line wrapping
--
-- By default vim will wrap a line when it gets too long
-- to fit in the current window size. I hate line wrapping
-- and would rather it just gets cut off. This does that.
vim.o.wrap = 0


-- Show line numbers
--
-- This will show line numbers in
-- the far left column in each pane.
vim.o.number = 1


-- Tab settings
--
-- A tab should be shown as 4 spaces, and
-- any time a tab in inserted, replace
-- with 4 spaces instead.
vim.o.expandtab = 1
vim.o.tabstop = 4
vim.o.shiftwidth = 4


-- Fix C indentation for switch
--
-- The default indent action for switch statements
-- in C makes me want to gouge out my eyeballs.
vim.o.cinoptions = l1



-- Key Map
--
-- First Arg: mode
-- Second Arg: keycode
-- Third Arg: action
local mapkey = vim.keymap.set
local telescope = require('telescope.builtin')
local nvimtree = require("nvim-tree.api")
mapkey({'n', 'i'}, '<C-t>', telescope.builtin, {})
mapkey({'n', 'i'}, '<C-p>', telescope.find_files, {})
mapkey({'n', 'i'}, '<C-f>', telescope.live_grep, {})
-- TODO: <C-c> to close buffers
-- TODO: <C-x> to close panes
-- TODO: <C-/> to toggle comment
-- TODO: | to split
-- TODO: - to split
mapkey({'n', 'i'}, '<M-Left>',  nvim_tmux_navigation.NvimTmuxNavigateLeft)
mapkey({'n', 'i'}, '<M-Right>', nvim_tmux_navigation.NvimTmuxNavigateRight)
mapkey({'n', 'i'}, '<M-Up>',    nvim_tmux_navigation.NvimTmuxNavigateUp)
mapkey({'n', 'i'}, '<M-Down>',  nvim_tmux_navigation.NvimTmuxNavigateDown)
mapkey({'n', 'i'}, '<C-b>',     nvimtree.tree.toggle)

