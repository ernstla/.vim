" Powerline glyphs:
" Code points Glyphe  Description                Old code point
" U+E0A0             Version control branch     (U+2B60 ⭠ )
" U+E0A1             LN (line) symbol           (U+2B61 ⭡ )
" U+E0A2             Closed padlock             (U+2B64 ⭤ )
" U+E0B0             Rightwards black arrowhead (U+2B80 ⮀ )
" U+E0B1             Rightwards arrowhead       (U+2B81 ⮁ )
" U+E0B2             Leftwards black arrowhead  (U+2B82 ⮂ )
" U+E0B3             Leftwards arrowhead        (U+2B83 ⮃ )

" - Ernst StatusLine
highlight StatusLineNC guifg=#ffffff guibg=#0a0e1a gui=NONE ctermfg=15 ctermbg=240 cterm=NONE
highlight StatusLine guifg=#ffffff guibg=#4a4e5a gui=NONE ctermfg=15 ctermbg=240 cterm=NONE
highlight ErnstSLHighBG guifg=#000000 guibg=#ffaf00
highlight ErnstSLInactiveBG guifg=#000000 guibg=#1f424f
highlight ErnstSLInactiveFG guifg=#1f424f guibg=#131313
highlight ErnstSLHighFG guifg=#ffaf00 guibg=#131313
highlight ErnstSLNormalFG guifg=#4f727f guibg=#131313

function! StatuslineGit()
    let git = fugitive#head()
    if git != ''
        return fugitive#head()
    else
        return ''
endfunction

function! StatuslineMode()
    if (mode() =~# '\v(n|no)')
        execute 'highlight ErnstSLHighBG guifg=#000000 guibg=#ffaf00'
        execute 'highlight ErnstSLHighFG guifg=#ffaf00'
        return "NORMAL 🤟"
    elseif (mode() =~# '\v(v|V)')
        execute 'highlight ErnstSLHighBG guifg=#000000 guibg=#87af00'
        execute 'highlight ErnstSLHighFG guifg=#87af00'
        return "VISUAL 🤟" 
    elseif mode() == "\<C-v>"
        execute 'highlight ErnstSLHighBG guifg=#000000 guibg=#87af00'
        execute 'highlight ErnstSLHighFG guifg=#87af00'
        return "BLOCK  🤟"
    elseif mode() == "i"
        execute 'highlight ErnstSLHighBG guifg=#000000 guibg=#0087df'
        execute 'highlight ErnstSLHighFG guifg=#0087df'
        return "INSERT 🤟"
    else
        execute 'highlight ErnstSLHighBG guifg=#000000 guibg=#DC322F'
        execute 'highlight ErnstSLHighFG guifg=#DC322F'
        return " SHIT  🤟"
    endif
endfunction


function! StatuslineAle() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   return l:counts.total == 0 ? '🖖 ' : printf(
   \ '💡%d  💀%d ', 
   \ l:all_non_errors,
   \ l:all_errors
   \)
endfunction

set laststatus=2
set statusline=

function! SetActiveStatusLine()
    setlocal statusline=
    setlocal statusline+=%#ErnstSLHighBG#
    setlocal statusline+=\ %{StatuslineMode()}
    " setlocal statusline+=%#ErnstSLHighFG#
    " setlocal statusline+=
    " setlocal statusline+=\ 
    setlocal statusline+=%#ErnstSLNormalFG#
    " setlocal statusline+=\ %{StatuslineGit()}
    " setlocal statusline+=\ 
    setlocal statusline+=\ %f
    setlocal statusline+=\ %m\ 
    setlocal statusline+=%=
    setlocal statusline+=%y\ 
    setlocal statusline+=%#ErnstSLHighFG#
    setlocal statusline+=🌍 
    setlocal statusline+=%#ErnstSLNormalFG#
    setlocal statusline+=%{&fileencoding?&fileencoding:&encoding}\ 
    setlocal statusline+=%#ErnstSLHighFG#
    setlocal statusline+=\ 🔨
    setlocal statusline+=%#ErnstSLNormalFG#
    setlocal statusline+=\%{&fileformat}\ \ 
    setlocal statusline+=%#ErnstSLHighFG#
    setlocal statusline+=\ 📑
    setlocal statusline+=%#ErnstSLNormalFG#
    setlocal statusline+=%p%%\ 
    setlocal statusline+=%#ErnstSLHighFG#
    setlocal statusline+=\ \ 
    setlocal statusline+=%#ErnstSLNormalFG#
    setlocal statusline+=%l:%c\ \ 
    " setlocal statusline+=%#ErnstSLHighFG#
    " setlocal statusline+=
    setlocal statusline+=%#ErnstSLHighBG#
    setlocal statusline+=\ %{StatuslineAle()}
endfunction

function! SetInactiveStatusLine()
    setlocal statusline=
    setlocal statusline+=%#ErnstSLInactiveBG#
    setlocal statusline+=\ NORMAL
    setlocal statusline+=\ 🤟
    setlocal statusline+=%#ErnstSLInactiveFG#
    " setlocal statusline+=
    setlocal statusline+=\ %f
    setlocal statusline+=\ %m\ 
    setlocal statusline+=%=
    setlocal statusline+=%y\ 
    setlocal statusline+=🌍 
    setlocal statusline+=%{&fileencoding?&fileencoding:&encoding}\ 
    setlocal statusline+=\ 🔨
    setlocal statusline+=\%{&fileformat}\ \ 
    setlocal statusline+=\ 📑
    setlocal statusline+=%p%%\ 
    setlocal statusline+=\ \ 
    setlocal statusline+=%l:%c\ \  
    setlocal statusline+=\ %{StatuslineAle()}
endfunction

augroup statusline
    autocmd!
    autocmd BufEnter,WinEnter * call SetActiveStatusLine()
    autocmd BufLeave,WinLeave * call SetInactiveStatusLine()
augroup end

call SetInactiveStatusLine()
call SetActiveStatusLine()
