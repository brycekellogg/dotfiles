




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

-- Solarized Osaka Colors
local base04_osaka     = '#00141a'
local base0_osaka      = '#9eacad'
local base1_osaka      = '#adb8b8'
local base4_osaka      = '#ffffff'
local green900_osaka   = '#2c3300'
local green700_osaka   = '#596600'
local green500_osaka   = '#859900'
local green300_osaka   = '#bafb00'
local green100_osaka   = '#d6ffac'
local cyan100_osaka    = '#B9FFFA'
local cyan300_osaka    = '#29EEDF'
local cyan500_osaka    = '#2AA198'
local cyan700_osaka    = '#1A6265'
local cyan900_osaka    = '#103B3D'
local blue100_osaka    = '#AADCFF'
local blue300_osaka    = '#49AEF5'
local blue500_osaka    = '#268BD2'
local blue700_osaka    = '#1B6497'
local blue900_osaka    = '#103956'
local violet100_osaka  = '#CCCFFF'
local violet300_osaka  = '#9CA0ED'
local violet500_osaka  = '#6C71C4'
local violet700_osaka  = '#494FB6'
local violet900_osaka  = '#25285B'
local magenta100_osaka = '#FF77B9'
local magenta300_osaka = '#F255A1'
local magenta500_osaka = '#D33682'
local magenta700_osaka = '#B02669'
local magenta900_osaka = '#541232'
local red100_osaka     = '#FF9D9B'
local red300_osaka     = '#F6524F'
local red500_osaka     = '#DC322F'
local red700_osaka     = '#B7211F'
local red900_osaka     = '#57100F'
local orange100_osaka  = '#FF9468'
local orange300_osaka  = '#F8520E'
local orange500_osaka  = '#CB4B16'
local orange700_osaka  = '#A13C11'
local orange900_osaka  = '#5C220A'
local yellow100_osaka  = '#FFE999'
local yellow300_osaka  = '#FFC100'
local yellow500_osaka  = '#B58900'
local yellow700_osaka  = '#664D00'
local yellow900_osaka  = '#332700'

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
local fgDefault    = base0_osaka
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
vim.api.nvim_set_hl(0, 'Added',        {link="DiffAdd"})
vim.api.nvim_set_hl(0, 'Changed',      {link="DiffChange"})
vim.api.nvim_set_hl(0, 'Removed',      {link="DiffDelete"})
vim.api.nvim_set_hl(0, 'DiffAdd',      {fg=green,  bg=bgLight})
vim.api.nvim_set_hl(0, 'DiffChange',   {fg=yellow, bg=bgLight})
vim.api.nvim_set_hl(0, 'DiffDelete',   {fg=red,    bg=bgLight})
-- DiffText
vim.api.nvim_set_hl(0, 'EndOfBuffer',  {fg=bgDefault, bg='NONE'})
vim.api.nvim_set_hl(0, 'ErrorMsg',     {fg=red, bg='None'})
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
vim.api.nvim_set_hl(0, 'NonText',      {link="Comment"})
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
vim.api.nvim_set_hl(0, 'Visual', {fg=base02, bg=bgLight30})
-- VisualNOS
vim.api.nvim_set_hl(0, 'WarningMsg', {fg=orange})
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


-- Treesitter Highlight Groups (:help treesitter-highlight-groups) --
---------------------------------------------------------------------
vim.api.nvim_set_hl(0, '@string.documentation', {link='Comment'})
vim.api.nvim_set_hl(0, '@variable', {fg=fgDefault})

vim.api.nvim_set_hl(0, '@constant.bash',         {link='Special'})
vim.api.nvim_set_hl(0, '@function.builtin.bash', {link='Function'})


-- LSP Diagnostics Groups (:help diagnostic-highlights) --
----------------------------------------------------------

vim.api.nvim_set_hl(0, 'DiagnosticError', {fg=red})
-- DiagnosticWarn
-- DiagnosticInfo
-- DiagnosticHint
-- DiagnosticOk
-- DiagnosticVirtualTextError
-- DiagnosticVirtualTextWarn
-- DiagnosticVirtualTextInfo
-- DiagnosticVirtualTextHint
-- DiagnosticVirtualTextOk
-- DiagnosticUnderlineError
-- DiagnosticUnderlineWarn
-- DiagnosticUnderlineInfo
-- DiagnosticUnderlineHint
-- DiagnosticUnderlineOk
-- DiagnosticFloatingError
-- DiagnosticFloatingWarn
-- DiagnosticFloatingInfo
-- DiagnosticFloatingHint
-- DiagnosticFloatingOk
vim.api.nvim_set_hl(0, 'DiagnosticSignError', {link='DiagnosticError'})
-- DiagnosticSignWarn
-- DiagnosticSignInfo
-- DiagnosticSignHint
-- DiagnosticSignOk
-- DiagnosticDeprecated
-- DiagnosticUnnecessary



