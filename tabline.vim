function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
    " Select the highlighting
    if i + 1 == tabpagenr()
        let s .= '%#TabLineSel#'
    else
        let s .= '%#TabLine#'
    endif

    let pagenr = i + 1

    " Set the tab page number (for mouse clicks)
    let s .= '%' . pagenr . 'T'

    let buflist = tabpagebuflist(pagenr)
    let winnr   = tabpagewinnr(pagenr)
    let bufnam  = bufname(buflist[winnr - 1])
    let base = substitute(bufnam, '.*/', '', '')
    let s .= ' ' . pagenr . '. ' . base . ' '

    " The label is made by MyTabLabel()
    if i + 1 == tabpagenr()
        let s .= (getbufvar(buflist[winnr - 1], "&mod")?'%#TabLineModSel#⁕  ':'')
    else
        let s .= (getbufvar(buflist[winnr - 1], "&mod")?'%#TabLineMod#⁕  ':'')
    endif
    endfor

    " After the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    " Right-align the label to close the current tab page
    if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
    endif

    return s
endfunction

set tabline=%!MyTabLine()

