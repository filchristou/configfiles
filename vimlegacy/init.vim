if exists('g:vscode')
    " VSCode extension
    nunmap ==
    :lua require('vscodebasic')
else
    " ordinary neovim
    luafile ~/.config/nvim/lua/basic.lua

    lua require('pluggedin')
    lua require('mydashboard')

    "Abbreviations {{{
    iabbrev imrpot import
    iabbrev improt import
    iabbrev @@ -- <CR>Filippos Christou<CR>filchristou@outlook.com
    cabbrev v visual
    cabbrev m messages
    cabbrev ct checktime
    cabbrev bsplit belowright split
    "}}}

    "autocmd {{{
    augroup commentgroup
        autocmd!
        autocmd FileType javascript nnoremap <buffer> <localleader>c maI//<ESC>`al

        autocmd FileType plantuml nnoremap <buffer> <localleader>c ma0i'<ESC>`al
        autocmd FileType plantuml nnoremap <buffer> <localleader>C ma0:s/^'//<CR>`a
        autocmd FileType plantuml vnoremap <buffer> <localleader>c :call ICharLines("'")<CR>
        autocmd FileType plantuml vnoremap <buffer> <localleader>C :call IDecharLines("'")<CR>

        autocmd FileType groovy nnoremap <buffer> <localleader>c ma0i//<ESC>`al
        autocmd FileType groovy nnoremap <buffer> <localleader>C ma0:s/^////<CR>`a
        autocmd FileType groovy vnoremap <buffer> <localleader>c :call ICharLines("//")<CR>
        autocmd FileType groovy vnoremap <buffer> <localleader>C :call IDecharLines("//")<CR>

        autocmd FileType python,sh,perl,julia nnoremap <buffer> <localleader>c ma0i#<ESC>`al
        autocmd FileType python,sh,perl,julia nnoremap <buffer> <localleader>C ma0:s/^#//<CR>`a
        autocmd FileType python,sh,perl,julia vnoremap <buffer> <localleader>c :call ICharLines("#")<CR>
        autocmd FileType python,sh,perl,julia vnoremap <buffer> <localleader>C :call IDecharLines("#")<CR>

        autocmd FileType vim nnoremap <buffer> <localleader>c ma0i"<ESC>`al
        autocmd FileType vim nnoremap <buffer> <localleader>C ma0:s/^"//<CR>`a
        autocmd FileType vim vnoremap <buffer> <localleader>c :call ICharLines("\"")<CR>
        autocmd FileType vim vnoremap <buffer> <localleader>C :call IDecharLines("\"")<CR>

        autocmd FileType tex,plaintex nnoremap <buffer> <localleader>c ma0i%<ESC>`al
        autocmd FileType tex,plaintex nnoremap <buffer> <localleader>C ma0:s/^%//<CR>`a
        autocmd FileType tex,plaintex vnoremap <buffer> <localleader>c :call ICharLines("%")<CR>
        autocmd FileType tex,plaintex vnoremap <buffer> <localleader>C :call IDecharLines("%")<CR>
    augroup END

    augroup notabsprogramming
        autocmd!
        autocmd Filetype python setlocal expandtab
        autocmd Filetype yaml setlocal expandtab
    augroup END


    augroup onstartup
        autocmd!
        autocmd BufNewFile *.pl execute ":call WritePerlStartUpText()"
        autocmd BufNewFile *.sh execute ":call WriteBashStartUpText()"
    augroup END

    augroup folding
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

    "functions{{{
    function! ICharLines(str) range
        execute a:firstline.",".a:lastline."s/^/".a:str."/ | noh"
    endfunction

    function! IDecharLines(str) range
        execute a:firstline.",".a:lastline."s/^".a:str."// | noh"
    endfunction

    function! ToggleAutoSave()
        if !exists('#AutoSave#TextChanged')
            augroup AutoSave
                autocmd!
                autocmd TextChanged,TextChangedI <buffer> silent write! .temp.%
            augroup END
            echo 'autosave on'
        else
            augroup AutoSave
                autocmd!
            augroup END
            echo 'autosave off'
        endif
    endfunction

    function! WritePerlStartUpText()
        execute "normal i#!/usr/bin/perl"
        execute "normal ouse warnings;"
        execute "normal ouse strict;"
        execute "normal =="
    endfunction

    function! WriteBashStartUpText()
        execute "normal i#!/usr/bin/env bash"
        execute "normal =="
    endfunction
    "}}}
end

