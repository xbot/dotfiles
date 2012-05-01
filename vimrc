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

call pathogen#runtime_append_all_bundles()
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
language message zh_CN.UTF-8

" map <leader>
let mapleader=","

" Environment settings
if IsPlatform('win')
    set rtp-=$HOME/vimfiles
endif

" Generic declarations
let gbl_ultrablog_debug = 0
" Platform specific declarations
if IsPlatform('win')
    let gbl_private_settings_file=expand($VIM.'/vimfiles/private.vim')
    let gbl_vimrc_name = '_vimrc'
    let gbl_vimrc_file = 'D:\\My\ Dropbox\'.gbl_vimrc_name
    let gbl_ultrablog_db = 'D:\\My\ Dropbox\UltraBlog.db'
else
    let gbl_private_settings_file = expand('~/.vim/private.vim')
    let gbl_vimrc_name = '.vimrc'
    let gbl_vimrc_file = expand('~/'.gbl_vimrc_name)
    let gbl_ultrablog_db = '~/Dropbox/UltraBlog.db'
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
source $VIMRUNTIME/mswin.vim
behave mswin
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Load private settings
if filereadable(gbl_private_settings_file)
    exec 'source '.gbl_private_settings_file
else
    echoerr 'gbl_private_settings_file is not readable, some functions may not work.'
endif
"}}}

