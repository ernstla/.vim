set nocompatible
filetype plugin indent on
syntax on

set autoindent
set backspace=indent,eol,start 	" Backspace as expected
set backupcopy=yes
set clipboard=unnamedplus
set complete=.,w,b,u,t          " Insert-mode completion
set completeopt-=preview
set cursorline
set diffopt=vertical,filler
set encoding=utf-8
set expandtab
set exrc
set fileformat=unix
set fileformats=unix,dos
set foldcolumn=0
set foldlevelstart=99           " Do not automatically fold
set formatoptions+=j            " Delete comment character when joining commented lines
set formatoptions=qrn1
set hidden 			            " Avoid asking to save before hiding
set history=1000
set ignorecase
set incsearch 		            " Search all instances
set lazyredraw
set linebreak                   " Word wrap if wrapping is enabled
set listchars=nbsp:·,tab:›\ ,eol:¬,trail:·,extends:…,precedes:…
set matchpairs=(:),{:},[:],<:>
set maxmempattern=5000
set modeline 			        " Respect modeline of the file (the famous "vi:noai:sw=3 ts=6" on the beginning of the files)
set mouse=a                     " allow mouse in console
set nobackup
set nocursorcolumn
set noequalalways
set noerrorbells visualbell t_vb= " No beeps
set nohlsearch 		            " Don't highlight matched regexp by default
set nojoinspaces
set nosplitbelow
set nostartofline 		        " Keep the cursor in the current column when moving between lines (if possible)
set noswapfile
set nowinfixwidth
set nowrap
set nowritebackup
set number
set numberwidth=1
set path+=**                    " Search through sub-directories when looking up a file
set previewheight=25
set ruler
set scroll=5
set scrolljump=1
set scrolloff=0
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,globals
set shiftround
set shiftwidth=4
set showbreak=╰
set showcmd                     " Show number of selected chars/lines
set showmatch
set showtabline=1               " Always show tabline
set sidescroll=1
set sidescrolloff=5
set smartcase 		            " Don't ignore case if the search term contains uppercase
set smartindent
set smarttab
set softtabstop=4
set splitright                  " Open new splits to the right
set tabstop=4
set tags=./.tags,./tags;
set termguicolors
set textwidth=0
set timeout
set timeoutlen=500
set title
set titlestring=%f%(\ [%M]%) 	" Show file name at the title
set ttimeout
set ttimeoutlen=50
set ttyfast
set undodir=~/.undovim
set undofile                    " Persistent undo
set undolevels=2000
set undoreload=10000
set viminfo='10,:20,\"100,n~/.vim/viminfo
set virtualedit=block           " Allow block mode after end of line
set wildignore=*.o,*.obj,*.pyc,*.swc,*.DS_STORE,*.bkp
set wildmenu
set wildmode=full
set winminheight=0
set wrapmargin=0
setlocal nospell
setlocal spelllang=en           " Spell checking

colorscheme newernst-transparent

" Set cursor shape
"
" solid vertical bar in insert mode
let &t_SI .= "\<Esc>[6 q"
" solid block in normal mode
let &t_EI .= "\<Esc>[2 q"

" needed for termguicolors: see help xterm-true-color
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

" Python syntax settings
let python_highlight_all = 1

" HTML syntax settings
let html_no_rendering = 1

let g:python3_host_prog = '/usr/bin/python3'
if executable('/usr/bin/python2')
    let g:python_host_prog = '/usr/bin/python2'
endif

if has('autocmd')               " Otherwise the settings don't work
    autocmd GUIEnter * set visualbell t_vb=
endif

set t_Co=256

runtime macros/matchit.vim

" netRW settings
" let g:netrw_liststyle = 3
let g:netrw_list_hide = ".*\.pyc$"

" Use ripgrep as grep program
set shortmess=aoOtI
if executable("rg")
    set grepprg=rg\ --smart-case\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
else
    if executable('ag')
        set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
        set grepformat^=%f:%l:%c:%m   " file:line:column:message
    endif
endif

runtime autocmd.vim
runtime tabline.vim
runtime bundles.vim
runtime statusline.vim
runtime plugins.vim
runtime headertoggle.vim
runtime mappings.vim
runtime neovide.vim

set secure " don't allow usafe commands in project .vimrc files
