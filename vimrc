" ------------------------------ Plugins ------------------------------"{{{
call plug#begin('~/.vim/plugged')

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'kamykn/spelunker.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 't9md/vim-choosewin'
Plug 'trevordmiller/nova-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'wincent/ferret'
Plug 'gcmt/wildfire.vim'
Plug 'mhinz/vim-signify'
Plug 'tangledhelix/vim-octopress'
Plug 'farmergreg/vim-lastplace'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'brooth/far.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'twitvim/twitvim'
Plug 'godlygeek/tabular'
let g:ale_disable_lsp = 1
Plug 'dense-analysis/ale'
Plug 'chrisbra/SudoEdit.vim'
Plug 'vim-scripts/SQLUtilities'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/gv.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/fencview'
Plug 'drmikehenry/vim-fontsize'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'jreybert/vim-largefile'
Plug 'brookhong/cscope.vim'
Plug 'jiazhoulvke/jianfan'
Plug 'adelarsq/vim-matchit'
Plug 'vim-scripts/Align'
Plug 'janko-m/vim-test'
Plug 'junegunn/vader.vim'
" Plug 'tweekmonster/startuptime.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'mhinz/vim-startify'
Plug 'skywind3000/asyncrun.vim'
Plug 'aklt/plantuml-syntax'
if has('nvim')
    Plug 'caenrique/nvim-toggle-terminal'
else
    Plug 'pakutoma/toggle-terminal'
endif
Plug 'alvan/vim-php-manual'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle'   }
Plug 'rizzatti/dash.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'liuchengxu/space-vim-theme'
let g:vimspector_enable_mappings = 'HUMAN'
Plug 'puremourning/vimspector'
Plug 'rhysd/git-messenger.vim'
if has('nvim')
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/defx.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'Lap1n/coc-projector', {'do': 'yarn install --frozen-lockfile && yarn build'}
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'Valloric/ListToggle'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-lastpat'
" " Also provided in targets.vim
" Plug 'kana/vim-textobj-underscore'
Plug 'kana/vim-textobj-diff'
Plug 'kentaro/vim-textobj-function-php'
Plug 'glts/vim-textobj-comment'
Plug 'wellle/targets.vim'
Plug 'terryma/vim-expand-region'
Plug 'AndrewRadev/sideways.vim'
Plug '0x84/vim-coderunner'
Plug 'junkblocker/git-time-lapse'
Plug 'altercation/vim-colors-solarized'
" Plug 'ericbn/vim-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'rhysd/conflict-marker.vim'
" Plug 'inkarkat/vim-ConflictDetection'
" Plug 'kana/vim-exjumplist'
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'sindrets/diffview.nvim'
" Plug 'segeljakt/vim-silicon'

Plug 'peterhoeg/vim-qml',           { 'for': 'qml'      }
Plug 'lilydjwg/colorizer',          { 'for': 'css'      }
Plug 'vim-scripts/Pydiction',       { 'for': 'python'   }
Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown',     { 'for': 'markdown' }
" Plug 'vim-vdebug/vdebug',           { 'for': 'php'      }
Plug 'tobyS/pdv',                   { 'for': 'php'      }
Plug 'tobyS/vmustache',             { 'for': 'php'      }
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php'      }
Plug 'tpope/vim-dispatch',          { 'for': 'php'      }
Plug 'tpope/vim-projectionist',     { 'for': 'php'      }
Plug 'noahfrederick/vim-composer',  { 'for': 'php'      }
Plug 'noahfrederick/vim-laravel',   { 'for': 'php'      }
Plug 'dgryski/vim-godef',           { 'for': 'go'       }
Plug 'fatih/vim-go',                { 'for': 'go'       }
Plug 'Blackrush/vim-gocode',        { 'for': 'go'       }

Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

Plug '~/.vim/plugged/gtags'
Plug '~/.vim/plugged/confluencewiki'

" if has('python3')
" Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'chemzqm/denite-git'
" Plug 'chemzqm/vim-easygit'
" elseif has('python')
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/unite-outline'
" Plug 'hewes/unite-gtags'
" Plug 'tsukkee/unite-tag'
" endif

call plug#end()
"}}}

" ------------------------------ Miscellaneous ------------------------------"{{{
function! s:bundled(bundle)
    let plugs = get(g:, 'plugs', {})
    return has_key(plugs, a:bundle) ? isdirectory(plugs[a:bundle].dir) : 0
endfunction

" Check the current platform
function! IsPlatform(mixed)"{{{
    if type(a:mixed) == 1
        let plist = [a:mixed]
    elseif type(a:mixed) == 3
        let plist = a:mixed
    else
        return 0
    endif

    if has('win16') || has('win32') || has('win64') || has('winnt')
        return index(plist, 'win')>=0
    elseif has('mac')
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
set langmenu=en_US.UTF-8
" set langmenu=zh_CN.UTF-8
" language message zh_CN.UTF-8
language message en_US.UTF-8

" map <leader>
let mapleader=','

" Environment settings
if IsPlatform('win')
    set rtp-=$HOME/vimfiles
endif

" Generic declarations
" Platform specific declarations
if IsPlatform('win')
    let gbl_vimrc_name = '_vimrc'
    let gbl_vimrc_file = $VIM.'/'.gbl_vimrc_name
else
    let gbl_vimrc_name = '.vimrc'
    let gbl_vimrc_file = expand('~/'.gbl_vimrc_name)
endif

" Use command :Man to view manpages
if has('unix')
    source $VIMRUNTIME/ftplugin/man.vim
endif
if IsPlatform('win')
    source $VIMRUNTIME/vimrc_example.vim
endif
if !IsPlatform('mac')
    source $VIMRUNTIME/mswin.vim
    behave mswin
    map <C-f> <PageDown>
endif
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
source $HOME/.vimrc_private

let g:ruby_host_prog='~/.rbenv/shims/ruby'
let g:python_host_prog='~/.pyenv/shims/python2'
let g:python3_host_prog='~/.pyenv/shims/python3'

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
set history=100        " keep 50 lines of command line history
set hlsearch
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%Y]%=%l,%c%V%8P
set ignorecase
set smartcase
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
set nocursorline
set nocursorcolumn
set undodir=~/.vim/undodir/
set undofile
set relativenumber
set termguicolors
set nrformats+=alpha
" set spell
if IsPlatform('win')
    set grepprg=d:/dev/tool/GnuWin32/bin/grep.exe\ -n
else
    " set grepprg=grep\ -n
    set grepprg=ag\ --nogroup\ --column\ -U\ --ignore\ tags
endif
set wildignore=*.class,*.pyc

if has('gui_running')
    if !has('nvim')
        set macligatures
        set macthinstrokes
        " set guifont=Monaco\ for\ Powerline:h16
        set guifont=Cascadia\ Code\ PL:h16
        " set guifont=CaskaydiaCove\ Nerd\ Font\ Mono:h16
    endif
    set linespace=2

    " set background=dark
    set background=light
    
    " let g:solarized_diffmode="high"
    " colorscheme solarized

    colorscheme solarized8_flat
    " colorscheme flattened_light
    " colorscheme dracula
    " colorscheme nova
    " colorscheme nord
    " colorscheme tender
    " colorscheme onedark
    " colorscheme gruvbox
    " colorscheme base16-default-light

    " set lines=65 columns=189
    set lines=70 columns=300

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
    if !IsPlatform('mac')
        map <silent> <C-S-F2> :if &guioptions =~# 'm' <Bar>
                    \set guioptions-=m <bar>
                    \else <Bar>
                    \set guioptions+=m <Bar>
                    \endif<CR>
    endif
else
    " For CLI vim
    " set background=light
    " set background=dark
    " let g:solarized_termcolors=256
    " colorscheme solarized
    " colorscheme nova
    " colorscheme nord
    " colorscheme dracula
    colorscheme space_vim_theme
    " colorscheme flattened_light
endif

" Auto reload file if changed outside.
set autoread
au FocusGained,BufEnter * checktime

"}}}

" ------------------------------ Plugin Settings --------------------------{{{
" FencView settings
let g:fencview_autodetect    = 0
let g:fencview_checklines    = 10
let g:fencview_auto_patterns = '*.txt,*.htm{l\=},*.php,*.lib,*.inc,*.sql'

" UltiSnips settings
let g:UltiSnipsExpandTrigger       = '<C-Tab>'
let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsSnippetsDir         = '~/.vim/UltiSnips'
let g:ulti_expand_or_jump_res      = 0
let g:UltiSnipsEditSplit           = 'tabdo'
" let g:UltiSnipsEnableSnipMate      = 0

inoremap <silent> <TAB> <C-r>=CleverTab()<CR>
snoremap <silent> <tab> <esc>:call UltiSnips#ExpandSnippetOrJump()<cr>
function! CleverTab()"{{{
    call UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res
        return ''
    else
        if pumvisible()
            return "\<c-n>"
        else
            return coc#refresh()
        endif
    endif
endfunction"}}}

" Ferret
let g:FerretExecutable='rg'
let g:FerretExecutableArguments = {
            \   'ag': '--skip-vcs-ignores --ignore-dir=storage --vimgrep --width 4096 --follow --ignore-dir=vendor/composer --ignore-dir=storage',
            \   'rg': '--no-ignore-vcs --vimgrep --no-heading --no-config --max-columns 4096 --ignore-case --follow -g !vendor/composer -g !storage'
            \ }
let g:FerretQFHandler='botright copen 20'

nmap <leader>ak  <Plug>(FerretAck)
nmap <leader>lak <Plug>(FerretLack)
nmap <leader>aw  <Plug>(FerretAckWord)
nmap <leader>as  <Plug>(FerretAcks)
vmap <leader>ak  y:Ack <C-R>=XEscapeRegex(@", 1)<CR>
vmap <leader>lak y:Lack <C-R>=XEscapeRegex(@", 1)<CR>

" List all tasks under the current directory
map <leader><leader>tl :Ack //\s(TODO\|FIXME)\sdonie<CR>
if has("autocmd")
    " Highlight TODO, FIXME, NOTE, etc.
    if v:version > 701
        autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|BUG\|HACK\)')
        autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
    endif
endif

" Pydiction Settings
if IsPlatform('win')
    let g:pydiction_location = 'D:/Program Files/vim/vimfiles/plugged/Pydiction/complete-dict'
else
    let g:pydiction_location = '~/.vim/plugged/Pydiction/complete-dict'
endif

" SQL Type Default
let g:sql_type_default = 'sqlsvr'

" NERD_commenter Settings
let NERDSpaceDelims = 1
let NERDCreateDefaultMappings = 0
map <leader>cc <plug>NERDCommenterComment
map <leader>cs <plug>NERDCommenterSexy
map <leader>cu <plug>NERDCommenterUncomment

" NERD Tree
let NERDTreeIgnore      = ['\.scc$', '\.pyc$', '\~$']
let NERDTreeNaturalSort = 1

" TwitVim
let twitvim_enable_python = 1
" let twitvim_proxy         = '127.0.0.1:8123'
let twitvim_browser_cmd   = 'open -a Safari'
" let twitvim_browser_cmd = '/usr/bin/google-chrome-stable'
let twitvim_count = 30
nmap <leader>twit :PosttoTwitter<CR>
nmap <leader>twmy :UserTwitter<CR>
nmap <leader>twls :FriendsTwitter<CR>
nmap <leader>twpb :PublicTwitter<CR>
nmap <leader>twmt :MentionsTwitter<CR>
nmap <leader>twdm :DMTwitter<CR>
nmap <leader>twre :RetweetedByMeTwitter<CR>

if IsPlatform('win')
    let g:netrw_http_cmd = $VIM.'\plugged\binary-utils\dist\bin\curl.exe -o'
endif

if IsPlatform('win')
    let g:pydoc_cmd = "python C:\\Python27\\Lib\\pydoc.py"
endif

" shell.vim
let g:shell_mappings_enabled=0

" DirDiff
let g:DirDiffExcludes = 'CVS,*.class,*.exe,.*.swp,.svn,.git,assets,tags'

" Colorizer
let g:colorizer_startup = 0

" " Minibufexpl
" let g:miniBufExplSplitBelow               = 0
" let g:bufExplorerDisableDefaultKeyMapping = 1
" map <leader>be :ToggleBufExplorer<CR>

" " Vdebug.vim
        " " \        '/app': '/Users/don/rightcapital/retail-api',
" let g:vdebug_options= {
        " \    'path_maps' : {
        " \    },
        " \    'port' : 9002,
        " \    'server' : '0.0.0.0',
        " \    'timeout' : 60,
        " \    'on_close' : 'stop',
        " \    'break_on_open' : 0,
        " \    'ide_key' : '',
        " \    'remote_path' : '',
        " \    'local_path' : '',
        " \    'debug_window_level' : 0,
        " \    'debug_file_level' : 0,
        " \    'debug_file' : '',
        " \    'marker_default' : '⬦',
        " \    'watch_window_style' : 'expanded',
        " \    'marker_closed_tree' : '▸',
        " \    'marker_open_tree' : '▾',
        " \    'sign_breakpoint' : '▷',
        " \    'sign_current' : '▶',
        " \    'continuous_mode'  : 1,
        " \    'simplified_status': 1,
        " \    'layout': 'vertical',
        " \}
" let g:vdebug_keymap = {
        " \    'run' : '<F5>',
        " \    'run_to_cursor' : '<S-F5>',
        " \    'step_over' : '<F10>',
        " \    'step_into' : '<F11>',
        " \    'step_out' : '<F12>',
        " \    'close' : '<F6>',
        " \    'detach' : '<F7>',
        " \    'set_breakpoint' : '<F8>',
        " \    'get_context' : '<F9>',
        " \    'eval_under_cursor' : '<Leader>e',
        " \    'eval_visual' : '<Leader>e',
        " \}

" ALE settings
let g:ale_sign_column_always = 0
let g:ale_set_highlights = 1
let g:ale_set_signs = 1
let g:ale_sign_highlight_linenrs = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_php_phpcs_standard = 'PSR2'
" let g:ale_php_phpmd_ruleset = '~/.phpmd.xml'
let g:ale_php_phpcs_executable='./vendor/bin/phpcs'
let g:ale_php_php_cs_fixer_executable='./vendor/bin/php-cs-fixer'
let g:ale_fixers = {'php': ['php_cs_fixer']}
let g:ale_fix_on_save = 0

let g:ale_linters = {'php': ['phpstan'], 'markdown': ['markdownlint']}
let g:ale_lint_on_save = 1
let g:ale_php_phpstan_executable='./vendor/bin/phpstan'
let g:ale_php_phpstan_configuration='./phpstan.neon'
let g:ale_php_phpstan_level=7

" 普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
" 触发/关闭语法检查
nmap <Leader>at :ALEToggle<CR>
" 查看错误或警告的详细信息
nmap <Leader>ad :ALEDetail<CR>
nmap <Leader>af :ALEFix<CR>

" pdv
let g:pdv_template_dir = $HOME .'/.vim/plugged/pdv/templates_snip'
augroup pdv
    au!
    au FileType php nnoremap <buffer> <leader>\\ :call pdv#DocumentWithSnip()<CR>
augroup END

" ag
let g:ag_lhandler='lopen'

" gtags
let Gtags_Close_When_Single = 1
let Gtags_Auto_Update       = 1
let g:cscope_silent         = 1
augroup gtags
    au!
    au FileType php,python,c,cpp,javascript,go map <buffer> <C-]> :Gtags<CR><CR>
    if has('gui_running')
        au FileType php,python,c,cpp,javascript,go map <buffer> <C-S-]> :Gtags -r<CR><CR>
    endif
augroup END

" FastFold
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A']

"easy-align
vmap <leader>al <Plug>(EasyAlign)
let g:easy_align_ignore_groups = ['String']

" instant-markdown
let g:instant_markdown_autostart = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" leaderf
let g:Lf_ShortcutF       = '<C-P>'
let g:Lf_DefaultMode     = 'NameOnly'
let g:Lf_DelimiterChar   = ";"
let g:Lf_WindowPosition = 'popup'
let g:Lf_PopupColorscheme = 'gruvbox_material'
" let g:Lf_PopupColorscheme = 'powerline'
let g:Lf_PreviewInPopup = 1
let g:Lf_CommandMap      = {'<c-c>': ['<esc>', '<c-c>']}
" let g:Lf_ExternalCommand = 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$" --skip-vcs-ignores --follow'
let g:Lf_ExternalCommand = 'rg --files --no-ignore --follow "%s"'
let g:Lf_ReverseOrder    = 1
" let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "Cascadia Code PL" }
let g:Lf_ShowDevIcons = 0
" let g:Lf_DevIconsFont = "CaskaydiaCove Nerd Font Mono"
nmap <leader>ot :Leaderf tag<CR>
nmap <leader>bt :LeaderfBufTag<CR>
nmap <leader>bf :LeaderfFunction<CR>
nmap <leader>be :LeaderfBuffer<CR>
nmap <leader>fl :LeaderfLine<CR>
nmap <leader>hp :LeaderfHelp<CR>
nmap <leader>cm :LeaderfCommand<CR>

" airline
if has('nvim')
    let g:airline_powerline_fonts = 0
else
    let g:airline_powerline_fonts = 1
endif
let g:airline#extensions#wordcount#enabled               = 1
let g:airline#extensions#tabline#enabled                 = 1
let g:airline#extensions#tabline#show_splits             = 0
let g:airline#extensions#tabline#show_buffers            = 0
let g:airline#extensions#tabline#show_tabs               = 1
let g:airline#extensions#tabline#show_tab_type           = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 0
let g:airline#extensions#tabline#exclude_preview         = 1
let g:airline#extensions#tabline#tab_nr_type             = 2
let g:airline#extensions#tabline#buffer_idx_mode         = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" nmap <leader>- <Plug>AirlineSelectPrevTab
" nmap <leader>+ <Plug>AirlineSelectNextTab
" let g:airline#extensions#xkblayout#enabled = 1
" let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
call airline#parts#define_function('cwd', 'GetCWD')
fun! GetCWD()"{{{
    return fnamemodify(getcwd(), ":t")
endfun"}}}
" Options: ['cwd', 'mode', 'crypt', 'paste', 'keymap', 'spell', 'capslock', 'xkblayout', 'iminsert']
let g:airline_section_a = airline#section#create_left(['cwd', 'crypt', 'paste', 'keymap', 'spell', 'capslock', 'xkblayout', 'iminsert'])

" denite or unite
" if has('python3')
    " call denite#custom#map(
        " \ 'insert',
        " \ '<C-j>',
        " \ '<denite:move_to_next_line>',
        " \ 'noremap'
        " \)
    " call denite#custom#map(
        " \ 'insert',
        " \ '<C-k>',
        " \ '<denite:move_to_previous_line>',
        " \ 'noremap'
        " \)
    " " nnoremap <leader>gll :Denite -default-action=tabopen gitlog<CR>
    " " nnoremap <leader>gla :Denite -default-action=tabopen gitlog:all<CR>
    " nnoremap <leader>jl :<C-u>Denite jump<CR>
    " augroup denite
        " au!
        " au FileType help,markdown map <buffer> <leader>tt :Denite unite:outline<CR>
    " augroup END
" else
    " nnoremap <leader>jl :<C-u>Unite -direction=dynamicbottom jump<CR>
    " augroup unite
        " au!
        " au FileType help,markdown map <buffer> <leader>tt :Unite outline<CR>
    " augroup END
" endif

" choosewin
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" wildfire
nmap <leader>vv <Plug>(wildfire-quick-select)

" vim-php-namespace
let g:php_namespace_sort_after_insert = 1
function! IPhpInsertUse()"{{{
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction"}}}
function! IPhpExpandClass()"{{{
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction"}}}
augroup vim_php_namespace"{{{
    au!
    " do imports
    autocmd FileType php inoremap <Leader>iu <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap  <Leader>iu :call PhpInsertUse()<CR>
    " do expansions
    autocmd FileType php inoremap <Leader>ec <Esc>:call IPhpExpandClass()<CR>
    autocmd FileType php noremap  <Leader>ec :call PhpExpandClass()<CR>
augroup END"}}}

" vim-test settings
augroup vim_test"{{{
    au!
    autocmd FileType php nnoremap <leader>tn :call MyTestRun('nearest')<CR>
    autocmd FileType php nnoremap <leader>tL :call MyTestRun('last')<CR>
    autocmd FileType php nnoremap <leader>tf :call MyTestRun('file')<CR>
    autocmd FileType php nnoremap <leader>trbn :TestNearest -d rebase<CR>
    autocmd FileType php nnoremap <leader>trbf :TestFile -d rebase<CR>
augroup END"}}}
function! MyTestRun(runner)"{{{
    if (exists('g:vimspector_is_running'))
        let g:test#php#phpunit#executable = 'env XDEBUG_SESSION=1 ./vendor/bin/phpunit'
    else
        let g:test#php#phpunit#executable = './vendor/bin/phpunit'
    endif

    call test#run(a:runner, [])
endfunction"}}}

if has('nvim')
    let test#strategy = 'neovim'
else
    " let test#strategy = 'asyncrun'
    " let test#strategy = 'dispatch'
    let test#strategy = 'vimterminal'
    " let test#vim#term_position = "topleft"
endif

" Git mappings, coc, fugitive
nnoremap <leader>gg :Git<CR>
nnoremap <leader>gl :Git pull<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>dgh :diffget //2<CR>
nnoremap <leader>dgl :diffget //3<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <leader>gc :<C-u>CocList branches<cr>
nnoremap <leader>gtl :GitTimeLapse<CR>

" gv.vim
nnoremap <leader>gvl :GV  --pretty=%cd\ %h%d\ %s\ (%an,\ %ci) --date=format:%Y-%m-%d --abbrev-commit --no-merges<CR>
nnoremap <leader>gvc :GV! --pretty=%cd\ %h%d\ %s\ (%an,\ %ci) --date=format:%Y-%m-%d --abbrev-commit --no-merges<CR>
nnoremap <leader>gva :GV  --pretty=%cd\ %h%d\ %s\ (%an,\ %ci) --date=format:%Y-%m-%d --abbrev-commit --no-merges --author<space>
nnoremap <leader>gvg :GV  --pretty=%cd\ %h%d\ %s\ (%an,\ %ci) --date=format:%Y-%m-%d --abbrev-commit --no-merges --grep<space>
vnoremap <leader>gvc :GV!<CR>
augroup gv
    au FileType git set fdl=0
augroup END

" auto-pairs
let g:AutoPairsMapCh = 0

" vim-lsc
" let g:lsc_server_commands = {'php': 'localhost:12345'}
" let g:lsc_auto_map = v:true " Use defaults
" let g:lsc_auto_map = {
    " \ 'GoToDefinition': '<C-]>',
    " \ 'FindReferences': 'gr',
    " \ 'ShowHover': 'K',
    " \ 'Completion': 'completefunc',
    " \}

" Nord color scheme
let g:nord_italic = 1
let g:nord_italic_comments = 1

" vim-fontsize
nmap <silent> <Leader>=  <Plug>FontsizeBegin
nmap <silent> <Leader>+  <Plug>FontsizeInc
nmap <silent> <Leader>-  <Plug>FontsizeDec
nmap <silent> <Leader>0  <Plug>FontsizeDefault

" Toggle terminal
if has('nvim')
    " nvim-toggle-terminal
    if has('gui_running')
    nnoremap <silent> <D-t> :ToggleTerminal<Enter>
    tnoremap <silent> <D-t> <C-\><C-n>:ToggleTerminal<Enter>
    " else
    " nnoremap <silent> <C-z> :ToggleTerminal<Enter>
    " tnoremap <silent> <C-z> <C-\><C-n>:ToggleTerminal<Enter>
    endif
else
    " toggle-terminal
    let g:toggle_terminal#command = 'zsh'
    nnoremap <silent> <D-t> :ToggleTerminal<CR>
    tnoremap <silent> <D-t> <C-w>:ToggleTerminal<CR>
endif

" startify settings
nnoremap <leader><leader>st :Startify<CR>
let g:startify_change_to_vcs_root = 1
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_session_sort = 1
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]


"""""""""""""""""""""""""""""""""" gutentags settings """"""""""""""""""""""""""""""""""
let g:gutentags_plus_nomap = 1
" let g:gutentags_define_advanced_commands = 1
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']
" config project root markers.
" let g:gutentags_project_root = ['.root']
" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')
" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
let g:gutentags_ctags_exclude = ['_ide_helper.php', '*.js', 'Makefile']
let g:gutentags_ctags_extra_args = ['--PHP-kinds=+cdfint-va']

" undotree
nnoremap <leader>ut :UndotreeToggle<CR>

" vim-php-manual
let g:php_manual_online_search_shortcut = '<leader>pm'

let g:merginal_splitType=''

" defx settings
call defx#custom#option('_', {
      \ 'winwidth': 50,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

nmap <silent> <Leader>dt :Defx<cr>

autocmd FileType defx call s:defx_mappings()

function! s:defx_mappings() abort
    nnoremap <silent><buffer><expr> o     <SID>defx_toggle_tree()                " 打开或者关闭文件夹，文件
    nnoremap <silent><buffer><expr> t     defx#do_action('open', 'tabnew')
    nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files') " 显示隐藏文件
    nnoremap <silent><buffer><expr> <C-r> defx#do_action('redraw')
    nnoremap <silent><buffer><expr> S     defx#do_action('toggle_sort', 'FILENAME')
endfunction

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction

nnoremap <silent>sf :<C-u>Defx -listed -resume
      \ -columns=indent:mark:icon:icons:filename:git:size
      \ -buffer-name=tab`tabpagenr()`
      \ `expand('%:p:h')` -search=`expand('%:p')`<CR>
nnoremap <silent><leader>fi :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>

" vim-plug
let g:plug_window='-tabnew'

" vim-clap
let g:clap_theme = 'material_design_dark'
" let g:clap_theme = { 'search_text': {'guifg': 'red', 'ctermfg': 'red'} }
let g:clap_provider_grep_executable = 'rg'
let g:clap_provider_grep_opts = '--no-ignore-vcs --vimgrep --no-heading --no-config --max-columns 4096 --ignore-case --follow'

" unimpaired
vmap <S-Up>    [egv
vmap <S-Down>  ]egv
vmap <S-Left>  <gv
vmap <S-Right> >gv

" dirvish settings
if s:bundled('vim-dirvish')
    let g:dirvish_mode = ':sort ,^\v(.*[\/])|\ze,'
    let g:dirvish_git_show_ignored = 0

    nmap <silent> <Space>- :Dirvish<CR>
    nmap <silent> _ :execute (@% == '' ? 'Dirvish' : 'Dirvish %')<CR>
    autocmd FileType dirvish nmap <silent><buffer> _ <Plug>(dirvish_up)
endif

" sideways settings
nnoremap <S-Left>  :SidewaysLeft<CR>
nnoremap <S-Right> :SidewaysRight<CR>

" vim-expand-region settings
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" vim-silicon settings
if s:bundled('vim-silicon')
    let g:silicon = {
          \   'theme':              'Dracula',
          \   'font':                  'Hack',
          \   'background':         '#AAAAFF',
          \   'shadow-color':       '#555555',
          \   'line-pad':                   2,
          \   'pad-horiz':                 80,
          \   'pad-vert':                 100,
          \   'shadow-blur-radius':         0,
          \   'shadow-offset-x':            0,
          \   'shadow-offset-y':            0,
          \   'line-number':           v:true,
          \   'round-corner':          v:true,
          \   'window-controls':       v:false,
          \ }
endif

" vim-which-key settings
let g:mapleader = ','
let g:maplocalleader = ','
let g:which_key_vertical = 1
nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
"}}}

" ------------------------------ Auto Commands ------------------------------"{{{
if IsPlatform('win')
    augroup windows
        au!
        au GUIEnter * simalt ~x
        au VimEnter *.* cd %:h
    augroup END
else
    " au GUIEnter * call MaximizeWindow()
endif

" Javascript filetype
augroup javascript
    au!
    au FileType javascript setl fen
    au FileType javascript setl foldlevel=0
    au BufRead *.pac setl filetype=javascript
    au BufRead *.pac setl foldlevel=1
augroup END
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

" Confluence Wiki
autocmd BufNewFile,BufRead *.confluence set filetype=confluencewiki

" Don't use Ex mode, use Q for formatting
map Q gq

" Fix the problem that vim on linux takes C-style commentstring to comment fold markers in vim scripts
" This problem is found only on my linux, it should be checked out that what reason causes such a problem
augroup vim_comment_string
    au!
    au FileType vim set commentstring=\"%s
augroup END

" Fold method
let g:sh_fold_enabled=1
augroup fold_method
    au!
    au FileType python     setl fdm=indent
    au FileType sql        setl fdm=manual
    au FileType sh         setl fdm=syntax
    au FileType java       setl fdm=syntax
    au FileType java       setl fdl=1
    au FileType javascript setl fdl=1
    au FileType php        setl fdm=indent
    au FileType git        setl fdm=syntax
augroup END

" " Plain text
" augroup text
    " au!
    " au BufNewFile,BufRead *.txt set wrap
" augroup END

" Dokuwiki
augroup dokuwiki
    au!
    au BufNewFile,BufRead *.doku set ft=dokuwiki
augroup END

" Auto handle resources
if IsPlatform('unix')
    augroup xbindkeys
        au!
        au! BufWritePost,FileWritePost .xbindkeysrc silent !ps aux|grep -P '\sxbindkeys$'|awk '{print $2}'|xargs kill > /dev/null 2>&1 ; xbindkeys > /dev/null 2>&1
        au! BufWritePost,FileWritePost .xbindkeys.scm silent !ps aux|grep -P '\sxbindkeys\s'|awk '{print $2}'|xargs kill > /dev/null 2>&1 ; xbindkeys -fg ~/.xbindkeys.scm > /dev/null 2>&1
        au! BufWritePost,FileWritePost .Xdefaults   silent !xrdb ~/.Xdefaults
        au! BufWritePost,FileWritePost .Xresources  silent !xrdb ~/.Xresources
    augroup END
endif

augroup sql
    au!
    au FileType sql set synmaxcol=0
augroup END

" Quickfix and location windows
augroup quickfix
    au!
    au WinLeave * if &buftype=='quickfix' | lclose | endif
    au! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter>
augroup END

" vim help
augroup vim_help
    au!
    au FileType vim set keywordprg='help'
augroup END

" vim-octopress
augroup octopress
    au!
    au! BufNewFile,BufRead *.markdown,*.textile set filetype=octopress
augroup END
"}}}

"------------------------------- Key mappings -------------------------------"{{{
"普通退出，全部退出，强制退出，强制全部退出
nmap <leader><leader>q :q<CR>
imap <leader><leader>q <ESC>:q<CR>
nmap <leader>aq :qa<CR>
imap <leader>aq <ESC>:qa<CR>
nmap <leader>Q  :q!<CR>
imap <leader>Q  <ESC>:q!<CR>
nmap <leader>aQ :qa!<CR>
imap <leader>aQ <ESC>:qa!<CR>

" 编辑
nmap <leader>w :up<CR>
nmap <leader>W :SudoWrite<CR>
imap <leader>w <ESC>:up<CR>
imap <leader>W <ESC>:SudoWrite<CR>
nmap <leader>x :x<CR>
imap <leader>x <ESC>:x<CR>
imap <leader>u <C-O>:normal u<CR>
imap <leader>o <C-O>:normal o<CR>
imap <leader>O <C-O>:normal O<CR>
nmap <C-S-U>   :e!<CR>
imap <C-S-U>   <C-O>:e!<CR>
imap <C-Q>     <ESC>:wq<CR>
xnoremap <expr> p '"_d"'.v:register.'P'

" Tab and window operations
nmap <C-T><C-T> :tabnew<CR>
imap <C-T><C-T> <ESC>:tabnew<CR>
nmap <C-T><C-W> :tabc<CR>
imap <C-T><C-W> <ESC>:tabc<CR>
nmap <leader>tc :tabc<CR>
imap <leader>tc <ESC>:tabc<CR>
nmap <C-Tab>    :tabn<CR>
imap <C-Tab>    <ESC>:tabn<CR>
nmap <C-S-Tab>  :tabp<CR>
imap <C-S-Tab>  <ESC>:tabp<CR>
nmap gr         :tabp<CR>
nmap <leader><leader>dut :tab sp<CR>
imap <leader><leader>dut :tab sp<CR>
nnoremap <leader>oo <C-w><C-o>
inoremap <leader>oo <ESC><C-w><C-o>a
nnoremap <C-U> <C-I>

" 编辑与当前文件路径相关的文件
nmap <leader><leader>O :e <C-R>=expand("%:p:~")<CR>
nmap <leader><leader>D :e <C-R>=expand("%:p:~:h").'/'<CR>
nmap <leader><leader>rn :Rename <C-R>=expand('%:t')<CR>
nmap <leader><leader>mv :Move <C-R>=expand('%:.')<CR>
nmap <leader><leader>rm :Delete
nmap <leader><leader>duf :saveas <C-R>=expand('%:.')<CR>
" Copy relative path of current file.
nmap <leader><leader>crp :<C-u>let @+=expand('%:.')<CR>:echo 'File path copied.'<CR>

" Toggle quickfix and location list
let g:lt_location_list_toggle_map = '<leader>lt'
let g:lt_quickfix_list_toggle_map = '<leader>ct'

" 分割窗口
nmap <leader>hs :sp<CR><C-W>_
nmap <leader>vs :vsp<CR><C-W>_

" 最大化当前Split窗口
nmap <F11> :wincmd_<CR>

" 跳转到下一个Split窗口并最大化之
nmap     <Tab>   <C-W>j<C-W>_
nnoremap <S-Tab> <C-W>k<C-W>_

" 窗口间移动焦点
nnoremap <up>    <C-W>k
nnoremap <down>  <C-W>j
nnoremap <left>  <C-W>h
nnoremap <right> <C-W>l
nnoremap <C-k>    <C-W>k
nnoremap <C-j>  <C-W>j
nnoremap <C-h>   <C-W>h
nnoremap <C-l>   <C-W>l

" Navigating long lines
nnoremap <M-h> <left>
nnoremap <M-l> <right>
nnoremap <M-j> gj
nnoremap <M-k> gk
inoremap <M-h> <left>
inoremap <M-l> <right>
inoremap <M-j> <C-o>gj
inoremap <M-k> <C-o>gk
vnoremap <M-h> <left>
vnoremap <M-l> <right>
vnoremap <M-j> <down>
vnoremap <M-k> <up>

" 删除包含选中字符串的行
nmap <leader>dl yiw:call Preserve("g/".XEscapeRegex(@")."/d")<CR>
vmap <leader>dl y:call   Preserve("g/".XEscapeRegex(@")."/d")<CR>

" Edit vimrc
exec 'nmap <leader>rcop :tabnew '.gbl_vimrc_file.'<CR><C-W>_'
" Source vimrc
exec 'nmap <leader>rcso :so '.gbl_vimrc_file.'<CR>'
" Source vimrc after it is modified
" exec 'au! bufwritepost '.gbl_vimrc_name.' so '.gbl_vimrc_file
" To fix the problem that the folding method remains to be 'syntax' when open the vimrc file in a php file
exec 'au! bufreadpre '.gbl_vimrc_name.' setl fdm=marker'

" " CTags
" " nmap <leader>mkt :VimProcBang gtags<CR>
" " nmap <leader>mkt :VimProcBang ctags -R --php-kinds=cidfj -h .php.inc.lib.py.java --langmap=php:.php.inc.lib --exclude="*.js" --exclude=".undodir/*" .<CR>
" " nmap <leader>mkt :VimProcBang gtags && ctags -R --php-kinds=cidfj -h .php.inc.lib.py.java --langmap=php:.php.inc.lib --exclude="*.js" --exclude=".undodir/*".<CR>
" nmap <leader>mkt :AsyncRun gtags && ctags -R --php-kinds=cidfj -h .php.inc.lib.py.java --langmap=php:.php.inc.lib --exclude="*.js" --exclude=".undodir/*".<CR>

" 查看当前目录
nmap <leader>pwd :pwd<CR>

" NERDTree
nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>
nmap <leader>nd :NERDTree %:h<CR>

" 简繁转换
nmap <leader>g2b <ESC>:call G2B()<CR>
nmap <leader>b2g <ESC>:call B2G()<CR>

" 查找與替換
nmap <leader>ff yiw/\<<C-R>"\>\C
vmap <leader>ff y/\m<C-R>=XEscapeRegex(@")<CR>\C
" vmap <leader>ff y/\V<C-R>=escape(@",'/\')<CR>
nmap <leader>rr yiw:%s/\<<C-R>"\>\C//g<LEFT><LEFT>
vmap <leader>rr y:%s/<C-R>=XEscapeRegex(@")<CR>\C//g<LEFT><LEFT>
nmap <leader>rl yiw:s/\<<C-R>"\>\C//g<LEFT><LEFT>
vmap <leader>rl y:s/<C-R>=XEscapeRegex(@")<CR>\C//g<LEFT><LEFT>

" 编码转换
nmap <leader>fenc :set fenc<CR>
" nmap <leader>gbk  :set fenc=cp936<CR>
nmap <leader>utf8 :set fenc=utf-8<CR>
nmap <leader>fdos :set ff=dos<CR>
nmap <leader>edos :e   ++ff=dos<CR>
nmap <leader>unix :set ff=unix<CR>

" 为xbindkeys捕获热键
if has('unix') && executable('xbindkeys')
    nmap <leader>key :let @"=system('xbindkeys -k\|tail -n 1')<CR>
endif

" Select the last pasted area
nmap <leader>V V']

" Clear highlighting of the last search
nmap <leader><leader>cc :nohl<CR>

" Search word
" if has('gui_running')
    " nmap <leader>/w /\<\>\C<left><left><left><left>
" else
    nmap <leader>/w /\<\>\C<left><left><left><left><left><left><left><left><left><left><left><left><left><left>
" endif

" Format JSON string
nmap <leader>json :%!python -m json.tool<CR>:set ft=json<CR>

" Open terminal in the current path
if has('unix')
    nmap <leader>sh :call xolox#misc#os#exec({'command':'terminator', 'async':1})<CR>
elseif has('win32')
    nmap <leader>sh :call xolox#misc#os#exec({'command':'cmd.exe', 'async':1})<CR>
endif

" UltiSnips mappings
nmap <leader>ue :UltiSnipsEdit<Space>

" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" repeat last command
nmap <leader>!! :<up><CR>

" dash
nmap <silent> <leader>ds <Plug>DashSearch

" Vimspector mappings
nmap <leader><leader><F3> :call MyVimspectorRun('reset')<CR>
nmap <F3> :call MyVimspectorRun('stop')<CR>
nmap <F5> :call MyVimspectorRun('continue')<CR>
function! MyVimspectorRun(command)"{{{
    if a:command == 'stop'
        call vimspector#Stop()
    elseif a:command == 'reset'
        call vimspector#Reset()
    elseif a:command == 'continue'
        call vimspector#Continue()
    else
        echoerr 'Unsupported command!'
        return
    endif

    if a:command == 'continue'
        let g:vimspector_is_running = 1
    elseif exists('g:vimspector_is_running')
        unlet g:vimspector_is_running
    endif
endfunction"}}}

" Open MR of the current branch in web browser
nmap <leader>mr :AsyncRun glab mr view -w<CR>

" Set filetype
nmap <leader>ft :set filetype=
"}}}

" ------------------------------ Functions -----------------------------{{{

if IsPlatform('win')
    set diffexpr=MyDiff()
endif
function! MyDiff()"{{{
    let opt = '-a --binary '
    if &diffopt =~? 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~? 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~? ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~? ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~? ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~? ' '
        if &sh =~? '\<cmd'
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
    normal! o
    call setline('.', '# -*- coding: utf-8 -*-')
    normal! o
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
augroup save_no_eof
    au!
    au! BufWriteCmd version*.txt call SaveNOEOF()
augroup END

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
    exec 'ptag '.expand('<cword>')
    let cwin = winnr()
    silent! wincmd P
    let lnr = line('.')
    if lnr < 3
        return
    endif

    if foldlevel('.')>0
        normal! zo
    endif

    let chead = 0
    let linestr = getline(lnr-1)
    if linestr =~# '^\s*\*/'
        let ptr = lnr-2
        while ptr>0
            let linestr = getline(ptr)
            if linestr =~# '^\s*/\*'
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
    echon 'Deleted ' . l:tally . ' buffers'
endfunction"}}}

" 执行命令并回到原位置
function! Preserve(command)"{{{
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line('.')
    let c = col('.')
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction"}}}
" " 清除行尾空格
command! -nargs=0 TrimLineEnds call Preserve("%s/\\s\\+$//e")
" " 美化缩进
command! -nargs=0 ReIndentBuffer call Preserve("normal gg=G")
" " 替换Tab为4个空格
command! -nargs=0 ConvertTabToSpaces call Preserve("%s/\\t/    /g")

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
    return join( lines, has('balloon_multiline') ? '\n' : ' ' )
endfunction"}}}
if has('balloon_eval')
    set balloonexpr=FoldSpellBalloon()
    set ballooneval
endif

" Fold text
set foldtext=CustomFoldText()
fu! CustomFoldText()"{{{
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~? '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = ' ' . foldSize . ' lines '
    let foldLevelStr = repeat('+--', v:foldlevel)
    let lineCount = line('$')
    let foldPercentage = printf('[%.1f', (foldSize*1.0)/lineCount*100) . '%] '
    let expansionString = ' '.repeat('-', w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf"}}}

" Show commit history of the current file under the given VCS in a new window
function! ShowCommitHistory(vcs)"{{{
    " Check parameter
    if a:vcs !=? 'svn' && a:vcs !=? 'git'
        echoerr 'Unknow VCS: '.a:vcs
        return
    endif

    " Do the dirty work
    let fileName = expand('%')
    if !empty(fileName)
        exe 'new'
        if a:vcs ==? 'svn'
            exe 'r !svn log --diff --internal-diff '.fileName
        elseif a:vcs ==? 'git'
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
augroup quickfix_mapping
    au!
    au BufWinEnter * if &buftype=='quickfix'|noremap <buffer> <C-T> :call OpenQuickfixInNewTab()<CR>|endif
augroup END

" translate the word under cursor
fun! SearchWord()"{{{
    echo system('ydcv --', expand('<cword>'))
endfun"}}}
" translate selected text
fun! SearchWord_v(type, ...)"{{{
    let sel_save   = &selection
    let &selection = 'inclusive'
    let reg_save   = @@

    if a:0
        silent exe 'normal! `<' . a:type . '`>y'
    elseif a:type ==? 'line'
        silent exe "normal! '[V']y"
    elseif a:type ==? 'block'
        silent exe 'normal! `[\<C-V>`]y'
    else
        silent exe 'normal! `[v`]y'
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
    execute 'normal! ' . a:cmd
    if view.topline != winsaveview().topline
        normal! zz
    endif
endfunction

nnoremap <silent> n :call <SID>nice_next('n')<CR>
nnoremap <silent> N :call <SID>nice_next('N')<CR>

" Reset environment
function! ResetIDE()
    " Refresh leaderf cache
    if exists('g:Lf_py')
        exec g:Lf_py "jumpsExplManager.refresh()"
        exec g:Lf_py "tagExplManager.refresh()"
        exec g:Lf_py "fileExplManager.refresh()"
    endif

    " Restart COC
    call coc#rpc#restart()
endfunction
nnoremap <leader><leader>rs :call ResetIDE()<CR>

" Copy full class & method name in php files
" @see https://github.com/tyru/current-func-info.vim
au filetype php command! CopyFullClassName let @+=GetFullPHPClassName() | echo @+ . ' copied.'
au filetype php command! CopyFullMethodName let @+=GetFullPHPMethodName() | echo @+ . ' copied.'
function! GetFullPHPClassName()"{{{
    " Save some registers
    let l:r_a = @a
    let l:r_b = @b

    " Save cursor position
    let l:pos = getcurpos()

    " Start at the top of the file
    :0
    " Search for the first "namespace" occurence
    /^namespace
    " Get the namespace string into the regsiter a
    normal! w"ayt;

    " Search for the class definition
    /\(^\(\(abstract\|final\)\s\+\|\)\)\@<=class
    " Get the class string into the regsiter b
    normal! knw"bye

    let l:full_class_name = @a . '\' . @b

    " Restore cursor position
    call setpos('.', l:pos)

    " Restore registers
    let @a = l:r_a
    let @b = l:r_b

    return l:full_class_name
endfunction"}}}
" This function should be triggered when the cursor is on the method name
function! GetFullPHPMethodName()"{{{
    let l:r_a = @a

    normal! "ayiw

    let l:full_class_name = GetFullPHPClassName()

    let l:full_method_name = l:full_class_name . '::' . @a . '()'

    let @a = l:r_a

    return l:full_method_name
endfunction"}}}
"}}}

" ------------------------------ Java -----------------------------{{{
" Javadoc comments (/** and */ pairs) and code sections (marked by {} pairs) mark the start and end of folds. All other
" lines simply take the fold level that is going so far.
function! MyFoldLevel( lineNumber )
    let thisLine = getline( a:lineNumber )
    " If the entire Javadoc comment or the {} pair is on one line, then don't create a fold for it.
    if ( thisLine =~? '\%(\%(/\*\*\).*\%(\*/\)\)\|\%({.*}\)' )
        return '='
    elseif ( thisLine =~? '\%(^\s*/\*\*\s*$\)\|{' )
        return 'a1'
    elseif ( thisLine =~? '\%(^\s*\*/\s*$\)\|}' )
        return 's1'
    endif
    return '='
endfunction
" setlocal foldexpr=MyFoldLevel(v:lnum)
" setlocal foldmethod=expr
"}}}

" ------------------------------ Python -----------------------------{{{
augroup python
    au!
    au filetype python map  <buffer> <F5>   :call StartPDB()<CR>
    au filetype python map  <buffer> <S-F5> :call StopPDB()<CR>
    au filetype python map  <buffer> <F6>   :Cstep<CR>
    au filetype python map  <buffer> <F7>   :Cnext<CR>
    au filetype python map  <buffer> <S-N>  :Cnext<CR>
    au FileType python map  <buffer> <A-CR> :python runScript()<CR>
    au filetype python nmap <buffer> <C-CR> :call ExecutePythonScript()<CR>
    au filetype python imap <buffer> <C-CR> <ESC><C-CR>
    au FileType python set  formatprg=PythonTidy.py
    " au FileType python autocmd BufWritePre <buffer> let s:saveview = winsaveview() | exe '%!PythonTidy.py' | call winrestview(s:saveview) | unlet s:saveview
augroup END

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
    if &filetype !=? 'python'
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
if has('python3')
python3 <<EOF
def runScript():
    script="\n".join([line for line in vim.current.buffer])
    exec(script)
EOF
else
python <<EOF
def runScript():
    script="\n".join([line for line in vim.current.buffer])
    exec(script)
EOF
endif

"}}}

" ------------------------------ Go -----------------------------{{{
" augroup golang
    " au!
    " au BufWritePre *.go :Fmt
    " au FileType go map <buffer> <C-CR> :silent write \| !go run %<CR>
    " au FileType go imap <buffer> <C-CR> <Esc><C-CR>
" augroup END

" let g:gofmt_command = 'goimports'
"}}}

" ------------------------------ PHP -----------------------------{{{
" PHP folding method
let php_folding    = 2
let php_large_file = 0

augroup php
    au!
    au FileType php set formatprg=php_beautifier\ -l\ \"ArrayNested()\"
    au FileType php nnoremap <buffer> <A-F12> :call Preserve("normal! gggqG")<CR>
    au FileType php vnoremap <buffer> <A-F12> gq
    au BufNewFile,BufRead *.lib,*.inc set filetype=php
    au FileType php set complete+=k,set dict=$VIMRUNTIME/api/php.dict
    au FileType php set keywordprg=:help
    au FileType php set iskeyword=@,48-57,_,128-167,224-235
    if IsPlatform('win')
        au FileType php set runtimepath+=$VIM\php
    else
        au FileType php set runtimepath+=~/.vim/api/php
    endif
    au FileType php set fdl=10
augroup END

" pdv
let g:pdv_template_dir=$HOME .'/.vim/plugged/pdv/templates_snip'
augroup pdv
    au!
    au FileType php nnoremap <buffer> <leader>\\ :call pdv#DocumentWithSnip()<CR>
augroup END

" Open a temporary PHP file in a new window
function! PHPSandBox()"{{{
    let tmpfile=tempname().'.php'
    exe 'new '.tmpfile
    call setline('.', '<?php')
    normal! o
    " normal! o
    " call setline('.', '?>')
    " normal! k
    startinsert
endfunction"}}}
nmap <leader>sbph :call PHPSandBox()<CR>

" 强制使用HTML的注释
function! ForceHTMLComment(mode, type) range"{{{
    set ft=html
    if a:mode ==? 'x'
        execute a:firstline.','.a:lastline.'call NERDComment(\"x\", \"'.a:type.'\")'
    else
        if a:type ==? 'Sexy'
            normal! ,cs
        else
            normal! ,cc
        endif
    endif
    set ft=php
endfunction"}}}
augroup php_force_html_comment
    au!
    au FileType php nmap <buffer> <leader>fhcc :call ForceHTMLComment("n", "Comment")<CR>
    au FileType php vmap <buffer> <leader>fhcc :call ForceHTMLComment("x", "Comment")<CR>
    au FileType php nmap <buffer> <leader>fhcs :call ForceHTMLComment("n", "Sexy")<CR>
    au FileType php vmap <buffer> <leader>fhcs :call ForceHTMLComment("x", "Sexy")<CR>
    au FileType php nmap <buffer> <leader>fhcu :call ForceHTMLComment("n", "Uncomment")<CR>
    au FileType php vmap <buffer> <leader>fhcu :call ForceHTMLComment("x", "Uncomment")<CR>
augroup END

function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    au!
    au FileType php call PhpSyntaxOverride()
augroup END
"}}}

" ------------------------------ COC -----------------------------{{{
nnoremap <leader>cocc :CocConfig<CR>

let g:coc_node_path='~/.nvm/versions/node/v14.16.1/bin/node'

" if executable('intelephense')
    " augroup LspPHPIntelephense
        " au!
        " au User lsp_setup call lsp#register_server({
            " \ 'name': 'intelephense',
            " \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
            " \ 'whitelist': ['php'],
            " \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
            " \ 'workspace_config': {
            " \   'intelephense': {
            " \     'files': {
            " \       'maxSize': 1000000,
            " \       'associations': ['*.php', '*.phtml'],
            " \       'exclude': [],
            " \     },
            " \     'completion': {
            " \       'insertUseDeclaration': v:true,
            " \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
            " \       'triggerParameterHints': v:true,
            " \       'maxItems': 100,
            " \     },
            " \     'format': {
            " \       'enable': v:true
            " \     },
            " \   },
            " \ }
            " \})
    " augroup END
" endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gR <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()"{{{
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction"}}}

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Code actions.
xmap <leader>ac  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction-line)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" " Use <TAB> for selections ranges.
" " NOTE: Requires 'textDocument/selectionRange' support from the language server.
" " coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Search workspace symbols.
nnoremap <silent> <leader>cocs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <leader>cocp  :<C-u>CocListResume<CR>
nnoremap <leader>sy :<C-u>CocList -A --normal yank<cr>
nnoremap <leader>sn :<C-u>CocList -A snippets<cr>
nnoremap <leader>op :<C-u>CocList project<cr>
nnoremap <leader>os :<C-u>CocList sessions<cr>
nnoremap <leader>ss :<C-u>CocCommand session.save<cr>
nnoremap <leader>Cs :<C-u>let v:this_session=''<CR>:echo 'Session closed.'<CR>

highlight CocFloating guibg=#99cccc guifg=#336699
"}}}
command! DiffHistory call s:view_git_history()

function! s:view_git_history() abort
    Git difftool --name-only ! !^@
    call s:diff_current_quickfix_entry()
    " Bind <CR> for current quickfix window to properly set up diff split layout after selecting an item
    " There's probably a better way to map this without changing the window
    copen
    nnoremap <buffer> <CR> <CR><BAR>:call <sid>diff_current_quickfix_entry()<CR>
    wincmd p
endfunction

function s:diff_current_quickfix_entry() abort
    " Cleanup windows
    for window in getwininfo()
        if window.winnr !=? winnr() && bufname(window.bufnr) =~? '^fugitive:'
            exe 'bdelete' window.bufnr
        endif
    endfor
    cc
    call s:add_mappings()
    let qf = getqflist({'context': 0, 'idx': 0})
    if get(qf, 'idx') && type(get(qf, 'context')) == type({}) && type(get(qf.context, 'items')) == type([])
        let diff = get(qf.context.items[qf.idx - 1], 'diff', [])
        echom string(reverse(range(len(diff))))
        for i in reverse(range(len(diff)))
            exe (i ? 'leftabove' : 'rightbelow') 'vert diffsplit' fnameescape(diff[i].filename)
            call s:add_mappings()
        endfor
    endif
endfunction

function! s:add_mappings() abort
    nnoremap <buffer>]q :cnext <BAR> :call <sid>diff_current_quickfix_entry()<CR>
    nnoremap <buffer>[q :cprevious <BAR> :call <sid>diff_current_quickfix_entry()<CR>
    " Reset quickfix height. Sometimes it messes up after selecting another item
    11copen
    wincmd p
endfunction