" ------------------------- Application Settings ------------------------"{{{
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
set grepprg=grep
set clipboard+=unnamed
set mouse=a
set vb t_vb=
set laststatus=2
set updatetime=10000
set cursorline
set cursorcolumn
"}}}

" --------------------------- GUI Settings ------------------------------"{{{
if has('gui_running')
    " Font settings
    if IsPlatform('win')
        if 1==1
            set background=light
        else
            set background=dark
        endif

        "let g:zenesque_colors = 1
        "colorscheme zenesque

        colorscheme solarized
        "colorscheme lucius
        "colorscheme diablo3
        "colorscheme dante

        "set guifont=Consolas:h11:b
        set guifont=Monaco:h10:b
        "set guifont=XHei\ Mono:h11:b
    elseif has('gui_macvim')
        set guifont=Monaco:h14

        if 1==0
            set background=light
        else
            set background=dark
        endif

        colorscheme solarized
    else
        if 1==0
            set background=light
        else
            set background=dark
        endif

        colorscheme solarized
        "set guifont=YaHei\ Consolas\ Hybrid\ Bold\ 13
        set guifont=Monaco\ 11
        "set guifont=inconsolata\ Bold\ 13
        "set guifontwide=YaHei\ Consolas\ Hybrid\ 12
        "set guifontwide=DeJaVu\ Sans\ Yuan\ Ti\ Bold\ 13
        "set guifont=Consolas\ Bold\ 13
        "set guifont=Consolas\ 13
        set guifontwide=DeJaVu\ Sans\ Yuan\ Ti\ 13
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
    map <silent> <F2> :if &guioptions =~# 'm' <Bar>
                \set guioptions-=m <bar>
                \else <Bar>
                \set guioptions+=m <Bar>
                \endif<CR>
else
    set background=dark
    "colorscheme diablo3
    colorscheme jellybeans
endif
"}}}

"-----------------------------Plugins Settings--------------------------{{{
" PHP folding method
let php_folding=2
let php_large_file=0

" Tagbar
if IsPlatform('win')
    let g:tagbar_ctags_bin = $VIM.'\addons\binary-utils\dist\bin\ctags.exe'
elseif has('gui_macvim')
    let g:tagbar_ctags_bin='/usr/local/bin/ctags'
endif
let g:tagbar_compact = 1
let g:tagbar_usearrows = 1
let g:tagbar_width = 30
let g:tagbar_autofocus = 1

" FencView settings
let g:fencview_autodetect=0
let g:fencview_checklines=10
let g:fencview_auto_patterns='*.txt,*.htm{l\=},*.php,*.lib,*.inc,*.sql'

" NeoComplCache Settings
if IsPlatform('win')
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_disable_auto_complete = 1
else
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_disable_auto_complete = 1
endif
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_cursor_hold_i_time=10000

" SuperTab Settings
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'

" SnipMate Settings
let g:snips_author = 'Lenin Lee <lenin.lee@gmail.com>'

" EasyGrep Settings
let g:EasyGrepRecursive = 1
let g:EasyGrepCommand = 1
let g:EasyGrepJumpToMatch = 0
let g:EasyGrepWindow = 1

" Pydiction Settings
if IsPlatform('win')
    let g:pydiction_location = 'D:/Program Files/vim/vimfiles/bundle/pydiction/ftplugin/complete-dict'
else
    let g:pydiction_location = '~/.vim/bundle/pydiction/ftplugin/complete-dict'
endif

" SQL Type Default
let g:sql_type_default = 'sqlsvr'

" FuzzyFinder Settings
let g:fuf_enumeratingLimit = 30
let g:fuf_modesDisable = [ 'mrufile', 'mrucmd', ]
let g:fuf_dataDir = '~/.vim-fuf-data'

" NERD_commenter Settings
let NERDSpaceDelims = 1

" NERD Tree
let NERDTreeIgnore=['\.scc$', '\.pyc$', '\~$']

" TwitVim
let twitvim_enable_python = 1
let twitvim_proxy = "127.0.0.1:2010"
if IsPlatform('win')
    let twitvim_browser_cmd = "D:/Program Files/Mozilla Firefox/firefox.exe"
elseif has('gui_macvim')
    let twitvim_browser_cmd="/Applications/Firefox.app/Contents/MacOS/firefox"
else
    let twitvim_browser_cmd = "firefox"
endif

if IsPlatform('win')
    let g:netrw_http_cmd = $VIM.'\addons\binary-utils\dist\bin\curl.exe -o'
endif

if IsPlatform('win')
    let g:pydoc_cmd = "python C:\\Python27\\Lib\\pydoc.py"
endif

let ub_debug = 0
let ub_use_ubviewer = 1
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
let ub_hotkey_save_current_item='<leader>w'
let ub_tmpl_img_url = '<a href="%(url)s"><img src="%(url)s"></a>'
let ub_socket_timeout = 30
if gbl_ultrablog_debug == 1
    let ub_blog = {'login_name':gbl_wordpress_login,
                \'password':gbl_wordpress_password,
                \'url':'http://localhost/wordpress',
                \'db':'~/Dropbox/UltraTest.db'
                \}
    let ub_local_pagesize = 2
else
    let ub_blog = {'login_name':'admin',
                \'password':gbl_sinolog_password,
                \'url':'http://0x3f.org',
                \'db':gbl_ultrablog_db
                \}
endif

" shell.vim
let g:shell_mappings_enabled=0

" session.vim
let g:session_autoload = 'no'

" DirDiff
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,.svn,.git,assets,tags"

" Colorizer
let g:colorizer_auto_filetype='css,html'
"}}}

"-----------------------------Auto Commands------------------------------"{{{
if IsPlatform('win')
    au GUIEnter * simalt ~x
else
    au GUIEnter * call MaximizeWindow()
endif

if IsPlatform('win')
    au VimEnter *.* cd %:h
endif

" PHP filetype
au BufNewFile,BufRead *.lib,*.inc set filetype=php
au FileType php set complete+=k,set dict=$VIMRUNTIME/api/php.dict
au FileType php set keywordprg="help"
au FileType php set iskeyword=@,48-57,_,128-167,224-235

" Javascript filetype
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl foldlevel=0
au BufRead *.pac setl filetype=javascript
au BufRead *.pac setl foldlevel=1

" Devilspie
au BufNewFile,BufRead *.ds set filetype=lisp

" Markdown
augroup markdown
    autocmd BufNewFile,BufRead *.mkd set filetype=markdown
    autocmd BufNewFile,BufRead *.mkd set wrap
augroup END

" Don't use Ex mode, use Q for formatting
map Q gq

" Fix the problem that vim on linux takes C-style commentstring to comment fold markers in vim scripts
" This problem is found only on my linux, it should be checked out that what reason causes such a problem
au FileType vim set commentstring=\"%s

" Python
au FileType python set fdm=indent

" Plain text
au BufNewFile,BufRead *.txt set wrap
" Dokuwiki
au BufNewFile,BufRead *.doku set ft=dokuwiki

" Bash
au FileType sh set fdm=syntax
let g:sh_fold_enabled=1

" Auto handle resources
if IsPlatform('unix')
    autocmd! BufWritePost,FileWritePost .xbindkeysrc silent !killall xbindkeys > /dev/null 2>&1 ; xbindkeys > /dev/null 2>&1
    autocmd! BufWritePost,FileWritePost .Xdefaults   silent !xrdb ~/.Xdefaults
endif

" Vimperator
au BufRead .vimperatorrc setl filetype=vimperator

au FileType sql set synmaxcol=0

au WinLeave * if &buftype=='quickfix' | lclose | endif
"}}}

"-----------------------------Key mappings-------------------------------"{{{
"普通退出，全部退出，强制退出，强制全部退出
nmap <leader>q :q<CR>
nmap <leader>qq :q<CR>
nmap <leader>qa :qa<CR>
nmap <leader>qf :q!<CR>
nmap <leader>qaf :qa!<CR>

"保存
nmap <leader>w :w<CR>
map <C-S> <Esc><leader>w
nmap <leader>fs :w!<CR>
nmap <leader>x :x<CR>
nmap <Space> <Pagedown>

" 打开、关闭quickfix窗口
nmap <leader>co :QFix<CR>
nmap <leader>ct :QFixToggle<CR>

" 打开、关闭location窗口
nmap <leader>lo :lopen<CR>
nmap <leader>lc :lclose<CR>

" 分割窗口
nmap <leader>sp :sp<CR><C-W>_

" 最大化当前Split窗口
nmap <F11> :wincmd_<CR>

" 跳转到下一个Split窗口并最大化之
nmap <Tab> <C-W>j<C-W>_
nmap <S-Tab> <C-W>k<C-W>_

" Navigating long lines
nmap <A-j> gj
nmap <A-k> gk
imap <A-j> <ESC>gji
imap <A-k> <ESC>gki

"显示、隐藏ctags侧边栏
"nmap <leader>tl :TlistToggle<CR>
nmap <leader>tl :TagbarToggle<CR>

" 使用FuzzyFinder打开文件
nmap <leader>o  :echo 'Do nothing ...'<CR>
nmap <leader>oo :FufTaggedFile<CR>
nmap <leader>of :FufFile<CR>
nmap <leader>ot :FufTag<CR>

" 启用、禁用NeoComplCache
nmap <leader>cmple :NeoComplCacheEnable<CR>
nmap <leader>cmpld :NeoComplCacheDisable<CR>

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
exec 'autocmd! bufwritepost '.gbl_vimrc_name.' so '.gbl_vimrc_file
" To fix the problem that the folding method remains to be 'syntax' when open the vimrc file in a php file
exec 'autocmd! bufreadpre '.gbl_vimrc_name.' setl fdm=marker'

" Twitter
nmap <leader>twit :PosttoTwitter<CR>
nmap <leader>twmy :UserTwitter<CR>
nmap <leader>twls :FriendsTwitter<CR>
nmap <leader>twpb :PublicTwitter<CR>
nmap <leader>twmt :MentionsTwitter<CR>
nmap <leader>twdm :DMTwitter<CR>
nmap <leader>twre :RetweetedByMeTwitter<CR>

" CTags
"nmap <leader>mkt :!ctags -R --php-kinds=cidfj -h .php.inc.lib.js.py.java --langmap=php:.php.inc.lib --exclude=*.pas .<CR>
nmap <leader>mkt :call xolox#shell#execute('ctags -R --php-kinds=cidfj -h .php.inc.lib.js.py.java --langmap=php:.php.inc.lib --exclude=*.pas .', 0)<CR>

" 手工设置当前文件所在的目录为工作目录
nmap <leader>pwd :pwd<CR>
nmap <leader>mwd :call MakeWorkingDir()<CR>
function! MakeWorkingDir()"{{{
    cd %:h
    cd %:h
    pwd
endfunction"}}}

" 切换到工程根目录
nmap <leader>ret :call XRetreat()<CR>
function! XRetreat()"{{{
    "call MakeWorkingDir()
    let currPath = expand('%:p:h')
    let endPos = matchend(currPath, 'turbocrm[0-9]*[/\\]code')
    if endPos>=0
        exe 'cd '.fnameescape(strpart(currPath,0,endPos))
    endif
    pwd
endfunction"}}}

" NERDTree
nmap <leader>ntt :NERDTreeToggle<CR>
nmap <leader>ntc :NERDTreeClose<CR>
nmap <leader>nto :NERDTree<CR>

" UltraBlog
nmap <leader>ub :UB
nmap <leader>ubls :UBList
nmap <leader>ubnw :UBNew
nmap <leader>ubpv :UBPreview
nmap <leader>ubsv :UBSave<CR>
nmap <leader>ubsd :UBSend
nmap <leader>ubop :UBOpen
"nmap <F5> :UBRefresh<CR>

" 简繁转换
nmap <leader>g2b <ESC>:cal G2B()<CR>
nmap <leader>b2g <ESC>:cal B2G()<CR>

" DBGP
let g:debuggerMapDefaultKeys=2
let g:debuggerPort = 9001

" 查找與替換
nmap <leader>ff yiw/<C-R>"\C
vmap <leader>ff y/<C-R>=XEscapeRegex(@")<cr>\C
nmap <leader>rr yiw:%s/<C-R>"\C//g<LEFT><LEFT>
vmap <leader>rr y:%s/<C-R>=XEscapeRegex(@")<cr>\C//g<LEFT><LEFT>

" 编码转换
nmap <leader>fenc :set fenc<CR>
nmap <leader>gbk :set fenc=cp936<CR>
nmap <leader>utf8 :set fenc=utf-8<CR>
nmap <leader>dos :set ff=dos<CR>
nmap <leader>unix :set ff=unix<CR>

" 为xbindkeys捕获热键
if has('unix')
    nmap <leader>key :let @"=system('xbindkeys -k\|tail -n 1')<cr>
endif

" Select the last pasted area
nmap <leader>V V']

" Clear highlighting of the last search
nmap <leader>cls :nohl<CR>
"}}}

" ----------------------------- Functions -----------------------------{{{
function! JavaScriptFold()"{{{
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction"}}}

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

" 生成英文的日期、时间字符串
function! GetTimeInfo()"{{{
    language time C
    let tmpTimeInfo = strftime('%Y-%m-%d %A %H:%M:%S')
    if IsPlatform('win')
        language time chinese_china
    else
        language time zh_CN.UTF-8
    endif
    return tmpTimeInfo
endfunction"}}}
nmap <silent> <leader>full a<C-R>=GetTimeInfo()<CR><ESC>
imap <silent> <C-B>time <C-R>=GetTimeInfo()<CR>

" 插入客户化添加注释
function! InsertCustAddComment()"{{{
    call setline('.',"//CUST-BEGIN ADD BY LINUS IN ".GetTimeInfo())
    normal ==o
    call setline('.',"//CUST-END")
    normal ==O
    call setline('.',".")
    normal ==$x
    startinsert!
endfunction"}}}
nmap <leader>cadd :call InsertCustAddComment()<CR>
imap <C-B>add <Esc>,cadd

"为指定的范围内的代码块添加客户化注释（删除、修改）
"mode:0是删除；1是修改；
function! InsertCustComment(firstLine, lastLine, mode)"{{{
    "校验范围是否在当前Buffer的总行数之内
    if a:firstLine < 1 || a:lastLine > line('$')
        echoerr 'InsertCustComment : Range overflow !(FirstLine:'.a:firstLine.';LastLine:'.a:lastLine.';ValidRange:1~'.line('$').')'
        return ''
    endif

    "校验是修改还是删除
    if a:mode != 0 && a:mode != 1
        echoerr 'InsertCustComment : Invalid mode !'
        return ''
    endif

    " 跳转到指定区域的第一行，开始操作
    exe 'normal '.a:firstLine.'GO'
    let modeStr = ''
    " 判断是MOD还是DEL
    if a:mode == 0
        let modeStr = 'DEL'
    else
        let modeStr = 'MOD'
    endif
    call setline('.', '//CUST-BEGIN '.modeStr.' BY LINUS IN '.GetTimeInfo())
    normal ==o
    " 如果是修改，显示FROM，并复制要修改的部分，以备后面引用
    if a:mode == 1
        call setline('.', '//FROM')
        normal ==j
        exe 'normal '.(a:lastLine-a:firstLine+1).'yyO'
    endif
    " 注释掉要修改的部分
    call setline('.', '/*')
    exe 'normal =='.(a:lastLine-a:firstLine+1).'jo'
    call setline('.', '*/')
    normal ==o
    " 如果是修改，显示TO，并粘贴要修改的内容
    if a:mode == 1
        call setline('.', '//TO')
        normal ==p
        if (a:lastLine-a:firstLine) > 0
            exe 'normal '.(a:lastLine-a:firstLine).'j'
        endif
        normal o
    endif
    call setline('.', '//CUST-END')

    " 跳转光标
    let gotoLn = 0
    if a:mode == 0
        let gotoLn = a:firstLine
    else
        let gotoLn = a:firstLine
    endif
    exe 'normal =='.gotoLn.'G'
endfunction"}}}

"Normal模式下针对单行、指定范围的多行、指定单边范围的多行插入客户化删除注释
function! InsertCustCommentN(mode, instant)"{{{
    let firstLine = 0
    let lastLine = 0

    "如果针对单行……
    if a:instant
        let firstLine = line('.')
        let lastLine = line('.')
        "如果针对多行
    else
        let rangeStr = input('Tell me the range : ')
        "如果输入的是一个整数，根据它与当前行行号的大小判定范围
        if rangeStr =~ '^\d\+$'
            if rangeStr >= line('.')
                let firstLine = line('.')
                let lastLine = rangeStr
            else
                let firstLine = rangeStr
                let lastLine = line('.')
            endif
            "如果输入的是“3,18”这样的字符串，根据两个数的大小判定范围
        elseif rangeStr =~ '^\d\+,\d\+$'
            let rangeInfo = split(rangeStr, ',')
            if rangeInfo[0] >= rangeInfo[1]
                let firstLine = rangeInfo[1]
                let lastLine = rangeInfo[0]
            else
                let firstLine = rangeInfo[0]
                let lastLine = rangeInfo[1]
            endif
            "输入的参数不正确
        else
            echoerr 'InsertCustDelCommentN : Wrong range !'
        endif
    endif

    "针对给定范围进行插入操作
    call InsertCustComment(firstLine, lastLine, a:mode)
endfunction"}}}
nmap <leader>xdel :call InsertCustCommentN(0, 0)<CR>
nmap <leader>cdel :call InsertCustCommentN(0, 1)<CR>
nmap <leader>xmod :call InsertCustCommentN(1, 0)<CR>
nmap <leader>cmod :call InsertCustCommentN(1, 1)<CR>

"Visual和Select模式下插入客户化删除注释
function! InsertCustDelCommentV() range
    call InsertCustComment(a:firstline, a:lastline, 0)
endfunction
vmap <leader>cdel :call InsertCustDelCommentV()<CR>

"Visual、Select模式下针对选定范围内的代码插入客户化修改注释
function! InsertCustModCommentV() range
    call InsertCustComment(a:firstline, a:lastline, 1)
endfunction
vmap <leader>cmod :call InsertCustModCommentV()<CR>

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
au filetype php map <C-F5> :call ExecutePHPScript()<CR>
au filetype php imap <C-F5> <ESC>:call ExecutePHPScript()<CR>

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
"au filetype php map <F5> :call CheckPHPSyntax()<CR>
"au filetype php imap <F5> <ESC>:call CheckPHPSyntax()<CR>

" Open a temporary PHP file in a new window
function! PHPSandBox()"{{{
    let tmpfile = tempname().'.php'
    exe 'new '.tmpfile
    call setline('.', '<?php')
    normal o
    normal o
    call setline('.', '?>')
    normal k
    startinsert
endfunction"}}}
" Open a temporary Python file in a new window
function! PySandBox()"{{{
    let tmpfile = tempname().'.py'
    exe 'new '.tmpfile
    call setline('.', '#!/usr/bin/python')
    normal o
    call setline('.', '# -*- coding: utf-8 -*-')
    normal o
    startinsert
endfunction"}}}
nmap <leader>sbpy :call PySandBox()<CR>
nmap <leader>sbph :call PHPSandBox()<CR>

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

function! MaximizeWindow()
    "silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
    silent !wmctrl -r :ACTIVE: -b add,fullscreen
endfunction

" toggles the quickfix window.
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
command! -bang -nargs=? QFixToggle call QFixToggle(<bang>1)
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced != 0
        QFix
        cclose
    else
        if exists("g:my_quickfix_win_height")
            execute "copen ".g:my_quickfix_win_height
        else
            copen
        endif
    endif
endfunction

" used to track the quickfix window
augroup QFixToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

" Save the current buffer as a file with no EOF sign.
function! SaveAsNOEOF(filename)
    let a=getline(1,line('$')-1)
    let b=map(a, 'iconv(v:val,"'.&enc.'","'.&fenc.'") . nr2char(13)')
    call extend(b, getline('$', '$'))
    call writefile(b,a:filename, 'b')
    if a:filename == bufname('%')
        set nomodified
    endif
endfunction
" Save the current buffer and get rid of the EOF sign.
function! SaveNOEOF()
    call SaveAsNOEOF(bufname('%'))
endfunction
command! -complete=file -nargs=0 SaveNOEOF :call SaveNOEOF()
command! -complete=file -nargs=1 SaveAsNOEOF :call SaveAsNOEOF(<q-args>)
"autocmd! BufWriteCmd */turbocrm*,version*.txt call SaveNOEOF()

" Set the current buffer to use utf-8 encoding and unix format
function! SetUnixFF()
    set fenc=utf-8
    set ff=unix
endfunction
command! -nargs=0 SetUnixFF call SetUnixFF()
" Set the current buffer to use GBK encoding and dos format
function! SetDOSFF()
    set fenc=cp936
    set ff=dos
endfunction
command! -nargs=0 SetDOSFF call SetDOSFF()

function! PTagIt()
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
endfunction
nmap <leader>pp :call PTagIt()<CR>
nmap <leader>pc :pclose<CR>

if IsPlatform('win')
    let g:XGrepExcludeFrom = 'd:/dev/tool/vim/XGrepExcludeList'
elseif IsPlatform('mac')
    let g:XGrepExcludeFrom = '/Users/monk/.vim/XGrepExcludeList'
else
    let g:XGrepExcludeFrom = '/home/monk/.vim/XGrepExcludeList'
endif
let g:XGrepExcludeDirs = ['datacache','.svn','assets','runtime','vendors']
let g:XGrepAutoJump = 0
let g:XGrepAutoOpen = 1
function! XGrep(grepprg, ...)
    let cmd = a:grepprg
    if exists('g:XGrepAutoJump') && g:XGrepAutoJump==0
        let cmd .= '!'
    endif

    let opts = ' -nrI'
    if exists('g:XGrepExcludeFrom')
        let opts .= ' --exclude-from='.g:XGrepExcludeFrom
    endif
    if exists('g:XGrepExcludeDirs')
        for tmp in g:XGrepExcludeDirs
            let opts .= ' --exclude-dir='.tmp
        endfor
    endif

    let keyword = ''
    let target = ''
    for param in a:000
        if stridx(param, '-')==0
            let opts .= ' '.param
        elseif stridx(param, '@')==0
            let keyword = strpart(param, 1)
        else
            let target .= ' '.param
        endif
    endfor

    let cmd .= opts
    let cmd .= ' "'.keyword.'"'
    let cmd .= target
    echo cmd
    silent execute cmd

    if exists('g:XGrepAutoOpen') && g:XGrepAutoOpen==1
        if a:grepprg=='grep'
            copen
        elseif a:grepprg=='lgrep'
            lopen
        endif
    endif
endfunction
command! -nargs=+ XGrep call XGrep('grep', <f-args>)
command! -nargs=+ XLrep call XGrep('lgrep', <f-args>)
nmap <leader>gw :exec 'XGrep -w @'.expand('<cword>').' .'<CR>
nmap <leader>lw :exec 'XLrep -w @'.expand('<cword>').' .'<CR>
nmap <leader>grep :XGrep -P @
nmap <leader>lrep :XLrep -P @
vmap <leader>grep y:XGrep @<C-R>=XEscapeRegex(@")<CR> .
vmap <leader>lrep y:XLrep @<C-R>=XEscapeRegex(@")<CR> .

" Wipe all buffers which are not active (i.e. not visible in a window/tab)
command! -nargs=0 Prune call CloseFugitiveBuffers()
function! CloseFugitiveBuffers()
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
endfunction

" 执行命令并回到原位置
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" 清除行尾空格
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

" 转义正则表达式特殊字符，以便在正则表达式中使用
function! XEscapeRegex(str)
    return escape(a:str, '/\.*$^~[')
endfunction

" Display contents of the current fold in a balloon
function! FoldSpellBalloon()
    let foldStart = foldclosed(v:beval_lnum )
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
endfunction
if has('balloon_eval')
    set balloonexpr=FoldSpellBalloon()
    set ballooneval
endif

" Edit snippets
function! EditSnippet(...)
    let sdir = expand('~/.vim/bundle/snipmate/snippets')
    if IsPlatform('win')
        let sdir = expand($VIM.'/vimfiles/bundle/snipmate/snippets')
    endif
    if a:0 == 0
        exec 'NERDTree '.sdir
    else
        let snippet = sdir.'/'.a:1.'.snippets'
        exec 'sp '.snippet
    endif
endfunction
command! -nargs=? EditSnippet call EditSnippet(<f-args>)

"}}}

" ----------------------------- Python -----------------------------{{{
au filetype python map <F5> :call StartPDB()<CR>
au filetype python map <S-F5> :call StopPDB()<CR>
au filetype python map <F6> :Cstep<CR>
au filetype python map <F7> :Cnext<CR>
au filetype python map <S-N> :Cnext<CR>
au FileType python map <C-F5> :python runScript()<cr>
au filetype python map <A-F5> <ESC>:call ExecutePythonScript()<CR>

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
