"
" Plugins
"

" BufExplorer
let g:bufExploreryhowUnlisted = 0
let g:bufExplorerShowRelativePath = 1


" Colorizer
let g:colorizer_nomap = 1
let g:colorizer_startup = 0


" NERDTree
let g:NERDTreeIgnore = ['\.pyc$', '\~$', '\.swp$', '\.gif$', '\.png$', '\.jpg$', '\.trc', 'PYSMELLTAGS', '__pycache__', '.*\.egg-info$', '^\.[[dir]]']  " the last one means all hidden dirs
let g:NERDTreeMouseMode = 2
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 23
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

"
" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
let g:nerd_ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:nerd_ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction

function! NERDCommenter_after()
  if g:nerd_ft == 'vue'
    setf vue
    let g:nerd_ft = ''
  endif
endfunction

" Session
let g:session_autosave = 'yes'
let g:session_autoload = 'no'


" Rainbow Parentheses
let g:rainbow_conf = {
    \   'guifgs': ['#008000', '#ff0000', '#005fff', '#ffff00', '#af00af', '#ff5f00', '#00ffff', '#875f00'],
    \   'ctermfgs': ['2', '9', '12', '11', '128', '202', '14', '94'],
    \   'parentheses': [['(',')'], ['\[','\]'], ['{','}']]
    \}
let g:rainbow_active = 0


" Tagbar
let g:tagbar_width = 35
let g:tagbar_singleclick = 1
let g:tagbar_usearrows = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_iconchars = ['▸', '▾']
" let g:tagbar_iconchars = ['+', '-']


" Ultisnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "ultisnips"]
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsDontReverseSearchPath="1"


" FZF
let g:fzf_command_prefix = 'FZ'
let g:fzf_layout = { 'up': '~20%' }
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
\   'bg':      ['bg', 'Normal'],
\   'hl':      ['fg', 'pythonBuiltinConst'],
\   'fg+':     ['fg', 'TabLineSel'],
\   'bg+':     ['bg', 'TabLineSel'],
\   'hl+':     ['fg', 'pythonBuiltin'],
\   'info':    ['fg', 'String'],
\   'border':  ['fg', 'Normal'],
\   'prompt':  ['fg', 'Conditional'],
\   'pointer': ['fg', 'pythonBuiltin'],
\   'marker':  ['fg', 'Keyword'],
\   'spinner': ['fg', 'Label'],
\   'header':  ['fg', 'Keyword'] }
if has('nvim')
    " Using floating windows of Neovim to start fzf
    let $FZF_DEFAULT_OPTS .= '--color=bg:#131313 --border --layout=reverse'
    function! FloatingFZF()
        let width = float2nr(&columns * 0.6)
        let height = float2nr(&lines * 0.3)
        let opts = { 'relative': 'editor',
        \ 'row': (&lines - height) / 3.5,
        \ 'col': (&columns - width) / 2,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \}

        let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
        call setwinvar(win, '&winhighlight', 'NormalFloat:TabLine')
    endfunction

    let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

" Elm
let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1


" Rust
let g:rustfmt_autosave = 1


" JSX
let g:jsx_ext_required = 1

" vim-vue
let g:vue_pre_processors = ['scss']


" Ale
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1
if has("win32")
    let g:ale_sign_error = '⛔️'
    let g:ale_sign_warning = '💡'
else
    let g:ale_sign_error = '❌ '
    let g:ale_sign_warning = '💡'
end
" let g:ale_linter_aliases = {'svelte': ['css', 'javascript']}
let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\   'typescript': ['tslint'],
\   'javascript': ['eslint'],
\   'json': ['jsonlint'],
\   'svelte': ['stylelint', 'eslint'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'html': [],
\   'nim': ['nimcheck'],
\   'rust': ['cargo'],
\   'php': ['php', 'phpcs'],
\}
let g:ale_scss_sasslint_options = '-c .sass-lint.yml'
let g:ale_fixers = {
\   'python': ['isort', 'black'],
\   'javascript': ['prettier', 'eslint'],
\   'json': ['eslint', 'prettier'],
\   'svelte': ['eslint'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'nim': ['nimpretty'],
\   'rust': ['rustfmt'],
\   'php': ['php_cs_fixer'],
\}
let g:ale_python_black_options = '--line-length 88 --skip-string-normalization'
let g:ale_python_isort_options = '--multi-line 3 --trailing-comma'
" let g:ale_javascript_prettier_options = '--print-with 88 --tab-with 4 --single-quote --trailing-comma "all"'
let g:ale_php_phpcs_executable='./vendor/bin/phpcs'
let g:ale_php_php_cs_fixer_executable='./vendor/bin/php-cs-fixer'
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_rust_rls_executable = '/home/ernst/.cargo/bin/rls'
let g:ale_rust_rls_options = '--cli'
let g:ale_pattern_options = {
\   'Workspace/neorent.*\.py$': {'ale_fixers': ['isort']},
\   'Workspace/neorent.*\.js$': {'ale_fixers': []},
\   'Workspace/neorent.*\.json$': {'ale_fixers': []},
\   'Workspace/neoapp.*\.js$': {'ale_fixers': []},
\   'Workspace/neoapp.*\.json$': {'ale_fixers': []},
\   'Workspace/neoapp.*\.vue$': {'ale_fixers': []},
\   '/mnt/c/Users/Ernst/Workspace.*\.rs$': {'ale_rust_rls_executable': '/mnt/c/Users/Ernst/.cargo/bin/rls.exe'},
\}


" UndoTree
let g:undotree_WindowLayout = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffpanelHeight = 20
let g:undotree_TreeNodeShape = '⚬'
let g:undotree_HelpLine = 0
let g:undotree_SplitWidth = 37


" Ultisnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "ultisnips"]
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsDontReverseSearchPath="1"


" Emmet
let g:user_emmet_leader_key = '<c-e>'


" Signify
let g:signify_disable_by_default = 0
let g:signify_sign_show_count = 0
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_sign_add = '┃'
let g:signify_sign_delete            = '⎇'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '∙'
let g:signify_sign_changedelete      = g:signify_sign_change


" Tmux Navigator
let g:tmux_navigator_disable_when_zoomed = 1


" Vimagit
let g:magit_default_fold_level = 0
let g:magit_auto_fold_open = 0


" Virtualenv
let g:virtualenv_auto_activate = 1


" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['ini=toml']


" rust.vim
" let g:rust_conceal = 1
let g:rustfmt_autosave = 1
