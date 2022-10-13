
-- ???
--
-- ???
-- ???
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1


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


-- Enable Hidden Buffers
--
-- Allow us to have unsaved hidden buffers which act
-- similar to how tabs in other editors are used.
vim.o.hidden = 1

-- Enable cursor line
--
-- This option creates a slightly lighter background line
-- for the line the cursor is on. It really helps with
-- easily visually identifying the current cursor line.
vim.o.cursorline = true

vim.o.clipboard = 'unnamed'
vim.g.clipboard = {
    copy = {
        ['+'] = 'win32yank.exe -i --crlf',
        ['*'] = 'win32yank.exe -i --crlf',
    },
    paste = {
        ['+'] = 'win32yank.exe -o --lf',
        ['*'] = 'win32yank.exe -o --lf',
    },
    cache_enabled=true,
}

--
--
-- ???
-- vim.opt.termguicolors = true

-- Vim-Plug
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('alexghergh/nvim-tmux-navigation')
Plug('nvim-treesitter/nvim-treesitter')
Plug('micha/vim-colors-solarized')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.0' })
Plug('kyazdani42/nvim-tree.lua')
Plug('numToStr/comment.nvim')
-- Plug('akinsho/bufferline.nvim')
Plug('romgrk/barbar.nvim')
-- Plug('p00f/nvim-ts-rainbow')

vim.call('plug#end')


vim.cmd('colorscheme solarized')





-- Configure Buffer Line Plugin
require('bufferline').setup {
    icons = false,

}

local nvimtree = require('nvim-tree.events')
local bufferline = require('bufferline.api')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvimtree.subscribe('TreeOpen', function()
  bufferline.set_offset(get_tree_size())
end)

nvimtree.subscribe('Resize', function()
  bufferline.set_offset(get_tree_size())
end)

nvimtree.subscribe('TreeClose', function()
  bufferline.set_offset(0)
end)


-- Configure Tree Plugin
require('nvim-tree').setup {
    view = {
        adaptive_size = true,
    },
    update_focused_file = {
        enable = true,
    },
    -- open_file = {
        -- quit_on_open = true,
    -- },
}


-- Configure Comment Plugin
require('Comment').setup {
    toggler = {
        line = '<C-/>',
    },
}

-- Configure Bufferline
-- require("bufferline").setup {

-- }


-- Configure Tmux Navigation
local nvim_tmux_navigation = require('nvim-tmux-navigation')
nvim_tmux_navigation.setup {
    disable_when_zoomed = true,
}


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




-- Key Map
--
-- First Arg: mode
-- Second Arg: keycode
-- Third Arg: action
local mapkey = vim.keymap.set
local telescope = require('telescope.builtin')
local nvimtree = require('nvim-tree.api')
local comment = require('Comment.api')
mapkey({'n', 'i'}, '<C-t>', telescope.builtin, {})
mapkey({'n', 'i'}, '<C-p>', telescope.find_files, {})
mapkey({'n', 'i'}, '<C-f>', telescope.live_grep, {})
mapkey({'n'}, '<C-c>', '<CMD>BufferClose<CR>')
-- TODO: <C-x> to close panes
mapkey({'n', 'i'}, '<C-_>', comment.toggle.linewise.current) -- actually <C-/>
-- TODO: <C-/> to comment out block in visual mode
-- TODO: <C-PageUp> to change buffers
-- mapkey({'n'}, '<C-PageUp>', )
-- TODO: <C-PageDown> to change buffers
mapkey({'n', 'i'}, '<C-PageUp>',   '<Cmd>BufferPrevious<CR>')
mapkey({'n', 'i'}, '<C-PageDown>', '<Cmd>BufferNext<CR>')

mapkey({'n'}, '|', ':vsplit<CR>', {silent=true})  -- TODO: make <C-|> work
mapkey({'n'}, '-', ':split<CR>',  {silent=true})  -- TODO: make <C--> work

mapkey({'n', 'i'}, '<M-Left>',  nvim_tmux_navigation.NvimTmuxNavigateLeft)
mapkey({'n', 'i'}, '<M-Right>', nvim_tmux_navigation.NvimTmuxNavigateRight)
mapkey({'n', 'i'}, '<M-Up>',    nvim_tmux_navigation.NvimTmuxNavigateUp)
mapkey({'n', 'i'}, '<M-Down>',  nvim_tmux_navigation.NvimTmuxNavigateDown)
mapkey({'n', 'i'}, '<C-b>',     nvimtree.tree.toggle)

