augroup hapham-init
    autocmd!
    autocmd BufNewFile,BufRead *.hapham set filetype=hapham
augroup END

augroup hapham-snippet
    autocmd!
    autocmd FileType hapham :iabbrev <buffer> pvh Ha Pham (fanliver)
    autocmd FileType hapham :iabbrev <buffer> hpmail pvh.fanliver@gmail.com
augroup END

augroup hapham-vim-snippet
    autocmd!
    autocmd FileType vim :iabbrev <buffer> ;;aug augroup<cr>autocmd!<cr><cr>augroup END
    autocmd FileType vim :iabbrev <buffer> ;;hp "this is my name: Ha Pham<cr>
augroup END
