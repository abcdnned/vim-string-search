command! -nargs=* SearchWord :call s:search_word(<f-args>)

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
