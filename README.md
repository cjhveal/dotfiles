# My Dotfiles
This repository contains my personal configurations.

### INSTALL INSTRUCTIONS
Run the following in your shell:

  `git clone https://github.com/cjhveal/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && rake install`

### Updating
Run `rake` in the `.dotfiles` directory.

### Uninstalling
Run `rake uninstall` in the `.dotfiles` directory.

### Vim Bindings
    ,n - open up filetree
    ,p - fuzzy find a file
    ,b - fuzzy find an open buffer
    ,fm - fuzzy find rails models
    ,fc - fuzzy find rails controllers
    ,fv - fuzzy find rails views
    ,fh - fuzzy find rails helpers
    ,fl - fuzzy find lib files
    ,fs - fuzzy find spec files
    ,fC - fuzzy find config files
    gf - open file related to cursor location

    \-[h/j/k/l] - split window in direction specified
    |-[h/j/k/l] - split tab in direction specified
    Ctrl-[h/j/k/l] - Move around splits in direction
    ,z - toggle fullscreen for current window
    ;w; - save file
    Q - intelligently close window

    ,rr - rails related file
    ,ra - rails alternate file
    ,rp - extract selected lines into partial
    ,rct - generate tags for rails app

    \\ - toggle commenting
    \\u - uncomment current line and all adjacent comments

    crl - toggle word between singular/plural form
    crt - toggle word between Class and tables form
    crs - coerce word to snake_case
    crm - coerce word to MixedCase
    cru - coerce word to UPPER_CASE
    crc - coerce word to camelCase

    ,a/ - align on pattern
    ,as - align on symbols
    ,ah - align a hash
    ,ac - align into chunks
    ,ao - align options hashes
    ,a<space> - quick tabularize

    g/ - Ack for pattern
    g* - Ack for word under cursor
    ga - Ack and append to list

    ,<space> - clear search highlighting
    ,? - open last search in quickfix

    gn - view next quickfix match
    gp - view previous quickfix match
    gq - close quickfix list
    gl - show quickfix list

    ,tp - toggle paste mode
    ,tn - toggle line numbers
    ,ig - toggle indent guides

    ,u - open undo tree
    ,tt - open tagbar list

    ,cf - find git merge conflict markers
    ,. - find last edit location

    ,gb - open godoc in browser
    ,gd - open godoc in vim
    ,ge - rename symbol
    ,gs - check interface implementations

    ,vc - execute current line as a vim command
    ,ve - execute entire file as vim command
    ,vr - reload vimrc file

    ,mt - Toggles ShowMarks on and off.
    ,mh - Hides an individual mark.
    ,ma - Hides all marks in the current buffer.
    ,mm - Places the next available mark.

    ,ss - toggle spellcheck
    ,sn - find next spelling errror
    ,sp - find previous spelling error
    ,sa - add word to dictionary
    ,s? - suggest a correction

    ,ct - generate ctags for current dir
    ,cd - change directory to the current file
    ,d - diff your changes with original file

    sj - expand single-line expression
    sk - collapse multi-line expression

    ds - delete surrounding
    cs - change surrounding
    ys - wrap with surrounding
    yS - wrap with surrounding and place on seperate line
    ,# - Surround a word / selection with #{ruby interpolation}
    ," - Surround a word / selection with "quotes"
    ,' - Surround a word / selection with 'single quotes'
    ,( - Surround a word / selection with (parens)
    ,) - Surround a word / selection with ( parens )
    ,[ - Surround a word / selection with [brackets]
    ,] - Surround a word / selection with [ brackets ]
    ,{ - Surround a word / selection with {braces}
    ,} - Surround a word / selection with { braces }

    text-objects:
    c - comment
    / - match to last search forward
    ? - match to last search backward
    da - any datetime object
    df - full date and time
    dd - date (YYYY or YYYY-MM, etc) 1992-05 10:42
    dt - time (HH:MM, etc)
    dz - timezone indicator
    e - entire buffer
    i - indented block of equal or deeper depth (around skips empty lines)
    I - indented block of equal depth (around skips empty lines)
    l - line (inside excludes leading and trailing whitespace)
    k - key (of a key value pair)
    v - value (of a key value pair)
    r - ruby block
    : - ruby symbol
    q - quoted text, wrapped with '/"/(/{
    u - url
    t - html tag block <p>inner</p>
    f{x} - between two characters x

    {action}an{text-object} - perform action around next text object
    {action}in{text-object} - perform action inside next text object
    {action}al{text-object} - perform action around previous text object
    {action}il{text-object} - perform action inside previous text object
