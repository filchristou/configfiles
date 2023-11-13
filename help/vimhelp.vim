"Comment/UNcomment : using visual block Cntr-q , selecting , then Shift i, the Esc Esc
"to paste afte delete : "0p --> paste from non-volatile yank register 0 instead of default volatile
"Ctrl-t --> Tab line Ctrl-D -->Detab line . Insert mode. For normal mode : >> <<
"V, == --> auto-indent
"before paste --> :set paste . after paste --> :set nopaste. (Maybe set pastetoggle=<F3>)
"Go to line : normal mode, press line number, and then Shift-G
"Go to matching bracket : %
"Navigate through tabs : gt, gT, {i}gt
"Scroll one line up/down : Ctrl-Y/E
"Go where coursor was previously/forwardly : Ctrl-o/i
"cc --> clear line and go insert mode on indent
"to search a word : /\<word\>
"In insert mode press Control-r {reg} to paste something from the register directly
"To copy something from vim to external program, enter the text to @+ register: the clipboard
"In insert mode use Control-n or Control-p to autocomplete based on the current buffer

"to indent html:
:filetype indent on

:set filetype=html
"abbrev
:set ft=html

:set smartindent
"abbrev
:set si
"

"vim remote
"open remotely a file
vim scp://server/file
"e.g.
vim scp://cnode07/code/vim/test.py
"show server list
vim --serverlist
