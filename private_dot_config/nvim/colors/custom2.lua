

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
local bgDark90  = '#000405'  -- base03 with 90% darker tint TODO: use tint function
local bgDark80  = '#00090b'  -- base03 with 80% darker tint
local bgDark70  = '#000d10'  -- base03 with 70% darker tint
local bgDark60  = '#001116'  -- base03 with 60% darker tint
local bgDark50  = '#00161b'  -- base03 with 50% darker tint
local bgDark40  = '#001a20'  -- base03 with 40% darker tint
local bgDark30  = '#001e26'  -- base03 with 30% darker tint
local bgDark20  = '#00222b'  -- base03 with 20% darker tint
local bgDark10  = '#002731'  -- base03 with 10% darker tint
local bgDefault = base03
local bgLight   = base02
local bgLight10 = '#1a404a'  -- base03 with 10% lighter tint
local bgLight20 = '#33555e'  -- base03 with 20% lighter tint
local bgLight30 = '#4d6b72'  -- base03 with 30% lighter tint
local bgLight40 = '#668086'  -- base03 with 40% lighter tint
local bgLight50 = '#80959b'  -- base03 with 50% lighter tint
local bgLight60 = '#99aaaf'  -- base03 with 60% lighter tint
local bgLight70 = '#b3bfc3'  -- base03 with 70% lighter tint
local bgLight80 = '#ccd5d7'  -- base03 with 80% lighter tint
local bgLight90 = '#e6eaeb'  -- base03 with 90% lighter tint


local fgEmphasize  = base1
local fgDefault    = base0
local fgUnderstate = base01


-- Clear existing highlights
vim.cmd("hi clear")

-- Builtin Highlight Groups (:help highlight-groups) --
-------------------------------------------------------
vim.api.nvim_set_hl(0, 'ColorColumn', {bg=bgLight})
vim.api.nvim_set_hl(0, 'Conceal',     {fg='#268bd2'})
vim.api.nvim_set_hl(0, 'Search',      {fg=base02, bg=yellow})
vim.api.nvim_set_hl(0, 'IncSearch',   {fg=base02, bg=yellow})
vim.api.nvim_set_hl(0, 'CurSearch',   {fg=base02, bg=orange})

vim.api.nvim_set_hl(0, 'Cursor',      {fg='#fdf6e3', bg='#268bd2'})
vim.api.nvim_set_hl(0, 'lCursor',     {fg='#fdf6e3', bg='#268bd2'})
vim.api.nvim_set_hl(0, 'TermCursor',  {fg='#fdf6e3', bg='#268bd2'})
-- TermCursorNC
-- CursorIM
-- CursorColumn
vim.api.nvim_set_hl(0, 'CursorLine',   {bg=bgLight})
vim.api.nvim_set_hl(0, 'CursorLineNr', {fg=fgDefault, bg=bgLight})
-- CursorLineFold
-- CursorLineSign
-- Directory
vim.api.nvim_set_hl(0, 'DiffAdd',      {fg=green,  bg=bgLight})
vim.api.nvim_set_hl(0, 'DiffChange',   {fg=yellow, bg=bgLight})
vim.api.nvim_set_hl(0, 'DiffDelete',   {fg=red,    bg=bgLight})
-- DiffText
vim.api.nvim_set_hl(0, 'EndOfBuffer',  {fg=bgDefault, bg='NONE'})
-- ErrorMsg
vim.api.nvim_set_hl(0, 'WinSeparator',   {fg=bgDark20, bg=bgDark20})
-- Folded
vim.api.nvim_set_hl(0, 'FoldColumn',   {bg=bgLight})
vim.api.nvim_set_hl(0, 'SignColumn',   {bg=bgLight})
-- Substitute
vim.api.nvim_set_hl(0, 'LineNr',       {fg=fgUnderstate, bg=bgLight})
-- LineNrAbove
-- LineNrBelow
-- MatchParen
-- ModeMsg
-- MsgArea
-- MsgSeparator
-- MoreMsg
-- NonText
vim.api.nvim_set_hl(0, 'Normal',       {fg=fgDefault, bg=bgDefault})
vim.api.nvim_set_hl(0, 'NormalFloat',  {fg=fgDefault, bg=bgLight})
-- FloatBorder
-- FloatTitle
-- NormalNC
vim.api.nvim_set_hl(0, 'Pmenu',    {fg=fgDefault, bg=bgLight})
vim.api.nvim_set_hl(0, 'PmenuSel', {fg=fgDefault, bg=bgLight10})
-- PmenuKind
-- PmenuKindSel
-- PmenuExtra
-- PmenuExtraSel
-- PmenuSbar
-- PmenuThumb
-- Question
-- QuickFixLine
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