-- Bufferline Specific Groups --
--------------------------------
vim.api.nvim_set_hl(0, 'BufferLineFill', {bg=bgDark30})

vim.api.nvim_set_hl(0, 'BufferLineCloseButton',         {link='BufferLineBackground'})
vim.api.nvim_set_hl(0, 'BufferLineCloseButtonVisible',  {link='BufferLineBufferVisible'})
vim.api.nvim_set_hl(0, 'BufferLineCloseButtonSelected', {link='BufferLineBufferSelected'})

vim.api.nvim_set_hl(0, 'BufferLineBackground',     {fg=fgUnderstate, bg=bgDark20})
vim.api.nvim_set_hl(0, 'BufferLineBufferVisible',  {fg=fgUnderstate, bg=bgDark20})
vim.api.nvim_set_hl(0, 'BufferLineBufferSelected', {fg=fgEmphasize, bg=bgDefault, bold=true})

vim.api.nvim_set_hl(0, 'BufferLineSeparator',         {fg=bgDark30, bg=bgDark20})
vim.api.nvim_set_hl(0, 'BufferLineSeparatorVisible',  {fg=bgDark30, bg=bgDark20})
vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected', {fg=bgDark30, bg=bgDefault})
vim.api.nvim_set_hl(0, 'BufferLineOffsetSeparator',   {fg=bgDark30, bg=bgDefault})

vim.api.nvim_set_hl(0, 'BufferLineModified',         {fg=fgUnderstate, bg=bgDark20})
vim.api.nvim_set_hl(0, 'BufferLineModifiedVisible',  {fg=fgUnderstate, bg=bgDark20})
vim.api.nvim_set_hl(0, 'BufferLineModifiedSelected', {fg=fgDefault,    bg=bgDefault})

vim.api.nvim_set_hl(0, 'BufferLineDuplicate',         {fg=fgUnderstate, bg=bgDark20})
vim.api.nvim_set_hl(0, 'BufferLineDuplicateVisible',  {fg=fgUnderstate, bg=bgDark20})
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

vim.api.nvim_set_hl(0, 'BufferLineTab',                  {link='BufferLineBufferVisible'})
vim.api.nvim_set_hl(0, 'BufferLineTabSelected',          {link='BufferLineBufferSelected'})
vim.api.nvim_set_hl(0, 'BufferLineTabClose',             {fg=fgUnderstate, bg=bgDark30})
vim.api.nvim_set_hl(0, 'BufferLineTabSeparator',         {link='BufferLineSeparator'})
vim.api.nvim_set_hl(0, 'BufferLineTabSeparatorSelected', {link='BufferLineSeparatorSelected'})

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
vim.api.nvim_set_hl(0, 'NeoTreeGitAdded', {fg=green, bg="NONE"})
-- NeoTreeGitConflict  
-- NeoTreeGitDeleted   
-- NeoTreeGitIgnored   
vim.api.nvim_set_hl(0, 'NeoTreeGitModified', {fg=red, bg="NONE"})
vim.api.nvim_set_hl(0, 'NeoTreeGitUnstaged', {fg=red, bg="NONE"})
vim.api.nvim_set_hl(0, 'NeoTreeGitUntracked', {fg=orange, bg="NONE"})
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
vim.api.nvim_set_hl(0, 'NeoTreeRootName',    {link='NeoTreeDirectoryName'})
-- NeoTreeSymbolicLinkT
-- NeoTreeWindowsHidden

-- LuaLine Specific Groups --
-----------------------------
vim.api.nvim_set_hl(0, 'LualineWinbarActive_b',   {fg=bgLight,   bg=bgLight})
vim.api.nvim_set_hl(0, 'LualineWinbarActive_c',   {fg=fgDefault, bg=bgDefault})
vim.api.nvim_set_hl(0, 'LualineWinbarActive_x',   {fg=fgDefault, bg=bgDefault})
vim.api.nvim_set_hl(0, 'LualineWinbarInactive_c', {fg=fgDefault, bg=bgDefault})
vim.api.nvim_set_hl(0, 'LualineWinbarInactive_x', {fg=fgDefault, bg=bgDefault})


-- IndentBlankline Specific Groups (:help ibl.highlights) --
------------------------------------------------------------
vim.api.nvim_set_hl(0, 'IblIndent', {fg=bgLight})


-- Incline Floating Winbar Specific Groups (:help incline-config-highlight) --
------------------------------------------------------------------------------
vim.api.nvim_set_hl(0, 'InclineNormal',   {fg=fgUnderstate, bg=bgDefault})
vim.api.nvim_set_hl(0, 'InclineNormalNC', {fg=fgUnderstate, bg=bgDefault})


-- VisualWhitespace Specific Groups ---
---------------------------------------
vim.api.nvim_set_hl(0, 'VisualNonText', {fg=bgLight20, bg=bgLight30})

