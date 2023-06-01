"
" Filetypes
"

autocmd BufRead,BufNewFile *.h set filetype=c
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd BufRead,BufNewFile *.less set filetype=css
autocmd BufRead,BufNewFile *.wsgi set filetype=python
autocmd BufRead,BufNewFile *.scss set filetype=scss
autocmd BufRead,BufNewFile *.nim set filetype=nim
autocmd BufRead,BufNewFile *.nimble set filetype=nimble
autocmd BufRead,BufNewFile *.asm set filetype=nasm
autocmd BufRead,BufNewFile *.ini.tmpl set filetype=dosini
autocmd BufRead,BufNewFile *.boot set filetype=clojure
autocmd BufRead,BufNewFile *.pxi set filetype=clojure
autocmd BufRead,BufNewFile *.sql set filetype=pgsql
autocmd BufRead,BufNewFile *.msql set filetype=pgsql
autocmd BufRead,BufNewFile *.sql.php set filetype=pgsql
autocmd BufRead,BufNewFile .eslintrc set filetype=json
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.css :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.ini :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.less :%s/\s\+$//e
autocmd BufWritePre *.mako :%s/\s\+$//e
autocmd BufWritePre *.msql :%s/\s\+$//e
autocmd BufWritePre *.nim :%s/\s\+$//e
autocmd BufWritePre *.php :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.rs :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.sql :%s/\s\+$//e
autocmd BufWritePre *.toml :%s/\s\+$//e
autocmd BufWritePre *.vue :%s/\s\+$//e
autocmd BufWritePre *.svelte :%s/\s\+$//e

autocmd VimResized * wincmd =

" resync syntax highlighting - may be slow
autocmd BufEnter * :syntax sync fromstart

" allow autocomplete of words with dashes
autocmd FileType css,scss,less,html,vue,php,python,mako,lisp,scheme,clojure setlocal iskeyword+=-
autocmd FileType ruby,scheme,lisp,clojure,hy,nim,raml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType pgsql setlocal commentstring=--\ %s
autocmd FileType dosini setlocal commentstring=#\ %s
autocmd FileType cfg setlocal commentstring=#\ %s
autocmd FileType toml setlocal commentstring=#\ %s

" Warn when file changed on disk
autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
autocmd FileChangedShell * echohl echoError | echo "------------------------- Warning: File changed on disk ------------------------- " | echohl

autocmd QuickFixCmdPost [^l]* botright cwindow
autocmd QuickFixCmdPost l*    botright lwindow