-- Standard Syntax Groups (:help group-name) --
-----------------------------------------------
vim.api.nvim_set_hl(0, 'Comment',        {fg=fgUnderstate})
vim.api.nvim_set_hl(0, 'Constant',       {fg=cyan})
vim.api.nvim_set_hl(0, 'String',         {fg=cyan})
vim.api.nvim_set_hl(0, 'Character',      {fg=cyan})
vim.api.nvim_set_hl(0, 'Number',         {fg=cyan})
vim.api.nvim_set_hl(0, 'Boolean',        {fg=cyan})
vim.api.nvim_set_hl(0, 'Float',          {fg=cyan})
vim.api.nvim_set_hl(0, 'Identifier',     {fg=blue})
vim.api.nvim_set_hl(0, 'Function',       {fg=blue})
vim.api.nvim_set_hl(0, 'Statement',      {fg=green})
vim.api.nvim_set_hl(0, 'Conditional',    {fg=green})
vim.api.nvim_set_hl(0, 'Repeat',         {fg=green})
vim.api.nvim_set_hl(0, 'Label',          {fg=green})
vim.api.nvim_set_hl(0, 'Operator',       {fg=green})
vim.api.nvim_set_hl(0, 'Keyword',        {fg=green})
vim.api.nvim_set_hl(0, 'PreProc',        {fg=orange})
vim.api.nvim_set_hl(0, 'Include',        {fg=orange})
vim.api.nvim_set_hl(0, 'Define',         {fg=orange})
vim.api.nvim_set_hl(0, 'Macro',          {fg=orange})
vim.api.nvim_set_hl(0, 'PreCondit',      {fg=orange})
vim.api.nvim_set_hl(0, 'Type',           {fg=yellow})
vim.api.nvim_set_hl(0, 'StorageClass',   {fg=yellow})
vim.api.nvim_set_hl(0, 'Structure',      {fg=yellow})
vim.api.nvim_set_hl(0, 'Typedef',        {fg=yellow})
vim.api.nvim_set_hl(0, 'Special',        {fg=orange})
vim.api.nvim_set_hl(0, 'SpecialChar',    {fg=orange})
vim.api.nvim_set_hl(0, 'Tag',            {fg=orange})
vim.api.nvim_set_hl(0, 'Delimiter',      {fg=orange})
vim.api.nvim_set_hl(0, 'SpecialComment', {fg=orange})
vim.api.nvim_set_hl(0, 'Debug',          {fg=orange})
vim.api.nvim_set_hl(0, 'Underlined',     {fg=violet})
vim.api.nvim_set_hl(0, 'Ignore',         {fg='NONE', bg='NONE'})
-- Error
-- Todo

-- Bufferline Specific Groups --
--------------------------------
vim.api.nvim_set_hl(0, 'BufferLineFill', {bg=bgDark20})

vim.api.nvim_set_hl(0, 'BufferLineCloseButton',         {link='BufferLineBackground'})
vim.api.nvim_set_hl(0, 'BufferLineCloseButtonVisible',  {link='BufferLineBufferVisible'})
vim.api.nvim_set_hl(0, 'BufferLineCloseButtonSelected', {link='BufferLineBufferSelected'})

vim.api.nvim_set_hl(0, 'BufferLineBackground',     {fg=fgUnderstate, bg=bgDark10})
vim.api.nvim_set_hl(0, 'BufferLineBufferVisible',  {fg=fgUnderstate, bg=bgDark10})
vim.api.nvim_set_hl(0, 'BufferLineBufferSelected', {fg=fgEmphasize, bg=bgDefault, bold=true})

vim.api.nvim_set_hl(0, 'BufferLineSeparator',         {fg=bgDark20, bg=bgDark10})
vim.api.nvim_set_hl(0, 'BufferLineSeparatorVisible',  {fg=bgDark20, bg=bgDark10})
vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected', {fg=bgDark20, bg=bgDefault})
vim.api.nvim_set_hl(0, 'BufferLineOffsetSeparator',   {fg=bgDark20, bg=bgDefault})

vim.api.nvim_set_hl(0, 'BufferLineModified',         {fg=fgUnderstate, bg=bgDark10})
vim.api.nvim_set_hl(0, 'BufferLineModifiedVisible',  {fg=fgUnderstate, bg=bgDark10})
vim.api.nvim_set_hl(0, 'BufferLineModifiedSelected', {fg=fgDefault,    bg=bgDefault})

