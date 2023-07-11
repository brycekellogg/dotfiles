-- ?????
-- Arguments:
--    ls  = generate LS_COLORS
--    exa = generate EXA_COLORS
--    nil = generate both and print
--

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


--
--
--
local function tintshade(color, amt)
    -- get raw RGB integer values
    local r = tonumber(string.sub(color, 2, 3), 16)
    local g = tonumber(string.sub(color, 4, 5), 16)
    local b = tonumber(string.sub(color, 6, 7), 16)

    -- do the math to perform shade or tint
    if (amt > 0) then -- lighter
        r = math.floor(0.5 + r + ((255 - r) * amt))
        g = math.floor(0.5 + g + ((255 - g) * amt))
        b = math.floor(0.5 + b + ((255 - b) * amt))
    else -- darker
        r = math.floor(0.5 + r * (1 + amt))
        g = math.floor(0.5 + g * (1 + amt))
        b = math.floor(0.5 + b * (1 + amt))
    end

    -- convert back to hex format
    local rStr = string.format('%02x', r)
    local gStr = string.format('%02x', g)
    local bStr = string.format('%02x', b)
    return '#' .. rStr .. gStr .. bStr
end


-- Shades & Tints of Solarized colors --
----------------------------------------
local redLight10 = tintshade(red, 0.10)
local redDark10  = tintshade(red, -0.10)

local blueDark10 = tintshade(blue, -0.05)


local bgDark10  = '#002731'  -- base03 with 10% darker tint

-- ???
local bold      = '01'
local underline = '04'


