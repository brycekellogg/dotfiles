-- ???
--
-- ???
-- ???
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.o.background = 'dark'

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

-- Hide Status Line
--
-- We hide the status line initially, then
-- configure it to be shown when we load the
-- actual status line is loaded
vim.o.laststatus = 0

-- Tab settings
--
-- A tab should be shown as 4 spaces, and
-- any time a tab in inserted, replace
-- with 4 spaces instead.
vim.o.expandtab = 1
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Split below and right
vim.o.splitbelow = 1
vim.o.splitright = 1

-- Fix C indentation for switch
--
-- The default indent action for switch statements
-- in C makes me want to gouge out my eyeballs.
vim.o.cinoptions = 'l1'


-- Enable Hidden Buffers
--
-- Allow us to have unsaved hidden buffers which act
-- similar to how tabs in other editors are used.
vim.o.hidden = 1

-- Cursor ccrolling offset
-- Vim uses this setting to decide when to scroll
-- a window as the cursor approaches the top or
-- bottom of the screen. This is the number of
-- lines away from the edge at which vim will scroll.
vim.o.scrolloff=5

-- Auto resize windows
--
-- The VimResized event occurs "After the Vim window was resized". We use
-- that to run the command to redestribute all the window borders. This
-- allows zooming when using tmux to play nice with vim.
vim.api.nvim_create_autocmd({"VimResized"}, {pattern = '*', command = "wincmd ="})


-- Configure clipboard
--
-- Because WSL now supports xsel & xclip,
-- we only need to set the clipboard register
vim.o.clipboard = 'unnamedplus'

-- Bootstrap lasy.nvim plugin manager. This should install
-- it when vim is first run if it's not already installed.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require('lazy').setup('plugins')


-- Custom Filetypes (see :help vim.filetype.add)
vim.filetype.add({
    pattern = {
        ['.*%.lua%.tmpl'] = 'lua',
        ['.*%.fish%.tmpl'] = 'fish',
        ['.*%.sh%.tmpl'] = 'bash',
        ['.*/git/config%.tmpl'] = 'gitconfig',
    },
    filename = {
        ['tmux.conf.tmpl'] = 'tmux',
    },
})



-- Hiding UI elements when focus lost
--
-- This option creates a slightly lighter background line
-- for the line the cursor is on and a similarly lighter
-- column at 80 & 120 characters. These should only show
-- up in the currently active window.
local function hide()
    vim.opt.colorcolumn = ''
    vim.opt.cursorline  = false
end
local function unhide()
    if vim.bo.filetype ~= 'alpha' then  -- no colorcolumn on starting screen
        vim.opt.colorcolumn = '80,120'
    end
    vim.opt.cursorline  = true
end
vim.api.nvim_create_autocmd({'WinLeave', 'FocusLost'},   {callback=hide})
vim.api.nvim_create_autocmd({'WinEnter', 'FocusGained', 'BufEnter'}, {callback=unhide})



-- Place Cursor on line 5 be default
-- TODO: shouldn't happen on git commit
local function setCursor()
    local target = 5
    local bufferLen = vim.api.nvim_buf_line_count(0)

    -- skip vertain filetypes
    if vim.bo.filetype == 'gitcommit' then return end

    -- change target if buffer too small
    if bufferLen < target then
        target = bufferLen
    end

    -- set cursor position
    vim.api.nvim_win_set_cursor(0, {target,0})
end
vim.api.nvim_create_autocmd({'BufReadPost'},   {callback=setCursor})

--
--
vim.opt.termguicolors = true

-- Set the colorscheme using a autocmd
--
-- We want to always set the colorscheme after loading plugins and
-- starting vim. Nested is needed for the status line at the
-- bottom to work correctly.
vim.api.nvim_create_autocmd({"VimEnter"}, {nested=true, pattern='*', command="colorscheme custom2"})


-- Configure Tmux Navigation
local nvim_tmux_navigation = require('nvim-tmux-navigation')
nvim_tmux_navigation.setup {
    disable_when_zoomed = true,
}


-- Killing Windows
function killWindow()
    vim.api.nvim_win_close(0, false)
end


-- Key Map
--
-- First Arg: mode
-- Second Arg: keycode
-- Third Arg: action
local mapkey = vim.keymap.set
mapkey({'n'},      '<C-x>', killWindow)
mapkey({'n', 'i'}, '<C-PageUp>',   '<Cmd>BufferLineCyclePrev<CR>')
mapkey({'n', 'i'}, '<C-PageDown>', '<Cmd>BufferLineCycleNext<CR>')
mapkey({'n'}, '|', ':vsplit<CR>', {silent=true})  -- TODO: make <C-|> work
mapkey({'n'}, '-', ':split<CR>',  {silent=true})  -- TODO: make <C--> work
mapkey({'n', 'i'}, '<M-Left>',  nvim_tmux_navigation.NvimTmuxNavigateLeft)
mapkey({'n', 'i'}, '<M-Right>', nvim_tmux_navigation.NvimTmuxNavigateRight)
mapkey({'n', 'i'}, '<M-Up>',    nvim_tmux_navigation.NvimTmuxNavigateUp)
mapkey({'n', 'i'}, '<M-Down>',  nvim_tmux_navigation.NvimTmuxNavigateDown)
