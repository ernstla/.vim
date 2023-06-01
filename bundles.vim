"
" Bundles
"

" bootstrap vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    silent call mkdir(expand("~/.vim/autoload", 1), 'p')
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/bundle')

Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-visual-star-search'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim' " extend and improve text objects


if !exists('g:vscode')
    Plug 'Sirver/ultisnips'
    " Plug 'guns/xterm-color-table.vim', {'on': 'XtermColorTable'}
    Plug 'jeetsukumaran/vim-filebeagle'
    Plug 'jlanzarotta/bufexplorer'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/gv.vim'
    " Plug 'lilydjwg/colorizer', {'on': 'ColorToggle'}
    " Plug 'luochen1990/rainbow'
    Plug 'majutsushi/tagbar'
    Plug 'mattn/emmet-vim'
    Plug 'mbbill/undotree'
    " Plug 'mhinz/vim-signify'
    Plug 'rhysd/git-messenger.vim'
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-obsession'
    " Plug 'troydm/zoomwintab.vim'
    Plug 'w0rp/ale'

    " Languages
    Plug 'cespare/vim-toml', {'for': 'toml'}
    Plug 'lifepillar/pgsql.vim', {'for': 'sql'}
    Plug 'mxw/vim-jsx', {'for': 'javascript'}
    Plug 'pangloss/vim-javascript', {'for': 'javascript'}
    Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
    Plug 'posva/vim-vue', {'for': 'vue'}
    Plug 'rust-lang/rust.vim', {'for': 'rust'}
    Plug 'tpope/vim-haml', {'for': 'scss'}
    Plug 'evanleck/vim-svelte', {'for': 'svelte'}
    Plug 'ziglang/zig.vim'
    Plug 'https://git.serious.selfip.org/ernst/nim.vim.git'

    " Neovim only
    if has("nvim")
        Plug 'neovim/nvim-lsp'
        Plug 'haorenW1025/diagnostic-nvim'
    endif
endif

if has("unix")
    Plug 'christoomey/vim-tmux-navigator'
endif

call plug#end()
