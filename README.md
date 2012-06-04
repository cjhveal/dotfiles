# My Dotfiles
This repository contains my personal configurations.

### INSTALL INSTRUCTIONS
1. Clone repo into <code>~/.dotfiles</code>

  <code>git clone https://cjhveal@github.com/cjhveal/dotfiles.git ~/.dotfiles</code>

2. <code>cd ~/.dotfiles</code>

3. Run rake to install

  <code>rake</code>

4. Change shell to zsh

  <code>chsh -s $(which zsh)</code>

5. Install all vim plugins

  <code>git submodule update --init</code>

6. <code>open ~/.dotfiles/fonts</code> and install all fonts

### Vim Bindings
<pre>
,a - ack
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

\\-[h/j/k/l] - split buffer in direction specified
|-[h/j/k/l] - split window in direction specified
Ctrl-[h/j/k/l] - Move around splits in direction
,, - toggle fullscreen for current buffer
Q - intelligently close window

Ctrl-Up - bubble a line up
Ctrl-Down - bubble a line down

,cf - find git merge conflict markers
,. - find last edit location

,vc - execute current line as a vim command
,vr - execute entire file as vim command

,ss - toggle spellcheck
,sn - find next spelling errror
,sp - find previous spelling error
,sa - add word to dictionary
,s? - suggest a correction

,cd - change directory to the current file
,d - diff your changes with original file

sj - expand single-line expression
sk - collapse multi-line expression

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
dd - date (YYYY or YYYY-MM, etc)
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
f{x} - between two characters x

{action}an{text-object} - perform action around next text object
{action}in{text-object} - perform action inside next text object
{action}al{text-object} - perform action around previous text object
{action}il{text-object} - perform action inside previous  text object
</pre>
