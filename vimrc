" remember...
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
" :filetype indent on
" :set filetype=html           # abbrev -  :set ft=html
" :set smartindent             # abbrev -  :set si
"

"to see changes since last save of the file --> :w !git diff --no-index -- % -<CR>

"from now on aka <leader>
let mapleader = "-"
"from now on aka <localleader>
let maplocalleader = "\\"

"setting {{{

"	tab
"		how many spaces is a tab?
set tabstop=4
"		how many spaces is an indented block
set shiftwidth=4
"		how many spaces to modify on insert mode for <Tab> & <BS>
set softtabstop=4 
"		convert tab to spaces? NO ! ! !
set noexpandtab
"	use :retab to convert tabs to spaces and :retab! to convert spaces to tabs. target specific lines if desired

set number
"highlight matching (curly) brackets, parenthesis, ...
set showmatch
"highlight search
set hlsearch

set is "incsearch
"press :noh to remove already highlighted text
"nnoremap <leader><space> :nohlsearch<CR>   "stop highligh

set autoindent
set mouse-=a

set splitright

"show menu when pressing tab for autocompletion
set wildmenu

"show status linje
"	spaces need to be escaped
set laststatus=2 
set statusline=%02n:%f\ %h%m%r
set statusline+=%=%y\ %4l/%-4L\ \|%3(%c%)%-4(%V%)
set statusline+=\ %P

set pastetoggle=<F11>
"}}}

"mappings {{{
"	tip: Don't use just map. Be specific
nnoremap <Space> a<Space><Esc>
nnoremap = o<ESC>
nnoremap + O<ESC>
nnoremap <leader>hn :noh<CR>

"move splits
nnoremap <C-H> <C-W><
nnoremap <C-J> <C-W>-
nnoremap <C-K> <C-W>+
nnoremap <C-L> <C-W>>

"control-c control-v functionality. Use X11 CLIPBOARD
"copy in all modes
nnoremap <C-c> ma0v$h"+y`a
vnoremap <C-c> "+y
inoremap <C-c> "+y
"cut in all modes
nnoremap <C-x> ma0v$h"+x`a
vnoremap <C-x> "+x
inoremap <C-x> "+x
"paste in all modes
vnoremap <C-v> "+p
nnoremap <C-v> "+p
inoremap <C-v> <Esc>"+pa
vnoremap <C-a><C-V> "+P
nnoremap <C-a><C-V> "+P
inoremap <C-a><C-V> <Esc>"+Pa
"paste from PRIMARY
vnoremap <C-b> "*p
nnoremap <C-b> "*p
inoremap <C-b> <Esc>"*pa
vnoremap <C-a><C-b> "*P
nnoremap <C-a><C-b> "*P
inoremap <C-a><C-b> <Esc>"*Pa

"copy word. Use register 'c'
nnoremap <leader>y ma"cyiw`a
vnoremap <leader>y "cy
"cut word
nnoremap <leader>x ma"cxiw`a
vnoremap <leader>x "cx
"paste word
nnoremap <leader>p "cp
nnoremap <leader>P "cP
"replace word
nnoremap <leader>r diw"cp
nnoremap <leader>R diw"cP

"visual mapping
vnoremap a <ESC>^vg_

"empty line without deleting it
nnoremap <leader>d 0D

"shift-tab
inoremap <S-tab> <C-d>

"handle buffers
nnoremap <leader>1 :buffer 1<CR>
nnoremap <leader>2 :buffer 2<CR>
nnoremap <leader>3 :buffer 3<CR>
nnoremap <leader>4 :buffer 4<CR>
nnoremap <leader>5 :buffer 5<CR>
nnoremap <leader>6 :buffer 6<CR>
nnoremap <leader>7 :buffer 7<CR>
nnoremap <leader>8 :buffer 8<CR>
nnoremap <leader>9 :buffer 9<CR>
"switch buffers in
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

"Function Keys
"	paste mode enabled?
nnoremap <F10> :set paste?<CR>
"	toggle list
nnoremap <F5> :set list!<CR>:set list?<CR>

"Enter continuous command mode
"	need to fix bugs
nnoremap q; :while 1 \| execute input(':') \| redraw! \| endwhile<CR>

"wrap text objects
vnoremap ' <ESC><ESC>`>a'<ESC>`<i'<ESC>`>ll

"diff
nnoremap <C-f><C-f> :w !diff --color % -<CR>

"searching
vnoremap * "vyma:%s/<C-R>v//gn<CR>`a

"saving file
nnoremap <C-S> :w<CR>
inoremap <C-S> <ESC>:w<CR>a

"opening vimrc in a tabe
nnoremap <leader>ev :tabe $MYVIMRC<CR>
"loading vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>:noh<CR>
"}}}

"Abbreviations {{{
iabbrev imrpot import
iabbrev improt import
iabbrev @@ -- <CR>Filippos Christou<CR>filchristou@outlook.com
cabbrev v visual
cabbrev m messages
cabbrev ct checktime
"}}}

"autocmd {{{
augroup commentgroup
	autocmd!
	autocmd FileType javascript nnoremap <buffer> <localleader>c maI//<ESC>`a
	autocmd FileType python nnoremap <buffer> <localleader>c ma0i#<ESC>`a
	autocmd FileType vim nnoremap <buffer> <localleader>c ma0i"<ESC>`a
	autocmd FileType vim vnoremap <buffer> <localleader>c ICharsLines("\"")
augroup END

augroup pythonprogramming
	autocmd!
	autocmd Filetype python setlocal expandtab
augroup END

" foldmethod file settings
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType sh setlocal foldmethod=marker
augroup END

augroup onResisedVimWindow
	autocmd!
	autocmd VimResized * execute "normal! \<C-W>="
augroup END

"}}}

"Operator-Pending Mapping
"	If your operator-pending mapping ends with some text visually selected, Vim will operate on that text.
"	Otherwise, Vim will operate on the text between the original cursor position and the new position.
onoremap in( :<C-U>normal! f(vi(<CR>

"functions
"function! ICharsLines(str) range
"	execute a:firstline.",".a:lastline."s/^/".a:str."/ | noh"
"endfunction
