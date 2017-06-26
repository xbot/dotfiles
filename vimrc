" ------------------------------ Miscellaneous ------------------------------"{{{
" Check the current platform
function! IsPlatform(mixed)"{{{
    if type(a:mixed) == 1
        let plist = [a:mixed]
    elseif type(a:mixed) == 3
        let plist = a:mixed
    else
        return 0
    endif

    if has("win16") || has('win32') || has('win64') || has('winnt')
        return index(plist, 'win')>=0
    elseif has('gui_macvim')
        return index(plist, 'mac')>=0
    else
        return index(plist, 'unix')>=0
    endif

    return 0
endfunction"}}}

set nocompatible
filetype on
filetype indent on
filetype plugin on
syntax on

" encoding & decoding settings
set encoding=utf-8
set fencs=ucs-bom,utf-8,chinese,big5,windows-1252
if IsPlatform('win')
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
let &termencoding=&encoding
"set langmenu=en_US.UTF-8
set langmenu=zh_CN.UTF-8
" language message zh_CN.UTF-8
language message en_US.UTF-8

" map <leader>
let mapleader=","

" Environment settings
if IsPlatform('win')
    set rtp-=$HOME/vimfiles
endif

" Generic declarations
" Platform specific declarations
if IsPlatform('win')
    let gbl_private_settings_file=expand($VIM.'/vimfiles/private.vim')
    let gbl_vimrc_name = '_vimrc'
    let gbl_vimrc_file = $VIM.'/'.gbl_vimrc_name
else
    let gbl_private_settings_file = expand('~/.vim/private.vim')
    let gbl_vimrc_name = '.vimrc'
    let gbl_vimrc_file = expand('~/'.gbl_vimrc_name)
endif
"}}}

" ------------------------------ Sourcings ------------------------------"{{{
" Use command :Man to view manpages
if has('unix')
    so $VIMRUNTIME/ftplugin/man.vim
endif
if IsPlatform('win')
    source $VIMRUNTIME/vimrc_example.vim
endif
if !has('gui_macvim')
    source $VIMRUNTIME/mswin.vim
    behave mswin
    map <c-f> <PageDown>
endif
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Load private settings
if filereadable(gbl_private_settings_file)
    exec 'source '.gbl_private_settings_file
else
    echoerr 'gbl_private_settings_file is not readable, some functions may not work.'
endif
"}}}

" ------------------------------ VAM ------------------------------"{{{
set runtimepath+=~/.vim/addons/vim-addon-manager
let active_addons = []
let s:vamRegistryFile = expand('~').'/.vim/vam_registry'
if filereadable(s:vamRegistryFile)
    for linestr in readfile(s:vamRegistryFile)
        if linestr !~ '^#'
            call add(active_addons, linestr)
        endif
    endfor
endif
call vam#ActivateAddons(active_addons)
" Addon post-install hook.
fun! MyAddonPostActivateHook(info, repository, pluginDir, opts)"{{{
    if filereadable(s:vamRegistryFile)
        let regLines = readfile(s:vamRegistryFile)
        call add(regLines, a:repository.name)
        call sort(regLines)
        call uniq(regLines)
    else
        let regLines = [a:repository.name]
    endif
    call writefile(regLines, s:vamRegistryFile)
endfun"}}}
let g:vim_addon_manager.post_install_hook_functions = ['MyAddonPostActivateHook']
" Complete the addon name.
fun! MyDoActivatedAddonsCompete(...)"{{{
    let fullList = keys(g:vim_addon_manager.activated_plugins)
    call filter(fullList, 'v:val =~ ".*'.a:1.'.*"')
    return fullList
endfun"}}}
" Remove records of addons from the registry.
fun! MyUninstallAddons(...)"{{{
    if filereadable(s:vamRegistryFile)
        let regLines = readfile(s:vamRegistryFile)
    else
        echo "Registry is empty."
        return
    endif
    for addonName in a:000
        let idx = index(regLines, addonName)
        if idx >= 0
            call remove(regLines, idx)
            echo addonName.' is removed from the registry.'
        else
            echo addonName.' cannot be found in the registry.'
        endif
    endfor
    call writefile(regLines, s:vamRegistryFile)
endfun"}}}
command! -complete=customlist,MyDoActivatedAddonsCompete -nargs=* UninstallAddons :call MyUninstallAddons(<f-args>)
" Enable or disable addons
fun! MyDoEnabledAddonsCompete(...)"{{{
    if file_readable(s:vamRegistryFile)
        let fullList = readfile(s:vamRegistryFile)
        call filter(fullList, 'v:val !~ "^#"')
        call filter(fullList, 'v:val =~ ".*'.a:1.'.*"')
        return fullList
    endif
endfun"}}}
fun! MyDoDisabledAddonsCompete(...)"{{{
    if file_readable(s:vamRegistryFile)
        let fullList = readfile(s:vamRegistryFile)
        call filter(fullList, 'v:val =~ "^#.*'.a:1.'.*"')
        call map(fullList, 'v:val[1:]')
        return fullList
    endif
endfun"}}}
fun! MyEnableAddons(...)"{{{
    if filereadable(s:vamRegistryFile)
        let regLines = readfile(s:vamRegistryFile)
    else
        echo "Registry is empty."
        return
    endif
    for addonName in a:000
        let idx = index(regLines, '#'.addonName)
        if idx >= 0
            let regLines[idx] = addonName
            echo addonName.' is enabled.'
        else
            echo addonName.' cannot be enabled.'
        endif
    endfor
    call writefile(regLines, s:vamRegistryFile)
endfun"}}}
fun! MyDisableAddons(...)"{{{
    if filereadable(s:vamRegistryFile)
        let regLines = readfile(s:vamRegistryFile)
    else
        echo "Registry is empty."
        return
    endif
    for addonName in a:000
        let idx = index(regLines, addonName)
        if idx >= 0
            let regLines[idx] = '#'.addonName
            echo addonName.' is disabled.'
        else
            echo addonName.' cannot be disabled.'
        endif
    endfor
    call writefile(regLines, s:vamRegistryFile)
endfun"}}}
command! -complete=customlist,MyDoDisabledAddonsCompete -nargs=* EnableAddons :call MyEnableAddons(<f-args>)
command! -complete=customlist,MyDoEnabledAddonsCompete -nargs=* DisableAddons :call MyDisableAddons(<f-args>)
"}}}

" ------------------------------ Application Settings ------------------------"{{{
set nowrap
set nobackup
set number
set cindent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set wildmenu " Type :help and press <TAB> , so that's the effect .
set lazyredraw " Do not redraw while macros are running , this accelerates vim greatly .
set expandtab
set confirm
set viminfo+=!
set history=100		" keep 50 lines of command line history
set hlsearch
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%Y]%=%l,%c%V%8P
set ignorecase
set fdm=marker
set splitbelow
set noequalalways
set winminheight=1
"set winheight=9999
set clipboard+=unnamed
set mouse=a
set vb t_vb=
set laststatus=2
set updatetime=10000
set cursorline
set cursorcolumn
if IsPlatform('win')
    set grepprg=d:/dev/tool/GnuWin32/bin/grep.exe\ -n
else
    " set grepprg=grep\ -n
    set grepprg=ag\ --nogroup\ --column\ -U\ --ignore\ tags
endif
set wildignore=*.class,*.pyc
"}}}

" ------------------------------ GUI Settings ------------------------------"{{{
if has('gui_running')
    " Font settings
    if IsPlatform('win')
        set background=dark
        " set background=light
        colorscheme freya
        set guifont=Source\ Code\ Pro:h11
    elseif has('gui_macvim')
        set guifont=Monaco:h18
        set background=dark
        " colorscheme solarized
        colorscheme nova
    else
        set background=dark
        " set background=light
        " colorscheme solarized
        colorscheme nova
        " set guifont=CosmicSansNeueMono\ 15
        set guifont=FantasqueSansMono\ 15
        " set guifont=Source\ Code\ Pro\ 12
        "set guifont=inconsolata\ Bold\ 13
        "set guifontwide=YaHei\ Consolas\ Hybrid\ 12
        "set guifontwide=DeJaVu\ Sans\ Yuan\ Ti\ Bold\ 13
        "set guifont=Consolas\ Bold\ 13
        "set guifont=Consolas\ 13
        set guifontwide=DeJaVu\ Sans\ Yuan\ Ti\ 11
    endif

    " GUI Options
    set go-=T
    set go-=m
    set go-=L
    if IsPlatform('win')
        set go-=r
    endif
    set go-=r
    "set go+=b

    " Toggle menu bar
    map <silent> <C-S-F2> :if &guioptions =~# 'm' <Bar>
                \set guioptions-=m <bar>
                \else <Bar>
                \set guioptions+=m <Bar>
                \endif<CR>
else
    " For CLI vim
    " set background=light
    set background=dark
    "colorscheme diablo3
    "colorscheme jellybeans
    " let g:solarized_termcolors=16
    let g:solarized_termcolors=256
    " colorscheme solarized
    colorscheme nova
endif

" custom the window title
fun! MyTitleString()
    let sessionName = xolox#session#find_current_session()
    let sessionStr = ''
    if len(sessionName)>0
        let sessionStr = ' ['.sessionName.'] '
    endif
    return 'VIM'.sessionStr.': %-25.55F %a%r%m'
endfun
au BufEnter * let &titlestring=MyTitleString()
set titlelen=70
"}}}

"------------------------------- Plugins Settings --------------------------{{{
" Tagbar
let g:tagbar_compact = 1
let g:tagbar_usearrows = 1
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_show_visibility = 1
let g:tagbar_show_linenumbers = 1
let g:tagbar_type_php  = {
            \ 'ctagstype' : 'php',
            \ 'kinds'     : [
            \ 'i:interfaces',
            \ 'c:classes',
            \ 'd:constant definitions',
            \ 'f:functions',
            \ 'j:javascript functions:1'
            \ ]
            \ }
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }
let g:tagbar_type_octopress = {
            \ 'ctagstype': 'markdown',
            \ 'ctagsbin' : 'markdown2ctags',
            \ 'ctagsargs' : '-f - --sort=yes',
            \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
            \ ],
            \ 'sro' : '|',
            \ 'kind2scope' : {
            \ 's' : 'section',
            \ },
            \ 'sort': 0,
            \ }

" FencView settings
let g:fencview_autodetect=0
let g:fencview_checklines=10
let g:fencview_auto_patterns='*.txt,*.htm{l\=},*.php,*.lib,*.inc,*.sql'

" SuperTab Settings
" " To be compatible with neocomplcache
" let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
" To be compatible with YouCompleteMe
let g:SuperTabDefaultCompletionType = '<leader><C-Tab>'

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<leader><C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<leader><C-S-TAB>', '<Up>']
let g:ycm_global_ycm_extra_conf = '~/.vim/addons/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Ferret
let g:FerretExecutable='ag'

nmap <leader>ak <Plug>(FerretAck)
nmap <leader>lak <Plug>(FerretLack)
nmap <leader>aw <Plug>(FerretAckWord)
nmap <leader>as <Plug>(FerretAcks)
vmap <leader>ak y:Ack <C-R>=XEscapeRegex(@", 2)<CR>
vmap <leader>lak y:Lack <C-R>=XEscapeRegex(@", 2)<CR>

nnoremap <leader>a :set operatorfunc=GrepOperator<CR>g@
vnoremap <leader>a :<c-u>call GrepOperator(visualmode())<CR>
function! GrepOperator(type)"{{{
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    exec "Ack ".XEscapeRegex(@@, 2)
    " exec "Grep ".XEscapeRegex(@@, 2)
endfunction"}}}

" List all tasks under the current directory
map <leader>lstd :Ack //\ TODO: --ignore PHPExcel --ignore public<CR>

" EasyGrep
" let g:EasyGrepRecursive = 1
" let g:EasyGrepCommand = 1
" let g:EasyGrepJumpToMatch = 0
" let g:EasyGrepWindow = 0
" let g:EasyGrepReplaceWindowMode = 1
" let g:EasyGrepPerlStyle = 0
" " let g:EasyGrepMode = 3
" " let g:EasyGrepDefaultUserPattern='<JAVA>'
" " let g:EasyGrepOpenWindowOnMatch=0
" " let g:EasyGrepFilesToExclude='.svn,.git,tags,PHPExcel,assets,runtime,third-lib,static,*.js,*.*.js'

" nmap <leader>gr :Grep<space>
" vmap <leader>gr y:Grep <C-R>=XEscapeRegex(@", 2)<CR>

" Pydiction Settings
if IsPlatform('win')
    let g:pydiction_location = 'D:/Program Files/vim/vimfiles/addons/Pydiction/ftplugin/complete-dict'
else
    let g:pydiction_location = '~/.vim/addons/Pydiction/ftplugin/complete-dict'
endif

" SQL Type Default
let g:sql_type_default = 'sqlsvr'

" NERD_commenter Settings
let NERDSpaceDelims = 1

" NERD Tree
let NERDTreeIgnore=['\.scc$', '\.pyc$', '\~$']

" TwitVim
let twitvim_enable_python = 1
let twitvim_proxy = "127.0.0.1:8123"
let twitvim_browser_cmd = "/usr/bin/google-chrome-stable"

if IsPlatform('win')
    let g:netrw_http_cmd = $VIM.'\addons\binary-utils\dist\bin\curl.exe -o'
endif

if IsPlatform('win')
    let g:pydoc_cmd = "python C:\\Python27\\Lib\\pydoc.py"
endif

let ub_debug = 0
let ub_use_ubviewer = 0
let ub_viewer_width = 900
let ub_append_promotion_link = 1
let ub_local_pagesize = 30
let ub_remote_pagesize = 15
let ub_search_pagesize = 30
let ub_list_col1_width = 7
let ub_list_col2_width = 8
let ub_list_col3_width = 11
"let ub_converter_command = 'pandoc'
"let ub_converter_options = []
"let ub_converter_option_from = '--from=%s'
"let ub_converter_option_to = '--to=%s'
let ub_save_after_opened = 0
let ub_save_after_sent = 1
let ub_editor_mode = 0
let ub_hotkey_open_item_in_current_view = '<enter>'
let ub_hotkey_open_item_in_splited_view = '<s-enter>'
let ub_hotkey_open_item_in_tabbed_view = '<c-enter>'
let ub_hotkey_delete_item = '<del>'
let ub_hotkey_pagedown = '<pagedown>'
let ub_hotkey_pageup = '<pageup>'
let ub_hotkey_save_current_item = '<leader>w'
let ub_tmpl_img_url = '<a href="%(url)s"><img src="%(url)s"></a>'
let ub_socket_timeout = 30

" shell.vim
let g:shell_mappings_enabled=0

" session.vim
let g:session_autoload = 'no'

" DirDiff
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,.svn,.git,assets,tags"

" Colorizer
let g:colorizer_auto_filetype='css,html'

" Minibufexpl
let g:miniBufExplSplitBelow=0
let g:bufExplorerDisableDefaultKeyMapping=1
map <leader>be :ToggleBufExplorer<CR>

" Vdebug.vim
let g:vdebug_options= {
            \    "path_maps" : {
            \        "/var/www/workspace": expand('~')."/workspace",
            \    },
            \    "port" : 9001,
            \    "server" : '0.0.0.0',
            \    "timeout" : 20,
            \    "on_close" : 'detach',
            \    "break_on_open" : 1,
            \    "ide_key" : '',
            \    "remote_path" : "",
            \    "local_path" : "",
            \    "debug_window_level" : 0,
            \    "debug_file_level" : 0,
            \    "debug_file" : "",
            \    "marker_default" : "⬦",
            \}
if IsPlatform('mac')
    let g:vdebug_options['path_maps'] = {
                \}
endif
let g:vdebug_keymap = {
            \    "run" : "<F5>",
            \    "run_to_cursor" : "<F1>",
            \    "step_over" : "<F2>",
            \    "step_into" : "<F3>",
            \    "step_out" : "<F4>",
            \    "close" : "<F6>",
            \    "detach" : "<F7>",
            \    "set_breakpoint" : "<F10>",
            \    "get_context" : "<F11>",
            \    "eval_under_cursor" : "<F12>",
            \    "eval_visual" : "<Leader>e",
            \}

" vim-jsbeautify
vmap <leader>jsb :'<,'>!js-beautify -i<CR>
autocmd FileType javascript noremap <buffer>  <leader>jsb :call JsBeautify()<CR>
autocmd FileType html noremap <buffer> <leader>htmlb :call HtmlBeautify()<CR>
autocmd FileType css noremap <buffer> <leader>cssb :call CSSBeautify()<CR>

" " Eclim
" let g:EclimCompletionMethod = 'omnifunc'

" Ctrlp
" let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = {
            \ 'dir':  'target\|third-lib\|dist',
            \ 'file': '\v\.(exe|so|dll)$'
            \ }
let g:ctrlp_follow_symlinks = 2
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                      \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_switch_buffer = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10000'
" let g:ctrlp_max_files = 100000
if executable('ag')
    let g:ctrlp_user_command = 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'
    " let g:ctrlp_use_caching = 0
endif
let g:ctrlp_abbrev = {
            \ 'gmode': 'i',
            \ 'abbrevs': [
            \ {
            \ 'pattern': '^A',
            \ 'expanded': 'lib/Api/',
            \ 'mode': 'pfrz',
            \ },
            \ {
            \ 'pattern': '^C',
            \ 'expanded': 'web/controllers/',
            \ 'mode': 'pfrz',
            \ },
            \ ]
            \ }

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_highlighting = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }
au FileType php let b:syntastic_skip_checks = 1
let g:syntastic_python_python_exec = '/usr/bin/python2'

" let g:powerline_pycmd = 'py'

" pdv
let g:pdv_template_dir = $HOME ."/.vim/addons/github-tobyS-pdv/templates_snip"
au FileType php nnoremap <buffer> <leader>\\ :call pdv#DocumentWithSnip()<CR>

" ag
let g:ag_lhandler="lopen"

" svnj
let g:svnj_send_soc_command = 0

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
" nnoremap <leader><leader>r :<C-u>Unite file_rec/async<CR>
nnoremap <leader>jl :<C-u>Unite jump<CR>
call unite#custom#profile('default', 'context', {
            \   'start_insert': 1,
            \   'winheight': 1000,
            \   'direction': 'botright',
            \ })
function! s:UniteSettings()"{{{
    let b:actually_quit = 0
    setlocal updatetime=3
    au! InsertEnter <buffer> let b:actually_quit = 0
    au! InsertLeave <buffer> let b:actually_quit = 1
    au! CursorHold  <buffer> if exists('b:actually_quit') && b:actually_quit | close | endif
endfunction"}}}
au FileType unite call s:UniteSettings()

" gtags
let Gtags_Close_When_Single = 1
let Gtags_Auto_Update = 0
let g:cscope_silent = 1
au FileType php,python,c,cpp,javascript,go map <buffer> <C-]> :Gtags<CR><CR>
if has('gui_running')
    au FileType php,python,c,cpp,javascript,go map <buffer> <C-[> :Gtags -r<CR><CR>
endif
nnoremap <leader><C-]> :execute 'Unite gtags/def:'.expand('<cword>')<CR>
nnoremap <leader><C-[> :execute 'Unite gtags/ref:'.expand('<cword>')<CR>

" FastFold
let g:fastfold_fold_command_suffixes =  ['x','X','a','A']

"easy-align
vmap <leader>A <Plug>(EasyAlign)
let g:easy_align_ignore_groups = ["String"]

" instant-markdown
let g:instant_markdown_autostart = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1
"}}}

"------------------------------- Auto Commands ------------------------------"{{{
if IsPlatform('win')
    au GUIEnter * simalt ~x
else
    " au GUIEnter * call MaximizeWindow()
endif

if IsPlatform('win')
    au VimEnter *.* cd %:h
endif

" Javascript filetype
au FileType javascript setl fen
au FileType javascript setl foldlevel=0
au BufRead *.pac setl filetype=javascript
au BufRead *.pac setl foldlevel=1
" au FileType javascript call JavaScriptFold()
function! JavaScriptFold()"{{{
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction"}}}

" Devilspie
au BufNewFile,BufRead *.ds set filetype=lisp

" Markdown
augroup markdown
    autocmd BufNewFile,BufRead *.mkd,*.md set filetype=markdown
    " autocmd BufNewFile,BufRead *.mkd set wrap
    au FileType markdown set wrap
    " au FileType markdown set guifontwide=
    " au FileType markdown set background=light
    " au FileType markdown colorscheme zenesque
    " au FileType markdown colorscheme newspaper
augroup END

" Don't use Ex mode, use Q for formatting
map Q gq

" Fix the problem that vim on linux takes C-style commentstring to comment fold markers in vim scripts
" This problem is found only on my linux, it should be checked out that what reason causes such a problem
au FileType vim set commentstring=\"%s

" Fold method
au FileType python set fdm=indent
au FileType sql set fdm=manual
au FileType sh set fdm=syntax
let g:sh_fold_enabled=1
au FileType java set fdm=syntax
au FileType java set fdl=1
au FileType javascript set fdl=1

" Plain text
au BufNewFile,BufRead *.txt set wrap
" Dokuwiki
au BufNewFile,BufRead *.doku set ft=dokuwiki

" Auto handle resources
if IsPlatform('unix')
    autocmd! BufWritePost,FileWritePost .xbindkeysrc silent !ps aux|grep -P '\sxbindkeys$'|awk '{print $2}'|xargs kill > /dev/null 2>&1 ; xbindkeys > /dev/null 2>&1
    autocmd! BufWritePost,FileWritePost .xbindkeys.scm silent !ps aux|grep -P '\sxbindkeys\s'|awk '{print $2}'|xargs kill > /dev/null 2>&1 ; xbindkeys -fg ~/.xbindkeys.scm > /dev/null 2>&1
    autocmd! BufWritePost,FileWritePost .Xdefaults   silent !xrdb ~/.Xdefaults
    autocmd! BufWritePost,FileWritePost .Xresources  silent !xrdb ~/.Xresources
endif

" Vimperator
au BufRead .vimperatorrc setl filetype=vimperator

au FileType sql set synmaxcol=0

" Quickfix and location windows
au WinLeave * if &buftype=='quickfix' | lclose | endif
autocmd! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter>

" Golang
autocmd BufWritePre *.go :Fmt

" vim help
au FileType vim set keywordprg="help"

" vim-octopress
autocmd BufNewFile,BufRead *.markdown,*.textile set filetype=octopress
"}}}

"------------------------------- Key mappings -------------------------------"{{{
"普通退出，全部退出，强制退出，强制全部退出
nmap <leader>qq :q<CR>
imap <leader>qq <ESC>:q<CR>
nmap <leader>aq :qa<CR>
imap <leader>aq <ESC>:qa<CR>
nmap <leader>Q :q!<CR>
imap <leader>Q <ESC>:q!<CR>
nmap <leader>aQ :qa!<CR>
imap <leader>aQ <ESC>:qa!<CR>

" 编辑
inoremap jj <ESC>
nmap <leader>w :up<CR>
nmap <leader>W :SudoWrite<CR>
imap <leader>w <ESC>:up<CR>
imap <leader>W <ESC>:SudoWrite<CR>
nmap <leader>x :x<CR>
imap <leader>x <ESC>:x<CR>
imap <leader>u <C-O>:normal u<CR>
imap <leader>o <C-O>:normal o<CR>
imap <leader>O <C-O>:normal O<CR>
nmap <Space> <Pagedown>
nmap <C-S-U> :e!<CR>
imap <C-S-U> <C-O>:e!<CR>
imap <C-Q> <ESC>:wq<CR>
xnoremap <expr> p '"_d"'.v:register.'P'

" 页签
nmap <C-T><C-T> :tabnew<CR>
imap <C-T><C-T> <ESC>:tabnew<CR>
nmap <C-T><C-W> :tabc<CR>
imap <C-T><C-W> <ESC>:tabc<CR>
nmap <C-Tab> :tabn<CR>
imap <C-Tab> <ESC>:tabn<CR>
nmap <C-S-Tab> :tabp<CR>
imap <C-S-Tab> <ESC>:tabp<CR>
nmap gr :tabp<CR>
nmap <leader><leader>du :tab sp<CR>
imap <leader><leader>du :tab sp<CR>

" 编辑与当前文件路径相关的文件
nmap <leader><leader>O :e <C-R>=expand("%:p:~")<CR>
nmap <leader><leader>D :e <C-R>=expand("%:p:~:h").'/'<CR>

" Quickfix and location windows
" let g:toggle_list_no_mappings=1
" noremap <F12> :call ToggleLocationList()<CR>
nmap <leader>lo :lopen<CR>
nmap <leader>lc :lclose<CR>
nmap <leader>co :QFix<CR>
nmap <leader>ct :QFixToggle<CR>

" 分割窗口
nmap <leader>hs :sp<CR><C-W>_
nmap <leader>vs :vsp<CR><C-W>_

" 最大化当前Split窗口
nmap <F11> :wincmd_<CR>

" 跳转到下一个Split窗口并最大化之
nmap <Tab> <C-W>j<C-W>_
nnoremap <S-Tab> <C-W>k<C-W>_

" 窗口间移动焦点
nmap <up> <C-W>k
nmap <down> <C-W>j
nmap <left> <C-W>h
nmap <right> <C-W>l

" Navigating long lines
nmap <A-j> gj
nmap <A-k> gk
imap <A-j> <C-O>gji
imap <A-k> <C-O>gki

"显示、隐藏ctags侧边栏
nmap <leader>tl :TagbarToggle<CR>
au FileType help,markdown map <buffer> <leader>tl :Unite outline<CR> 

" " 使用FuzzyFinder打开文件
" nmap <leader>o  :echo 'Do nothing ...'<CR>
" nmap <leader>oo :FufTaggedFile<CR>
" nmap <leader>of :FufFile<CR>
" nmap <leader>oc :FufCoverageFile<CR>
" nmap <leader>ot :FufTag<CR>
" nmap <leader>frc :FufRenewCache<CR>

" 删除包含选中字符串的行
nmap <leader>dl yiw:call Preserve("g/".XEscapeRegex(@")."/d")<CR>
vmap <leader>dl y:call Preserve("g/".XEscapeRegex(@")."/d")<CR>

" Handles vimrc file
" Edit private settings file
exec 'nmap <leader>pfop :new '.gbl_private_settings_file.'<CR><C-W>_'
" Edit vimrc
exec 'nmap <leader>rcop :new '.gbl_vimrc_file.'<CR><C-W>_'
" Source vimrc
exec 'nmap <leader>rcso :so '.gbl_vimrc_file.'<CR>'
" Source vimrc after it is modified
" exec 'autocmd! bufwritepost '.gbl_vimrc_name.' so '.gbl_vimrc_file
" To fix the problem that the folding method remains to be 'syntax' when open the vimrc file in a php file
exec 'autocmd! bufreadpre '.gbl_vimrc_name.' setl fdm=marker'

" TwitVim
nmap <leader>twit :PosttoTwitter<CR>
nmap <leader>twmy :UserTwitter<CR>
nmap <leader>twls :FriendsTwitter<CR>
nmap <leader>twpb :PublicTwitter<CR>
nmap <leader>twmt :MentionsTwitter<CR>
nmap <leader>twdm :DMTwitter<CR>
nmap <leader>twre :RetweetedByMeTwitter<CR>
" Add support for markdown files in tagbar.

" CTags
" nmap <leader>mkt :!ctags -R --php-kinds=cidfj -h .php.inc.lib.py.java --langmap=php:.php.inc.lib --exclude="*.js" .<CR>
nmap <leader>mkt :VimProcBang gtags && ctags -R --php-kinds=cidfj -h .php.inc.lib.py.java --langmap=php:.php.inc.lib --exclude="*.js" .<CR>

" 查看当前目录
nmap <leader>pwd :pwd<CR>

" NERDTree
nmap <leader>ntt :NERDTreeToggle<CR>
nmap <leader>ntc :NERDTreeClose<CR>
nmap <leader>nto :NERDTree<CR>
nmap <leader>ntd :NERDTree %:h<CR>

" 简繁转换
nmap <leader>g2b <ESC>:cal G2B()<CR>
nmap <leader>b2g <ESC>:cal B2G()<CR>

" DBGP
" let g:debuggerMapDefaultKeys = 2
" let g:debuggerPort = 9001

" 查找與替換
nmap <leader>ff yiw/\<<C-R>"\>\C
vmap <leader>ff y/<C-R>=XEscapeRegex(@")<CR>\C
nmap <leader>rr yiw:%s/\<<C-R>"\>\C//g<LEFT><LEFT>
vmap <leader>rr y:%s/<C-R>=XEscapeRegex(@")<CR>\C//g<LEFT><LEFT>
nmap <leader>rl yiw:s/\<<C-R>"\>\C//g<LEFT><LEFT>
vmap <leader>rl y:s/<C-R>=XEscapeRegex(@")<CR>\C//g<LEFT><LEFT>

" 编码转换
nmap <leader>fenc :set fenc<CR>
nmap <leader>gbk :set fenc=cp936<CR>
nmap <leader>utf8 :set fenc=utf-8<CR>
nmap <leader>fdos :set ff=dos<CR>
nmap <leader>edos :e ++ff=dos<CR>
nmap <leader>unix :set ff=unix<CR>

" 为xbindkeys捕获热键
if has('unix') && executable('xbindkeys')
    nmap <leader>key :let @"=system('xbindkeys -k\|tail -n 1')<CR>
endif

" Select the last pasted area
nmap <leader>V V']

" Clear highlighting of the last search
nmap <leader>cls :nohl<CR>

" Search word
if has('gui_running')
    nmap <leader>/w /\<\>\C<left><left><left><left>
else
    nmap <leader>/w /\<\>\C<left><left><left><left><left><left><left><left><left><left><left><left><left><left>
endif

" Format JSON string
nmap <leader>json :%!python -m json.tool<CR>

" Sessions
nmap <leader>os :OpenSession<Space>
nmap <leader>ss :SaveSession<Space>

" Adjust font size on the fly
map <leader>] :LargerFont<CR>
map <leader>[ :SmallerFont<CR>

" Fugitive
nmap <leader>gst :Gstatus<CR>

" Open terminal in the current path
if has('unix')
    nmap <leader>sh :call xolox#misc#os#exec({'command':'lilyterm', 'async':1})<CR>
elseif has('win32')
    nmap <leader>sh :call xolox#misc#os#exec({'command':'cmd.exe', 'async':1})<CR>
endif

" UltiSnips
nmap <leader>ue :UltiSnipsEdit<Space>

" Gundo
nmap <leader>gu :GundoToggle<CR>

" " Cscope
" " f: Find this file
" nnoremap <leader>cfa :call CscopeFindInteractive(expand('<cword>'))<CR>
" " nnoremap <leader>cl :call ToggleLocationList()<CR>
" " s: Find this C symbol
" nnoremap  <leader>cfs :call CscopeFind('s', expand('<cword>'))<CR>
" " g: Find this definition
" nnoremap  <leader>cfg :call CscopeFind('g', expand('<cword>'))<CR>
" " d: Find functions called by this function
" nnoremap  <leader>cfd :call CscopeFind('d', expand('<cword>'))<CR>
" " c: Find functions calling this function
" nnoremap  <leader>cfc :call CscopeFind('c', expand('<cword>'))<CR>
" " t: Find this text string
" nnoremap  <leader>cft :call CscopeFind('t', expand('<cword>'))<CR>
" " e: Find this egrep pattern
" nnoremap  <leader>cfe :call CscopeFind('e', expand('<cword>'))<CR>
" " f: Find this file
" nnoremap  <leader>cff :call CscopeFind('f', expand('<cword>'))<CR>
" " i: Find files #including this file
" nnoremap  <leader>cfi :call CscopeFind('i', expand('<cword>'))<CR>

" RabbitVCS
if IsPlatform('unix')
    map <leader>rbu :silent !rabbitvcs update<CR>
    map <leader>rbc :silent !rabbitvcs commit<CR>
    map <leader>rbll :silent !rabbitvcs log<CR>
    map <leader>rblL :silent !rabbitvcs log %<CR>
    map <leader>rbr :silent !rabbitvcs revert %<CR>
elseif IsPlatform('mac')
    map <leader>rbu :!svn update<CR>
    map <leader>rbc :silent !svnx<CR>
endif

" incsearch.vim
if !IsPlatform('mac')
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
endif

" repeat last command
nmap <leader>!! :<up><CR>

" CtrlP
nmap <leader>ot :CtrlPTag<CR>
nmap <leader>bt :CtrlPBufTag<CR>

" remap c-z ctrl-z suspend stop
map <c-s-z> :st<CR>
"}}}

" ------------------------------ Functions -----------------------------{{{

if IsPlatform('win')
    set diffexpr=MyDiff()
endif
function! MyDiff()"{{{
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            let cmd = '""' . $VIMRUNTIME . '\diff"'
            let eq = '"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction"}}}

" Open a temporary Python file in a new window
function! PySandBox()"{{{
    let tmpfile = tempname().'.py'
    exe 'new '.tmpfile
    call setline('.', '#!/usr/bin/python2')
    normal o
    call setline('.', '# -*- coding: utf-8 -*-')
    normal o
    startinsert
endfunction"}}}
nmap <leader>sbpy :call PySandBox()<CR>

function! TextEnableCodeSnip(filetype, start, end, textSnipHl) abort"{{{
    let ft=toupper(a:filetype)
    let group='textGroup'.ft
    if exists('b:current_syntax')
        let s:current_syntax=b:current_syntax
        " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
        " do nothing if b:current_syntax is defined.
        unlet b:current_syntax
    endif
    execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
    try
        execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
    catch
    endtry
    if exists('s:current_syntax')
        let b:current_syntax=s:current_syntax
    else
        unlet b:current_syntax
    endif
    execute 'syntax region textSnip'.ft.' matchgroup='.a:textSnipHl.' start="'.a:start.'" end="'.a:end.'" contains=@'.group
endfunction"}}}

function! MaximizeWindow()"{{{
    "silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
    silent !wmctrl -r :ACTIVE: -b add,fullscreen
endfunction"}}}

" Save the current buffer as a file with no EOF sign.
function! SaveAsNOEOF(filename)"{{{
    let a=getline(1,line('$')-1)
    let b=map(a, 'iconv(v:val,"'.&enc.'","'.&fenc.'") . nr2char(13)')
    call extend(b, getline('$', '$'))
    call writefile(b,a:filename, 'b')
    if a:filename == bufname('%')
        set nomodified
    endif
endfunction"}}}
" Save the current buffer and get rid of the EOF sign.
function! SaveNOEOF()"{{{
    call SaveAsNOEOF(bufname('%'))
endfunction"}}}
command! -complete=file -nargs=0 SaveNOEOF :call SaveNOEOF()
command! -complete=file -nargs=1 SaveAsNOEOF :call SaveAsNOEOF(<q-args>)
autocmd! BufWriteCmd */turbocrm*,version*.txt,*/CRM7_VOB/* call SaveNOEOF()

" Set the current buffer to use utf-8 encoding and unix format
function! SetUnixFF()"{{{
    set fenc=utf-8
    set ff=unix
endfunction"}}}
command! -nargs=0 SetUnixFF call SetUnixFF()
" Set the current buffer to use GBK encoding and dos format
function! SetDOSFF()"{{{
    set fenc=cp936
    set ff=dos
endfunction"}}}
command! -nargs=0 SetDOSFF call SetDOSFF()

" ptag wrapper
function! PTagIt()"{{{
    exec "ptag ".expand("<cword>")
    let cwin = winnr()
    silent! wincmd P
    let lnr = line('.')
    if lnr < 3
        return
    endif

    if foldlevel('.')>0
        normal zo
    endif

    let chead = 0
    let linestr = getline(lnr-1)
    if linestr =~ '^\s*\*/'
        let ptr = lnr-2
        while ptr>0
            let linestr = getline(ptr)
            if linestr =~ '^\s*/\*'
                let chead = ptr
                break
            endif
            let ptr = ptr-1
        endwhile
    endif

    if chead>0
        exec 'resize '.(lnr-chead+1)
        exec 'normal '.chead."z\<CR>"
        exec 'normal '.lnr.'G'
    endif

    exec cwin.'wincmd w'
endfunction"}}}
nmap <leader>pp :call PTagIt()<CR>
nmap <leader>pc :pclose<CR>

" Wipe all buffers which are not active (i.e. not visible in a window/tab)
command! -nargs=0 Prune call CloseFugitiveBuffers()
function! CloseFugitiveBuffers()"{{{
    let visible = {}
    for t in range(1, tabpagenr('$'))
        for b in tabpagebuflist(t)
            let visible[b] = 1
        endfor
    endfor
    let l:tally = 0
    for b in range(1, bufnr('$'))
        if bufloaded(b) && !has_key(visible, b)
            let l:tally += 1
            exe 'bw ' . b
        endif
    endfor
    echon "Deleted " . l:tally . " buffers"
endfunction"}}}

" 执行命令并回到原位置
function! Preserve(command)"{{{
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction"}}}
" 清除行尾空格
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
" 美化缩进
nmap _= :call Preserve("normal gg=G")<CR>
" 替换Tab为4个空格
nmap _<TAB> :call Preserve("%s/\\t/    /g")<CR>

" 转义正则表达式特殊字符，以便在正则表达式中使用
" a:1   是否转义为vimgrep的pattern格式，1，2
" a:2   是否用shellescape()转义，1是转义，2是转义并去掉两侧单引号
function! XEscapeRegex(str, ...)"{{{
    let pattern = a:str
    let pattern = escape(pattern, '/\.*$^~[]"')

    if a:0 && a:1
        let pattern = escape(pattern, '()+?')
        if a:1 == 2
            let pattern = escape(pattern, '\')
        endif
    endif

    if a:0 > 1 && a:2
        let pattern = shellescape(pattern)
        if a:2 == 2
            let pattern = pattern[1:-2]
        endif
    endif

    let whitespacePattern = a:0 && a:1 ? '\\s\+' : '\\s\\+'
    let pattern = substitute(pattern, '\s\+', whitespacePattern, 'g')

    return pattern
endfunction"}}}

" Display contents of the current fold in a balloon
function! FoldSpellBalloon()"{{{
    let foldStart = foldclosed(v:beval_lnum)
    let foldEnd = foldclosedend(v:beval_lnum)
    let lines = []
    " Detect if we are in a fold
    if foldStart < 0
        " Detect if we are on a misspelled word
        let lines = spellsuggest( spellbadword(v:beval_text)[ 0 ], 5, 0 )
    else
        " we are in a fold
        let numLines = foldEnd - foldStart + 1
        " if we have too many lines in fold, show only the first 14
        " and the last 14 lines
        if ( numLines > 31 )
            let lines = getline( foldStart, foldStart + 14 )
            let lines += [ '-- Snipped ' . ( numLines - 30 ) . ' lines --' ]
            let lines += getline( foldEnd - 14, foldEnd )
        else
            "less than 30 lines, lets show all of them
            let lines = getline( foldStart, foldEnd )
        endif
    endif
    " return result
    return join( lines, has( "balloon_multiline" ) ? "\n" : " " )
endfunction"}}}
if has('balloon_eval')
    set balloonexpr=FoldSpellBalloon()
    set ballooneval
endif

" Toggle quickfix and location list
function! QFixToggle(forced)"{{{
    if exists("g:qfix_win") && a:forced != 0
        QFix
        cclose
    else
        if exists("g:my_quickfix_win_height")
            execute "botright copen ".g:my_quickfix_win_height
        else
            copen
        endif
    endif
endfunction"}}}
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
command! -bang -nargs=? QFixToggle call QFixToggle(<bang>1)

" used to track the quickfix window
augroup QFixToggle"{{{
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END"}}}
function! GetBufferList()"{{{
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction"}}}
function! ToggleList(bufname, pfx)"{{{
    let buflist = GetBufferList()
    for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
        echo bufnum
        if bufwinnr(bufnum) != -1
            exec(a:pfx.'close')
            return
        endif
    endfor
    if a:pfx == 'l' && len(getloclist(0)) == 0
        echohl ErrorMsg
        echo "Location List is Empty."
        return
    endif
    " let winnr = winnr()
    let cmdMod = ''
    if a:pfx == 'c'
        let cmdMod = 'botright '
    endif
    exec(cmdMod.a:pfx.'open')
    " if winnr() != winnr
        " wincmd p
    " endif
endfunction"}}}
noremap <F12> :call ToggleList("Location 列表", 'l')<CR>
noremap <C-F12> :call ToggleList("Quickfix 列表", 'c')<CR>

" Fold text
set foldtext=CustomFoldText()
fu! CustomFoldText()"{{{
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = " ".repeat("-", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf"}}}

" Show commit history of the current file under the given VCS in a new window
function! ShowCommitHistory(vcs)"{{{
    " Check parameter
    if a:vcs != 'svn' && a:vcs != 'git'
        echoerr 'Unknow VCS: '.a:vcs
        return
    endif

    " Do the dirty work
    let fileName = expand('%')
    if !empty(fileName)
        exe 'new'
        if a:vcs == 'svn'
            exe 'r !svn log --diff --internal-diff '.fileName
        elseif a:vcs == 'git'
            exe 'r !git log -p '.fileName
        endif
    else
        echo 'File not found.'
    endif
endfunction"}}}
nnoremap <leader>ssch :call ShowCommitHistory('svn')<CR>
nnoremap <leader>gsch :call ShowCommitHistory('git')<CR>

" open an item in quickfix or location list in a new tab
function! OpenQuickfixInNewTab()"{{{
    let tmpSwitchbuf = &switchbuf
    set switchbuf=newtab
    exe "normal \<CR>"
    exe 'set switchbuf='.tmpSwitchbuf
endfunction"}}}
au BufWinEnter * if &buftype=='quickfix'|noremap <buffer> <C-T> :call OpenQuickfixInNewTab()<CR>|endif

" translate the word under cursor
fun! SearchWord()"{{{
    echo system('ydcv --', expand("<cword>"))
endfun"}}}
" translate selected text
fun! SearchWord_v(type, ...)"{{{
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@

    if a:0
        silent exe "normal! `<" . a:type . "`>y"
    elseif a:type == 'line'
        silent exe "normal! '[V']y"
    elseif a:type == 'block'
        silent exe "normal! `[\<C-V>`]y"
    else
        silent exe "normal! `[v`]y"
    endif

    echo system('ydcv --', @@)

    let &selection = sel_save
    let @@ = reg_save
endfun"}}}
nnoremap <Leader>df :call SearchWord()<CR>
vnoremap <Leader>df :<C-U>call SearchWord_v(visualmode(), 1)<CR>

" remap n/N to nzz/Nzz in a nice way
function! s:nice_next(cmd)
  let view = winsaveview()
  execute "normal! " . a:cmd
  if view.topline != winsaveview().topline
    normal! zz
  endif
endfunction

nnoremap <silent> n :call <SID>nice_next('n')<CR>
nnoremap <silent> N :call <SID>nice_next('N')<CR>
"}}}

" ------------------------------ Java -----------------------------{{{
" Javadoc comments (/** and */ pairs) and code sections (marked by {} pairs) mark the start and end of folds. All other
" lines simply take the fold level that is going so far.
function! MyFoldLevel( lineNumber )
  let thisLine = getline( a:lineNumber )
  " If the entire Javadoc comment or the {} pair is on one line, then don't create a fold for it.
  if ( thisLine =~ '\%(\%(/\*\*\).*\%(\*/\)\)\|\%({.*}\)' )
    return '='
  elseif ( thisLine =~ '\%(^\s*/\*\*\s*$\)\|{' )
    return "a1"
  elseif ( thisLine =~ '\%(^\s*\*/\s*$\)\|}' )
    return "s1"
  endif
  return '='
endfunction
" setlocal foldexpr=MyFoldLevel(v:lnum)
" setlocal foldmethod=expr
"}}}

" ------------------------------ Python -----------------------------{{{
au filetype python map <buffer> <F5> :call StartPDB()<CR>
au filetype python map <buffer> <S-F5> :call StopPDB()<CR>
au filetype python map <buffer> <F6> :Cstep<CR>
au filetype python map <buffer> <F7> :Cnext<CR>
au filetype python map <buffer> <S-N> :Cnext<CR>
au FileType python map <buffer> <A-CR> :python runScript()<CR>
au filetype python nmap <buffer> <C-CR> :call ExecutePythonScript()<CR>
au filetype python imap <buffer> <C-CR> <ESC><C-CR>
au FileType python set formatprg=PythonTidy.py
" au FileType python autocmd BufWritePre <buffer> let s:saveview = winsaveview() | exe '%!PythonTidy.py' | call winrestview(s:saveview) | unlet s:saveview

" Start pyclewn
function! StartPDB()"{{{
    Pyclewn pdb %:p
    sleep 1100m
    Cmapkeys
endfunction"}}}

" Stop pyclewn
function! StopPDB()"{{{
    Cunmapkeys
    Cquit
    sleep 100m
    let nr = bufnr('(clewn)_console')
    if nr>0
        exec 'bdelete '.nr
    endif
    e
endfunction"}}}

" Run a python script
function! ExecutePythonScript()"{{{
    if &filetype != 'python'
        echohl WarningMsg | echo 'This is not a Python file !' | echohl None
        return
    endif
    if IsPlatform(['win','mac'])
        setlocal makeprg=python\ -u\ %
    else
        setlocal makeprg=python2\ -u\ %
    endif
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    echohl WarningMsg | echo 'Execution output:' | echohl None
    if &modified == 1
        silent write
    endif
    silent make
    clist
endfunction"}}}

" Run python code snippets
python <<EOF
def runScript():
    script="\n".join([line for line in vim.current.buffer])
    exec script
EOF

"}}}

" ------------------------------ Go -----------------------------{{{
au FileType go map <buffer> <C-CR> :silent write \| !go run %<CR>
au FileType go imap <buffer> <C-CR> <Esc><C-CR>
let g:gofmt_command = "goimports"
"}}}

" ------------------------------ PHP -----------------------------{{{
" PHP folding method
let php_folding=2
let php_large_file=0

au FileType php set formatprg=php_beautifier\ -l\ \"ArrayNested()\"
au FileType php nnoremap <buffer> <A-F12> :call Preserve("normal gggqG")<CR>
au FileType php vnoremap <buffer> <A-F12> gq
" PHP filetype
au BufNewFile,BufRead *.lib,*.inc set filetype=php
au FileType php set complete+=k,set dict=$VIMRUNTIME/api/php.dict
au FileType php set keywordprg="help"
au FileType php set iskeyword=@,48-57,_,128-167,224-235
if IsPlatform('win')
    au FileType php set runtimepath+=$VIM\php
else
    au FileType php set runtimepath+=~/.vim/api/php
endif
au FileType php set fdl=1

" pdv
let g:pdv_template_dir = $HOME ."/.vim/addons/github-tobyS-pdv/templates_snip"
au FileType php nnoremap <buffer> <leader>\\ :call pdv#DocumentWithSnip()<CR>
" nnoremap <buffer> <C-\> :call pdv#DocumentCurrentLine()<CR>

" Run a PHP script
function! ExecutePHPScript()"{{{
    if &filetype != 'php'
        echohl WarningMsg | echo 'This is not a PHP file !' | echohl None
        return
    endif
    setlocal makeprg=php\ -f\ %
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    echohl WarningMsg | echo 'Execution output:' | echohl None
    if &modified == 1
        silent write
    endif
    silent make
    clist
endfunction"}}}
au filetype php map <buffer> <C-F5> :call ExecutePHPScript()<CR>
au filetype php imap <buffer> <C-F5> <C-O>:call ExecutePHPScript()<CR>

" Check the syntax of a PHP file
function! CheckPHPSyntax()"{{{
    if &filetype != 'php'
        echohl WarningMsg | echo 'This is not a PHP file !' | echohl None
        return
    endif
    setlocal makeprg=php\ -l\ -n\ -d\ html_errors=off\ %
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    echohl WarningMsg | echo 'Syntax checking output:' | echohl None
    if &modified == 1
        silent write
    endif
    silent make
    clist
endfunction"}}}
au filetype php map <buffer> <A-F5> :call CheckPHPSyntax()<CR>
au filetype php imap <buffer> <A-F5> <C-O>:call CheckPHPSyntax()<CR>

" Open a temporary PHP file in a new window
function! PHPSandBox()"{{{
    let tmpfile = tempname().'.php'
    exe 'new '.tmpfile
    call setline('.', '<?php')
    normal o
    " normal o
    " call setline('.', '?>')
    " normal k
    startinsert
endfunction"}}}
nmap <leader>sbph :call PHPSandBox()<CR>

" 强制使用HTML的注释
function! ForceHTMLComment(mode, type) range
    set ft=html
    if a:mode == "x"
        execute a:firstline.",".a:lastline."call NERDComment(\"x\", \"".a:type."\")"
    else
        if a:type == "Sexy"
            normal ,cs
        else
            normal ,cc
        endif
    endif
    set ft=php
endfunction
au FileType php nmap <buffer> <leader>fhcc :call ForceHTMLComment("n", "Comment")<CR>
au FileType php vmap <buffer> <leader>fhcc :call ForceHTMLComment("x", "Comment")<CR>
au FileType php nmap <buffer> <leader>fhcs :call ForceHTMLComment("n", "Sexy")<CR>
au FileType php vmap <buffer> <leader>fhcs :call ForceHTMLComment("x", "Sexy")<CR>
au FileType php nmap <buffer> <leader>fhcu :call ForceHTMLComment("n", "Uncomment")<CR>
au FileType php vmap <buffer> <leader>fhcu :call ForceHTMLComment("x", "Uncomment")<CR>

" phpqa
let g:phpqa_codesniffer_autorun = 0        "  default =1 on save
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codesniffer_args = "--standard=$HOME/.phpcs_ruleset.xml"
" let g:phpqa_codesniffer_cmd  = '/usr/bin/phpcs' 
let g:phpqa_messdetector_ruleset = "~/.phpmd_ruleset.xml"
" let g:phpqa_messdetector_cmd = '/usr/bin/phpmd'
"}}}
