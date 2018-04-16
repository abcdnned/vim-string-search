command! -nargs=* SearchWord :call s:search_word(<f-args>)
command! -nargs=* SearchDefine :call s:search_define(<f-args>)

let s:p_symbol = '\([a-zA-Z0-9_\[\]<?>]\+\) '
let s:p_modifiers = '\(private \|public \|protected \|static \|final \|abstract \|synchronized \)*'
let s:p_define = s:p_modifiers . s:p_symbol

function! s:search_word(...)
    let cur_word = expand("<cword>")
    let type = 'java'
    if a:0 > 0 
        if a:1 != 'e'
            let cur_word = a:1
        endif
        if a:0 > 1
            let type = a:2
        endif
    endif
    let cmd = 'vim /'.cur_word.'/j **/*.'.type
    echo cmd
    exe cmd
    exe 'copen 30'
endfunction 

function! s:search_define(...)
    let cur_word = expand("<cword>")
    let type = 'java'
    if a:0 > 0 
        if a:1 != 'e'
            let cur_word = a:1
        endif
    endif
    let cur_word = s:p_define . cur_word
    let cmd = 'vim /'.cur_word.'/j **/*.'.type
    echo cmd
    exe cmd
    exe 'copen 30'
endfunction 
