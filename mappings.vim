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
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

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
nnoremap <Leader>tt <esc>:tabnew<cr>
nnoremap <Leader>j <esc>gt
nnoremap <Leader>k <esc>gT
nnoremap gr gT
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

" Omni completion
inoremap <C-Space> <C-X><C-O>
"
" Toggle hlsearch
nnoremap <silent> <Leader>h <esc>:set hlsearch!<cr>

" Toggle relativenumber
nnoremap <silent> <Leader>r <esc>:set relativenumber!<cr>

" Toggle wrapping
nnoremap <Leader>w <esc>:set wrap! wrap?<cr>

" Toggle invisibles
noremap <Leader>i :set list!<cr>

" sudo save
command W w !sudo tee % > /dev/null

" spell
command SpellEnglish set spell spelllang=en
command SpellGerman set spell spelllang=de
command SpellOff set nospell

" Change size of windows
noremap <Leader>>  20<C-w>>
noremap <Leader><  20<C-w><
noremap <Leader>+  5<C-w>+
noremap <Leader>-  5<C-w>-

" Center search matches
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
noremap <C-O> <C-O>zz
noremap <C-I> <C-I>zz

" Easy navigation in Quickfix window
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        botright copen 15
    else
        cclose
    endif
endfunction
nnoremap <silent> <F2> :call ToggleQuickFix()<cr>
nnoremap <silent> <C-F3> :call ToggleQuickFix()<cr>
nnoremap <F3> :cnext<cr>
if has("gui_running")
    nnoremap <S-F3> :cprevious<cr>
else
    nnoremap <F15> :cprevious<cr>
endif

" Easy navigation in Location List
nnoremap <F4> :lnext<cr>zz
nnoremap <C-F4> :botright lopen 15<cr>
if has("gui_running")
    nnoremap <S-F4> :lprevious<cr>zz
else
    nnoremap <F16> :lprevious<cr>zz
endif

" Run last macro
nnoremap Q @@

" Double the number of leading spaces
nnoremap <Leader>ds :%s/^\s*/&&<cr>
vnoremap <Leader>ds :s/^\s*/&&<cr>

" Execute macros over visual range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<cr>

function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Picon
command! Picon exe 'normal m`' | silent! undojoin | exe '%!picon -a' | exe 'normal ``'
nnoremap <Leader>o <esc>:Picon<cr><cr>


" Navigate with +/= and - between changes and center change on screen
" Catch the transition to diff mode
au FilterWritePre * if &diff | exe 'noremap = ]cz.' | exe 'noremap + ]cz.' | exe 'noremap - [cz.' | exe 'noremap U :diffupdate<cr>' | endif
au FilterWritePre * if &diff |  exe 'execute "normal zR"' | endif
" au FilterWritePre * if &diff | exe 'set diffopt=filler,context:1000' | exe 'execute "normal \<c-w>\<c-w>"' | endif

" Silent grep
function! Grp(args)
    execute "silent! :botright :grep " . a:args
endfunction

command! -nargs=* -complete=file Grep call Grp(<q-args>)
command! -nargs=* -complete=file Ag call Grp(<q-args>)
command! -nargs=* -complete=file AG call Grp(<q-args>)
command! -nargs=* -complete=file Rg call Grp(<q-args>)

if has('win32')
    nnoremap <silent> <C-h> <C-w>h
    nnoremap <silent> <C-j> <C-w>j
    nnoremap <silent> <C-k> <C-w>k
    nnoremap <silent> <C-l> <C-w>l
    nnoremap <silent> <M-h> <C-w>h
    nnoremap <silent> <M-j> <C-w>j
    nnoremap <silent> <M-k> <C-w>k
    nnoremap <silent> <M-l> <C-w>l
else
    nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
    nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>
endif

" Neovim
if has('nvim')
    " Make escape work in the Neovim terminal.
    tnoremap <Esc> <C-\><C-n>

    " CONFLICTS with fzf
    " Make navigation into and out of Neovim terminal splits nicer.
    if has('unix')
        tnoremap <C-h> <C-\><C-n><C-w>h
    endif
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
    tnoremap <M-h> <C-\><C-n><C-w>h
    tnoremap <M-j> <C-\><C-n><C-w>j
    tnoremap <M-k> <C-\><C-n><C-w>k
    tnoremap <M-l> <C-\><C-n><C-w>l

    nnoremap <Leader>v :vsplit<bar>terminal<cr>
    nnoremap <Leader>s :split<bar>terminal<cr>
    nnoremap <Leader>x :terminal<cr>

    " Open terminal and run ptpython
    nmap <Leader>py <C-w>v:terminal<cr>ptpython<cr><C-\><C-n><C-w>p
    " Evaluate anything from the visual mode in the next window
    vmap <buffer> <Leader>e y<C-w>wpi<cr><C-\><C-n><C-w>p
    " Evaluate outer most form
    nmap <buffer> <Leader>e ^v%y<C-w>wpi<cr><C-\><C-n><C-w>p
    " Evaluate buffer"
    nmap <buffer> <Leader>b ggVGy<C-w>wpi<cr><C-\><C-n><C-w>p

    " Neovim LSP
    nnoremap <silent> gd            <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap <silent> gG         <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> K             <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <silent> gD            <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <silent> <leader>k     <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <silent> 1gD           <cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap <silent> gr            <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <silent> g0            <cmd>lua vim.lsp.buf.document_symbol()<CR>
endif

" Format json
command Jsonify   %!python3 -m json.tool
command Tidy      !tidy -mi -html -wrap 0 %

" UndoTree
noremap <F5> :UndotreeToggle<cr>

" signify
noremap <silent> <F6> <Esc>:SignifyToggle<cr>

" Rainbow Paranthesis
noremap <silent> <F7> :RainbowToggle<cr>

" Nerd Tree
noremap <silent> <F8> :NERDTreeToggle<cr>

" BufExplorer
noremap <silent> <F9>  :BufExplorer<cr>

" TagBar
noremap <silent> <F10> <Esc>:TagbarToggle<cr>

" FZF
":
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
command! -bang -nargs=? -complete=dir GitFiles
    \ call fzf#vim#gitfiles(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
nnoremap <silent> <M-r> <Esc>:FZRg<cr>
nnoremap <silent> <M-c> <Esc>:FZCommit<cr>
nnoremap <silent> <M-t> <Esc>:FZTags<cr>
nnoremap <silent> <M-p> <Esc>:FZFiles<cr>
nnoremap <silent> <M-b> <Esc>:FZBuffers<cr>
nnoremap <silent> <C-p> <Esc>:GitFiles<cr>

" Git: fugitive / git-messenger
nmap <silent> <Leader>gs <Esc>:Git<cr>gg<C-n>
noremap <silent> <Leader>gp <Esc>:Gpush<cr>
noremap <silent> <Leader>gb <Esc>:Gblame<cr>
noremap <silent> <Leader>gd <Esc>:Gvdiff<cr>
noremap <silent> <Leader>gm <Esc><Plug>(git-messenger)

" NERDCommenter
nnoremap gm :call nerdcommenter#Comment("n", "Comment")<cr>
vnoremap gm :call nerdcommenter#Comment("v", "Comment")<cr>
nnoremap gs :call nerdcommenter#Comment("n", "Invert")<cr>
vnoremap gs :call nerdcommenter#Comment("v", "Invert")<cr>

"" FOR WSL ONLY
if has('wsl')
   augroup WSLYank
       autocmd!
       autocmd TextYankPost * :call system('clip.exe ',@")
   augroup END
end