local lsColorTable = {
    -- Special
    ['di'] = {color=blue},   -- directories
    ['ex'] = {color=green},  -- executable files
    ['fi'] = {color=base0},  -- regular files
    ['pi'] = {color=base0},  -- named pipes
    ['so'] = {color=base0},  -- sockets
    ['bd'] = {color=base0},  -- block devices
    ['cd'] = {color=base0},  -- character devices
    ['ln'] = {color=base0},  -- symlinks
    ['or'] = {color=base0},  -- symlinks with no target

    -- Readme & Markdown
    ['*README']          = {color=yellow, effect=bold},
    ['*README.txt']      = {color=yellow, effect=underline},
    ['*readme.txt']      = {color=yellow, effect=underline},
    ['*.md']             = {color=yellow, effect=bold},
    ['README.md']      = {color=yellow, effect=underline},
    ['*README.markdown'] = {color=yellow, effect=bold},

    -- Scripts (bash, etc)
    ['*.sh'] = {color=tintshade(green, 0.30)},

    -- ???
    ['*.tex']       = {color=red, effect=bold},
    ['*.rdf']       = {color=red, effect=bold},
    ['*.owl']       = {color=red, effect=bold},
    ['*.n3']        = {color=red, effect=bold},
    ['*.ttl']       = {color=red, effect=bold},
    ['*.nt']        = {color=red, effect=bold},
    ['*.torrent']   = {color=red, effect=bold},
    ['*.xml']       = {color=red, effect=bold},
    ['*Makefile']   = {color=red, effect=bold},
    ['*Rakefile']   = {color=red, effect=bold},
    ['*Dockerfile'] = {color=red, effect=bold},
    ['*build.xml']  = {color=red, effect=bold},
    ['*rc']         = {color=red, effect=bold},
    ['*1']          = {color=red, effect=bold},
    ['*.nfo']       = {color=red, effect=bold},

    -- Source code files
    ['*.h']    = {color=red, effect=bold},
    ['*.hpp']  = {color=red, effect=bold},
    ['*.c']    = {color=red, effect=bold},
    ['*.cpp']  = {color=red, effect=bold},
    ['*.cxx']  = {color=red, effect=bold},
    ['*.cc']   = {color=red, effect=bold},
    ['*.objc'] = {color=red, effect=bold},
    ['*.go']   = {color=red, effect=bold},
    ['*.py']   = {color=tintshade(green, 0.30)},
    ['*.lua']  = {color=tintshade(green, 0.30)},

    -- Configuration files
    ['*.ini']    = {color=base0, effect=bold},
    ['*.yml']    = {color=base0, effect=bold},
    ['*.cfg']    = {color=base0, effect=bold},
    ['*.conf']   = {color=base0, effect=bold},
    ['*.sqlite'] = {color=base0, effect=bold},
    ['*.sql']    = {color=base0, effect=bold},
    ['*.csv']    = {color=base0, effect=bold},

    -- unimportant files (logs, backups, etc)
    ['*.log']   = {color = base01},
    ['*.bak']   = {color = base01},
    ['*.aux']   = {color = base01},
    ['*.lof']   = {color = base01},
    ['*.lol']   = {color = base01},
    ['*.lot']   = {color = base01},
    ['*.out']   = {color = base01},
    ['*.toc']   = {color = base01},
    ['*.bbl']   = {color = base01},
    ['*.blg']   = {color = base01},
    ['*~']      = {color = base01},
    ['*#']      = {color = base01},
    ['*.part']  = {color = base01},
    ['*.swp']   = {color = base01},
    ['*.tmp']   = {color = base01},
    ['*.temp']  = {color = base01},
    ['*.o']     = {color = base01},
    ['*.pyc']   = {color = base01},
    ['*.class'] = {color = base01},
    ['*.cache'] = {color = base01},
    ['*.incomplete'] = {color = base01},

    -- Archives & compressed files
    ['*.tar']  = {color = orange},
    ['*.tgz']  = {color = orange, effect = bold},
    ['*.arj']  = {color = orange, effect = bold},
    ['*.taz']  = {color = orange, effect = bold},
    ['*.lzh']  = {color = orange, effect = bold},
    ['*.lzma'] = {color = orange, effect = bold},
    ['*.tlz']  = {color = orange, effect = bold},
    ['*.txz']  = {color = orange, effect = bold},
    ['*.zip']  = {color = orange, effect = bold},
    ['*.zst']  = {color = orange, effect = bold},
    ['*.z']    = {color = orange, effect = bold},
    ['*.Z']    = {color = orange, effect = bold},
    ['*.dz']   = {color = orange, effect = bold},
    ['*.gz']   = {color = orange, effect = bold},
    ['*.lz']   = {color = orange, effect = bold},
    ['*.xz']   = {color = orange, effect = bold},
    ['*.bz2']  = {color = orange, effect = bold},
    ['*.bz']   = {color = orange, effect = bold},
    ['*.tbz']  = {color = orange, effect = bold},
    ['*.tbz2'] = {color = orange, effect = bold},
    ['*.tz']   = {color = orange, effect = bold},
    ['*.deb']  = {color = orange, effect = bold},
    ['*.rpm']  = {color = orange, effect = bold},
    ['*.jar']  = {color = orange, effect = bold},
    ['*.rar']  = {color = orange, effect = bold},
    ['*.ace']  = {color = orange, effect = bold},
    ['*.zoo']  = {color = orange, effect = bold},
    ['*.cpio'] = {color = orange, effect = bold},
    ['*.7z']   = {color = orange, effect = bold},
    ['*.rz']   = {color = orange, effect = bold},
    ['*.apk']  = {color = orange, effect = bold},
    ['*.gem']  = {color = orange, effect = bold},

    -- Image formats
    ['*.jpg']  = {color = violet},
    ['*.JPG']  = {color = violet},
    ['*.jpeg'] = {color = violet},
    ['*.gif']  = {color = violet},
    ['*.bmp']  = {color = violet},
    ['*.pbm']  = {color = violet},
    ['*.pgm']  = {color = violet},
    ['*.ppm']  = {color = violet},
    ['*.tga']  = {color = violet},
    ['*.xbm']  = {color = violet},
    ['*.xpm']  = {color = violet},
    ['*.tif']  = {color = violet},
    ['*.tiff'] = {color = violet},
    ['*.png']  = {color = violet},
    ['*.PNG']  = {color = violet},
    ['*.svg']  = {color = violet},
    ['*.svgz'] = {color = violet},
    ['*.mng']  = {color = violet},
    ['*.pcx']  = {color = violet},
    ['*.dl']   = {color = violet},
    ['*.xcf']  = {color = violet},
    ['*.xwd']  = {color = violet},
    ['*.yuv']  = {color = violet},
    ['*.cgm']  = {color = violet},
    ['*.emf']  = {color = violet},
    ['*.eps']  = {color = violet},
    ['*.CR2']  = {color = violet},
    ['*.ico']  = {color = violet},
    ['*.nef']  = {color = violet},
    ['*.NEF']  = {color = violet},
    ['*.webp'] = {color = violet},

    --         [// Audio & video formats
    ['*.aac']  = {color = magenta},
    ['*.au']   = {color = magenta},
    ['*.flac'] = {color = magenta},
    ['*.mid']  = {color = magenta},
    ['*.midi'] = {color = magenta},
    ['*.mka']  = {color = magenta},
    ['*.mp3']  = {color = magenta},
    ['*.mpc']  = {color = magenta},
    ['*.ogg']  = {color = magenta},
    ['*.opus'] = {color = magenta},
    ['*.ra']   = {color = magenta},
    ['*.wav']  = {color = magenta},
    ['*.m4a']  = {color = magenta},
    ['*.axa']  = {color = magenta},
    ['*.oga']  = {color = magenta},
    ['*.spx']  = {color = magenta},
    ['*.xspf'] = {color = magenta},
    ['*.mov']  = {color = magenta, effect = bold},
    ['*.MOV']  = {color = magenta, effect = bold},
    ['*.mpg']  = {color = magenta, effect = bold},
    ['*.mpeg'] = {color = magenta, effect = bold},
    ['*.m2v']  = {color = magenta, effect = bold},
    ['*.mkv']  = {color = magenta, effect = bold},
    ['*.ogm']  = {color = magenta, effect = bold},
    ['*.mp4']  = {color = magenta, effect = bold},
    ['*.m4v']  = {color = magenta, effect = bold},
    ['*.mp4v'] = {color = magenta, effect = bold},
    ['*.vob']  = {color = magenta, effect = bold},
    ['*.qt']   = {color = magenta, effect = bold},
    ['*.nuv']  = {color = magenta, effect = bold},
    ['*.wmv']  = {color = magenta, effect = bold},
    ['*.asf']  = {color = magenta, effect = bold},
    ['*.rm']   = {color = magenta, effect = bold},
    ['*.rmvb'] = {color = magenta, effect = bold},
    ['*.flc']  = {color = magenta, effect = bold},
    ['*.avi']  = {color = magenta, effect = bold},
    ['*.fli']  = {color = magenta, effect = bold},
    ['*.flv']  = {color = magenta, effect = bold},
    ['*.gl']   = {color = magenta, effect = bold},
    ['*.m2ts'] = {color = magenta, effect = bold},
    ['*.divx'] = {color = magenta, effect = bold},
    ['*.webm'] = {color = magenta, effect = bold},
    ['*.axv']  = {color = magenta, effect = bold},
    ['*.anx']  = {color = magenta, effect = bold},
    ['*.ogv']  = {color = magenta, effect = bold},
    ['*.ogx']  = {color = magenta, effect = bold}
}


local exaColorTable = {
       -- ur     the user-read permission bit
       -- uw     the user-write permission bit
       -- ux     the user-execute permission bit for regular files
       -- ue     the user-execute for other file kinds
       -- gr     the group-read permission bit
       -- gw     the group-write permission bit
       -- gx     the group-execute permission bit
       -- tr     the others-read permission bit
       -- tw     the others-write permission bit
       -- tx     the others-execute permission bit
       -- su     setuid, setgid, and sticky permission bits for files
       -- sf     setuid, setgid, and sticky for other file kinds
       -- xa     the extended attribute indicator
       -- sn     the numbers of a file’s size (sets nb, nk, nm, ng and nh)
       -- nb     the numbers of a file’s size if it is lower than 1 KB/Kib
       -- nk     the numbers of a file’s size if it is between 1 KB/KiB and 1 MB/MiB
       -- nm     the numbers of a file’s size if it is between 1 MB/MiB and 1 GB/GiB
       -- ng     the numbers of a file’s size if it is between 1 GB/GiB and 1 TB/TiB
       -- nt     the numbers of a file’s size if it is 1 TB/TiB or higher
       -- sb     the units of a file’s size (sets ub, uk, um, ug and uh)
       -- ub     the units of a file’s size if it is lower than 1 KB/Kib
       -- uk     the units of a file’s size if it is between 1 KB/KiB and 1 MB/MiB
       -- um     the units of a file’s size if it is between 1 MB/MiB and 1 GB/GiB
       -- ug     the units of a file’s size if it is between 1 GB/GiB and 1 TB/TiB
       -- ut     the units of a file’s size if it is 1 TB/TiB or higher
       -- df     a device’s major ID
       -- ds     a device’s minor ID
       -- uu     a user that’s you
       -- un     a user that’s someone else
       -- gu     a group that you belong to
       -- gn     a group you aren’t a member of
       -- lc     a number of hard links
       -- lm     a number of hard links for a regular file with at least two
       -- ga     a new flag in Git
       -- gm     a modified flag in Git
       -- gd     a deleted flag in Git
       -- gv     a renamed flag in Git
       -- gt     a modified metadata flag in Git
       -- xx     “punctuation”, including many background UI elements
    ['da'] = {color = base01},  -- a file’s date
       -- in     a file’s inode number
       -- bl     a file’s number of blocks
       -- hd     the header row of a table
       -- lp     the path of a symlink
       -- cc     an escaped character in a filename
       -- bO     the overlay style for broken symlink paths
}


-- ????
local function buildOutput(input)
    local output = {}
    for glob,v in pairs(input) do
        local effect = v.effect or '00'
        local r = tonumber(string.sub(v.color, 2, 3), 16)
        local g = tonumber(string.sub(v.color, 4, 5), 16)
        local b = tonumber(string.sub(v.color, 6, 7), 16)
        local color = r..';'..g..';'..b
        output[#output + 1] = glob .. '=' .. effect .. ';38;2;' .. color
    end
    return table.concat(output, ':')
end


-- ??????
if (not arg[1] or arg[1] == 'ls')  then print(buildOutput(lsColorTable))  end
if (not arg[1] or arg[1] == 'exa') then print(buildOutput(exaColorTable)) end