vim.api.nvim_set_hl(0, 'BufferLineDuplicate',         {fg=fgUnderstate, bg=bgDark10})
vim.api.nvim_set_hl(0, 'BufferLineDuplicateVisible',  {fg=fgUnderstate, bg=bgDark10})
vim.api.nvim_set_hl(0, 'BufferLineDuplicateSelected', {fg=fgUnderstate, bg=bgDefault})

-- BufferLineBuffer  -- ???

-- BufferLineError
-- BufferLineErrorVisible             
-- BufferLineErrorSelected            
-- BufferLineErrorDiagnostic          
-- BufferLineErrorDiagnosticVisible   
-- BufferLineErrorDiagnosticSelected  

-- BufferLineWarning
-- BufferLineWarningVisible
-- BufferLineWarningSelected
-- BufferLineWarningDiagnostic
-- BufferLineWarningDiagnosticVisible
-- BufferLineWarningDiagnosticSelected

-- BufferLineInfo
-- BufferLineInfoVisible
-- BufferLineInfoSelected
-- BufferLineInfoDiagnostic
-- BufferLineInfoDiagnosticVisible
-- BufferLineInfoDiagnosticSelected

-- BufferLineHint
-- BufferLineHintVisible
-- BufferLineHintSelected
-- BufferLineHintDiagnostic
-- BufferLineHintDiagnosticVisible
-- BufferLineHintDiagnosticSelected

-- BufferLineDiagnostic
-- BufferLineDiagnosticVisible        
-- BufferLineDiagnosticSelected

-- BufferLineIndicatorVisible
-- BufferLineIndicatorSelected        

-- BufferLineTab
-- BufferLineTabSelected              
-- BufferLineTabClose
-- BufferLineTabSeparator             
-- BufferLineTabSeparatorSelected

-- BufferLinePick
-- BufferLinePickVisible              
-- BufferLinePickSelected             

-- BufferLineNumbers
-- BufferLineNumbersVisible           
-- BufferLineNumbersSelected          

-- BufferLineGroupSeparator           
-- BufferLineGroupLabel               


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
vim.api.nvim_set_hl(0, 'NeoTreeFloatTitle', {fg=blue, bg=bgDark20})
vim.api.nvim_set_hl(0, 'NeoTreeTitleBar', {fg=blue, bg=bgDark20})
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
vim.api.nvim_set_hl(0, 'NeoTreeNormal',    {bg=bgDark20})
vim.api.nvim_set_hl(0, 'NeoTreeNormalNC',  {bg=bgDark20})
-- NeoTreeSignColumn   
-- NeoTreeStatusLine   
-- NeoTreeStatusLineNC 
vim.api.nvim_set_hl(0, 'NeoTreeTabActive',   {link='BufferLineBufferSelected'})
vim.api.nvim_set_hl(0, 'NeoTreeTabInactive', {link='BufferLineBufferVisible'})
vim.api.nvim_set_hl(0, 'NeoTreeTabSeparatorActive',   {link='BufferLineSeparatorSelected'})
vim.api.nvim_set_hl(0, 'NeoTreeTabSeparatorInactive', {link='BufferLineSeparatorVisible'})

-- NeoTreeVertSplit    
vim.api.nvim_set_hl(0, 'NeoTreeWinSeparator', {fg=bgDefault, bg=bgDefault})
vim.api.nvim_set_hl(0, 'NeoTreeEndOfBuffer', {fg=bgDark20, bg=bgDark20})
vim.api.nvim_set_hl(0, 'NeoTreeRootName',    {bg=bgDark20})
-- NeoTreeSymbolicLinkT
-- NeoTreeWindowsHidden

-- LuaLine Specific Groups --
-----------------------------
vim.api.nvim_set_hl(0, 'LualineWinbarActive_b',   {fg=bgLight,   bg=bgLight})
vim.api.nvim_set_hl(0, 'LualineWinbarActive_c',   {fg=fgDefault, bg=bgDefault})
vim.api.nvim_set_hl(0, 'LualineWinbarActive_x',   {fg=fgDefault, bg=bgDefault})
vim.api.nvim_set_hl(0, 'LualineWinbarInactive_c', {fg=fgDefault, bg=bgDefault})
vim.api.nvim_set_hl(0, 'LualineWinbarInactive_x', {fg=fgDefault, bg=bgDefault})


-- IndentBlankline Specific Groups (:help indent-blankline-highlights) --
-------------------------------------------------------------------------
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', {fg=bgLight})

-- Incline Floating Winbar Specific Groups (:help incline-config-highlight) --
------------------------------------------------------------------------------
vim.api.nvim_set_hl(0, 'InclineNormal',   {fg=fgUnderstate, bg=bgDefault})
vim.api.nvim_set_hl(0, 'InclineNormalNC', {fg=fgUnderstate, bg=bgDefault})
