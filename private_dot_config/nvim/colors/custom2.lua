

-- Solarized Colors
local base03  = '#002b36'
local base02  = '#073642'
local base01  = '#586e75'
local base00  = '#657b83'
local base0   = '#839496'
local base1   = '#93a1a1'
local base2   = '#eee8d5'
local base3   = '#fdf6e3'
local yellow  = '#b58900'
local orange  = '#cb4b16'
local red     = '#dc322f'
local magenta = '#d33682'
local violet  = '#6c71c4'
local blue    = '#268bd2'
local cyan    = '#2aa198'
local green   = '#859900'

-- Color definitions
local bgDark    = '#00171d'
local bgDefault = base03
local bgLight   = base02
local bgSearch  = yellow

local fgDefault    = base0
local fgUnderstate = base01
local fgSearch     = base02


-- Clear existing highlights
vim.cmd("hi clear")

-- Builtin Highlight Groups (:help highlight-groups)
vim.api.nvim_set_hl(0, 'ColorColumn',  {bg=bgLight})
-- Conceal
vim.api.nvim_set_hl(0, 'CurSearch',  {fg=fgSearch, bg=orange})
-- Cursor
-- lCursor
-- CursorIM
-- CursorColumn
vim.api.nvim_set_hl(0, 'CursorLine',   {bg=bgLight})
-- Directory
vim.api.nvim_set_hl(0, 'DiffAdd',      {fg=green,  bg=bgLight})
vim.api.nvim_set_hl(0, 'DiffChange',   {fg=yellow, bg=bgLight})
vim.api.nvim_set_hl(0, 'DiffDelete',   {fg=red,    bg=bgLight})
-- DiffText
vim.api.nvim_set_hl(0, 'EndOfBuffer',  {fg=bgDefault, bg=bgDefault})
-- TermCursor
-- TermCursorNC
-- ErrorMsg
vim.api.nvim_set_hl(0, 'WinSeparator',   {bg=bgLight})
-- Folded
vim.api.nvim_set_hl(0, 'FoldColumn',   {bg=bgLight})
vim.api.nvim_set_hl(0, 'SignColumn',   {bg=bgLight})
vim.api.nvim_set_hl(0, 'IncSearch',  {fg=fgSearch, bg=bgSearch})
-- Substitute
vim.api.nvim_set_hl(0, 'LineNr',       {fg=fgUnderstate, bg=bgLight})
-- LineNrAbove
-- LineNrBelow
vim.api.nvim_set_hl(0, 'CursorLineNr', {fg=fgDefault, bg=bgLight})
-- CursorLineFold
-- CursorLineSign
-- MatchParen
-- ModeMsg
-- MsgArea
-- MsgSeparator
-- MoreMsg
-- NonText
vim.api.nvim_set_hl(0, 'Normal',       {fg=fgDefault, bg=bgDefault})
-- NormalFloat
-- FloatBorder
-- FloatTitle
-- NormalNC
-- Pmenu
-- PmenuSel
-- PmenuKind
-- PmenuKindSel
-- PmenuExtra
-- PmenuExtraSel
-- PmenuSbar
-- PmenuThumb
-- Question
-- QuickFixLine
vim.api.nvim_set_hl(0, 'Search',  {fg=fgSearch, bg=bgSearch})
-- SpecialKey
-- SpellBad
-- SpellCap
-- SpellLocal
-- SpellRare
-- StatusLine
-- StatusLineNC
-- TabLine
-- TabLineFill
-- TabLineSel
-- Title
-- Visual
-- VisualNOS
-- WarningMsg
-- Whitespace
-- WildMenu
-- WinBar
-- WinBarNC
-- User1
-- User2
-- User3
-- User4
-- User5
-- User6
-- User7
-- User8
-- User9


-- CommandMode



-- Standard Syntax Groups (:help group-name)
vim.api.nvim_set_hl(0, 'Comment',     {fg=fgUnderstate})
vim.api.nvim_set_hl(0, 'Constant',    {fg=cyan})
-- String
-- Character
-- Number
-- Boolean
-- Float
vim.api.nvim_set_hl(0, 'Identifier',  {fg=blue})
vim.api.nvim_set_hl(0, 'Function',    {fg=blue})
-- Statement
-- Conditional
-- Repeat
-- Label
-- Operator
vim.api.nvim_set_hl(0, 'Keyword',     {fg=green})
-- 

-- Bufferline Specific Groups
-- vim.api.nvim_set_hl(0, 'BufferLineBackground', {bg=red})
-- BufferLineFill - uses tint(Normal bg)
-- BufferLineOffsetSeparator - uses same as Fill



-- NeoTree Specific Groups (:help neo-tree-highlights) --
---------------------------------------------------------
-- NeoTreeBufferNumber
-- NeoTreeCursorLine
-- NeoTreeDimText
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', {fg=blue})  -- TODO: use LS_COLORS
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', {fg=blue})  -- TODO: use LS_COLORS
-- NeoTreeDotfile
-- NeoTreeFileIcon
-- NeoTreeFileName
-- NeoTreeFileNameOpene
-- NeoTreeFilterTerm
-- NeoTreeFloatBorder
-- NeoTreeFloatTitle
-- NeoTreeTitleBar
-- NeoTreeGitAdded
-- NeoTreeGitConflict  
-- NeoTreeGitDeleted   
-- NeoTreeGitIgnored   
vim.api.nvim_set_hl(0, 'NeoTreeGitModified', {fg=orange, bg="NONE"})
-- NeoTreeGitUnstaged
-- NeoTreeGitUntracked
-- NeoTreeGitStaged
-- NeoTreeHiddenByName
-- NeoTreeIndentMarker
-- NeoTreeExpander
vim.api.nvim_set_hl(0, 'NeoTreeNormal',    {bg=bgDark})
vim.api.nvim_set_hl(0, 'NeoTreeNormalNC',  {bg=bgDark})
-- NeoTreeSignColumn   
-- NeoTreeStatusLine   
-- NeoTreeStatusLineNC 
-- NeoTreeVertSplit    
vim.api.nvim_set_hl(0, 'NeoTreeWinSeparator', {fg=bgDefault, bg=bgDefault})
vim.api.nvim_set_hl(0, 'NeoTreeEndOfBuffer', {fg=bgDark, bg=bgDark})
vim.api.nvim_set_hl(0, 'NeoTreeRootName',    {bg=bgDark})
-- NeoTreeSymbolicLinkT
-- NeoTreeWindowsHidden
