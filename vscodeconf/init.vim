"from now on aka <leader>
let mapleader = "-"

nnoremap <Space> a<Space><Esc>
nnoremap = o<ESC>
nunmap ==

nnoremap + O<ESC>
nnoremap <leader>hn :noh<CR>

" visual block
nnoremap _v <C-v>

" copy to +
vnoremap <C-c> "+y
nnoremap <C-v> i<C-v><Esc>
vnoremap <C-q> <C-v>

nnoremap <leader>v 0v$h

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
"delete word and write
nnoremap <leader>c lbvec

"visual mapping
vnoremap a <ESC>^vg_

"empty line without deleting it
nnoremap <leader>d 0D

" Search for selected block text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

"vscode stuff
nnoremap <C-k><C-i> :call VSCodeNotify('editor.action.showHover')<CR>
nnoremap <C-k><C-l> call VSCodeNotify('editor.action.openLink')<CR>

