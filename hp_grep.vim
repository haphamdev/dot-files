function! HpOperator(type)
    let register_backup = @@
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif
    
    silent execute "grep ". shellescape(@@) . " " . expand("%")
    copen
    let @@ = register_backup
endfunction

nnoremap <leader>sw :silent execute "grep " . shellescape(expand("<cword>")) . " " . expand("%")<cr>:copen<cr>

nnoremap <leader>ho :set operatorfunc=HpOperator<cr>g@
vnoremap <leader>ho :<c-u>call HpOperator(visualmode())<cr>

" Remove all tailing whitespaces. 
" mq: mark current position to 'q'
" Select the whole line
" Search within selected text: /\%S
" regex for tailing whitespaces: \s\+$
" Remove tailing whitespaces
" `q: move back to the marked position
nnoremap <leader>wh mqV/\%V\s\+$<cr><esc>diw`q
onoremap } :<c-u>normal! $vbbbel"<cr>

function HpTestFunc (kd)
    echom "hp test 1"
endfunction

