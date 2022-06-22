filetype plugin indent on

set sw=4 sts=4 ts=4 et
autocmd FileType python setlocal sw=4 sts=4 ts=4 et

autocmd FileType html setlocal sw=2 sts=2 ts=2 et
autocmd FileType css setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd FileType typescript setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascriptreact setlocal sw=2 sts=2 ts=2 et
autocmd FileType typescriptreact setlocal sw=2 sts=2 ts=2 et

autocmd FileType make setlocal sts=4 ts=4 noet
autocmd FileType cpp setlocal sts=4 ts=4 noet
autocmd FileType dart setlocal sw=2 sts=2 ts=2 et
autocmd FileType zsh setlocal sw=4 sts=4 ts=4 et
" autocmd FileType vim setlocal sw=4 sts=4 ts=4 et

augroup vimrc
    autocmd BufRead,BufNewFile *.nim set ts=2
    autocmd BufRead,BufNewFile *.nim set sw=2
    autocmd BufRead,BufNewFile *.nim syntax enable
    autocmd BufRead,BufNewFile *.nim set filetype=nim
augroup END
