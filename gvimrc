" Cursor is a thin line if in insert mode otherwsie a block
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver1-iCursor
set guicursor+=n-v-c:blinkon0-Cursor
colorscheme newernst-transparent

GuiLinespace -1
GuiTabline 0
GuiPopupmenu 0
GuiFont! Roboto\ Mono\ for\ Powerline:h10

" Use shift+insert for paste inside neovim-qt,
" see https://github.com/equalsraf/neovim-qt/issues/327#issuecomment-325660764
inoremap <silent> <S-Insert>  <C-R>+
cnoremap <silent> <S-Insert> <C-R>+

" For Windows, Ctrl-6 does not work. So we use this mapping instead.
nnoremap <silent> <C-6> <C-^>

" Don't show toolbar and scrollbars
set guioptions-=T to
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=e
set tabline=%!MyTabLine()

" Highlight wrong spelling
highlight SpellBad term=underline gui=undercurl guisp=Red

" Set size and position
set lines=50
set columns=126 

