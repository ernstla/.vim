set winaltkeys=no               " Do not allow Alt keys to open menues

" Don't map the <Leader> directly to <Space> like this:
"     let mapleader = "\<Space>"
"     nnoremap \ <Leader>
" Doing it the following way it shows the Backslash in the showcmd corner
map <Space> \

" Move through wrapped lines
silent! nnoremap <up> gk
silent! nnoremap <down> gj
nnoremap j gj
nnoremap k gk
nnoremap <home> g^
nnoremap <end> g$
nnoremap gl g$
nnoremap gh g^

" Identify the syntax highlighting group used at the cursor
nnoremap <Leader>p :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Use Y like C and D
nnoremap Y y$

nnoremap ci2 ci"
nnoremap ca2 ca"
nnoremap di2 di"
nnoremap da2 da"
nnoremap yi2 yi"
nnoremap ya2 ya"

" Visually select current line without line ending
nnoremap _ ^vg_

" Search and replace selected text
vnoremap <leader>R "ay:%s/<C-R>a//g<Left><Left>

" Tabs
nnoremap <Leader>t <esc>:tabnew<cr>
nnoremap <Leader>j <esc>gt
nnoremap <Leader>k <esc>gT
nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
nnoremap <M-6> 6gt
nnoremap <M-7> 7gt
nnoremap <M-8> 8gt
nnoremap <M-9> 9gt
nnoremap <M-0> 10gt
"
" Toggle hlsearch
nnoremap <silent> <Leader>h <esc>:set hlsearch!<CR>

" Toggle relativenumber
nnoremap <silent> <Leader>r <esc>:set relativenumber!<CR>

" Toggle wrapping
nnoremap <Leader>w <esc>:set wrap! wrap?<cr>

" Toggle invisibles
noremap <Leader>i :set list!<CR>

" sudo save
command W w !sudo tee % > /dev/null

" spell
command SpellEnglish set spell spelllang=en
command SpellGerman set spell spelllang=de
command SpellOff set nospell

" Change size of windows
noremap <Leader>>  20<C-W>>
noremap <Leader><  20<C-W><
noremap <Leader>+  5<C-W>+
noremap <Leader>-  5<C-W>-

" Center search matches
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
noremap <C-O> <C-O>zz
noremap <C-I> <C-I>zz

" Easy navigation in Quickfix window
nnoremap <F3> :cnext<CR>
nnoremap <M-F3> :botright cope 15<CR>
if has("gui_running")
    nnoremap <S-F3> :cprevious<CR>
else
    nnoremap <F15> :cprevious<CR>
endif

" Easy navigation in Location List
nnoremap <F4> :lnext<CR>zz
nnoremap <M-F4> :botright lopen 15<CR>
if has("gui_running")
    nnoremap <S-F4> :lprevious<CR>zz
else
    nnoremap <F16> :lprevious<CR>zz
endif

" Run last macro
nnoremap Q @@

" Double the number of leading spaces
nnoremap <Leader>ds :%s/^\s*/&&<CR>
vnoremap <Leader>ds :s/^\s*/&&<CR>

" Execute macros over visual range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Picon
command! Picon exe 'normal m`' | silent! undojoin | exe '%!picon -a' | exe 'normal ``'
nnoremap <Leader>o <esc>:Picon<cr><cr>


" Navigate with + and - between changes and center change on screen
" Catch the transition to diff mode
au FilterWritePre * if &diff | exe 'noremap + ]cz.' | exe 'noremap - [cz.' | exe 'noremap U :diffupdate<CR>' | endif
au FilterWritePre * if &diff |  exe 'execute "normal zR"' | endif
" au FilterWritePre * if &diff | exe 'set diffopt=filler,context:1000' | exe 'execute "normal \<c-w>\<c-w>"' | endif

" Silent grep
function! Grp(args)
    execute "silent! :botright :grep " . a:args
endfunction

command! -nargs=* -complete=file Grep call Grp(<q-args>)
command! -nargs=* -complete=file Ag call Grp(<q-args>)
command! -nargs=* -complete=file Rg call Grp(<q-args>)

" Neovim
if has('nvim')
    " Make escape work in the Neovim terminal.
    tnoremap <Esc> <C-\><C-n>

    " CONFLICTS with fzf
    " Make navigation into and out of Neovim terminal splits nicer.
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l

    " I like relative numbering when in normal mode.
    autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0

    " Prefer Neovim terminal insert mode to normal mode.
    autocmd BufEnter term://* startinsert
endif

" Format json
command Jsonify   %!python -m json.tool
command Tidy      !tidy -mi -html -wrap 0 %

" UndoTree
noremap <F5> :UndotreeToggle<CR>

" signify
noremap <silent> <F6> <Esc>:SignifyToggle<CR>

" Rainbow Paranthesis
noremap <silent> <F7> :RainbowToggle<CR>

" Nerd Tree
noremap <silent> <F8> :NERDTreeToggle<CR>

" BufExplorer
noremap <silent> <F9>  :BufExplorer<CR>

" TagBar
noremap <silent> <F10> <Esc>:TagbarToggle<CR>

" FZF
nnoremap <silent> <M-a> <Esc>:FZRg<CR>
nnoremap <silent> <M-c> <Esc>:FZCommit<CR>
nnoremap <silent> <M-t> <Esc>:FZTags<CR>
nnoremap <silent> <M-p> <Esc>:FZF<CR>
nnoremap <silent> <C-p> <Esc>:FZGitFiles<CR>

" Git: fugitive / git-messenger
nmap <silent> <Leader>gs <Esc>:Gstatus<CR>gg<C-n>
noremap <silent> <Leader>gp <Esc>:Gpush<CR>
noremap <silent> <Leader>gb <Esc>:Gblame<CR>
noremap <silent> <Leader>gd <Esc>:Gvdiff<CR>
noremap <silent> <Leader>gm <Esc><Plug>(git-messenger)

" vim-commentary
nnoremap gm :Commentary<CR>
vnoremap gm :Commentary<CR>

" Neovim specific
if has("nvim")
    " Open terminal and run bpython
    nmap <Leader>py <C-w>v:terminal<CR>bpython<CR><C-\><C-n><C-w>p
    " Evaluate anything from the visual mode in the next window
    vmap <buffer> <Leader>e y<C-w>wpi<CR><C-\><C-n><C-w>p
    " Evaluate outer most form
    nmap <buffer> <Leader>e ^v%y<C-w>wpi<CR><C-\><C-n><C-w>p
    " Evaluate buffer"
    nmap <buffer> <Leader>b ggVGy<C-w>wpi<CR><C-\><C-n><C-w>p

    " Fix C-h
    " not working on Arch
    nmap <bs> :<c-u>TmuxNavigateLeft<cr>
endif