" cSpell: disable

" ------------------------------ Plugins ------------------------------"{{{
call plug#begin('~/.vim/plugged')

Plug '0x84/vim-coderunner'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'RRethy/vim-illuminate'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Valloric/ListToggle'
Plug 'adelarsq/vim-matchit'
Plug 'aklt/plantuml-syntax'
Plug 'altercation/vim-colors-solarized'
Plug 'andrejlevkovitch/vim-lua-format'
Plug 'arecarn/vim-fold-cycle'
Plug 'brookhong/cscope.vim'
Plug 'chrisbra/SudoEdit.vim'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-titlecase'
Plug 'farmergreg/vim-lastplace'
Plug 'gcmt/wildfire.vim'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'jacoborus/tender.vim'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'jiazhoulvke/jianfan'
Plug 'jreybert/vim-largefile'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vader.vim'
Plug 'junegunn/vim-after-object'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-plug'
Plug 'junkblocker/git-time-lapse'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'liuchengxu/vista.vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mbbill/fencview'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'n0v1c3/vira', { 'do': './install.sh' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'rhysd/conflict-marker.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'rizzatti/dash.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'segeljakt/vim-silicon'
Plug 'skywind3000/asyncrun.vim'
Plug 'szw/vim-maximizer'
Plug 't9md/vim-choosewin'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'twitvim/twitvim'
Plug 'tyru/open-browser.vim'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/SQLUtilities'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'wellle/targets.vim'

Plug 'peterhoeg/vim-qml',            { 'for': 'qml'       }
Plug 'vim-scripts/Pydiction',        { 'for': 'python'    }
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app && yarn install' }
Plug 'xbot/pdv',                     { 'for': 'php'       }
Plug 'tobyS/vmustache',              { 'for': 'php'       }
Plug 'tpope/vim-dispatch',           { 'for': 'php'       }
Plug 'tpope/vim-projectionist',      { 'for': 'php'       }
Plug 'noahfrederick/vim-composer',   { 'for': 'php'       }
Plug 'noahfrederick/vim-laravel',    { 'for': 'php'       }
Plug 'arnaud-lb/vim-php-namespace',  { 'for': 'php'       }
Plug 'dgryski/vim-godef',            { 'for': 'go'        }
Plug 'fatih/vim-go',                 { 'for': 'go'        }
Plug 'Blackrush/vim-gocode',         { 'for': 'go'        }

" colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'base16-project/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'joshdick/onedark.vim'
Plug 'ldelossa/vimdark'
Plug 'lifepillar/vim-solarized8'
Plug 'liuchengxu/space-vim-theme'
Plug 'morhetz/gruvbox'

" LeaderF group
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'xbot/LeaderF-folder'
" Plug 'HaomingJu/LeaderF-gitlab' " Does not work with the settings given by the document

" Search plugins
Plug 'mhinz/vim-grepper'
Plug 'wincent/ferret'

" Zoom plugins
if has('nvim')
    Plug 'nyngwang/NeoZoom.lua'
endif
Plug 'dhruvasagar/vim-zoom'

" vimspector group
let g:vimspector_enable_mappings = 'HUMAN'
Plug 'puremourning/vimspector'

" fugitive group
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'rbong/vim-flog'
Plug 'sodapopcan/vim-twiggy'

" EnhancedJumps group
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-EnhancedJumps'

" ultisnips group
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" tabline and statusline group
if has('nvim')
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
    Plug 'nvim-lualine/lualine.nvim'
else
    " airline group
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
endif

" textobj-user group
let g:textobj_lastpat_no_default_key_mappings=1
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-diff'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-lastpat'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-syntax'
Plug 'glts/vim-textobj-comment'
Plug 'Julian/vim-textobj-variable-segment'
" Plug 'kana/vim-textobj-underscore' " Also provided in targets.vim
" Plug 'kentaro/vim-textobj-function-php' " Too old and 'if' works not as exptected in PHP syntax.

" ctags group
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

" offline plugins
Plug '~/.vim/plugged/gtags'
Plug '~/.vim/plugged/confluencewiki'

" neovim plugins
if has('nvim')
    Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
    Plug 'elihunter173/dirbuf.nvim' " Conflict with dirvish
    Plug 'f-person/git-blame.nvim'
    Plug 'github/copilot.vim'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    Plug 'kevinhwang91/nvim-hlslens'
    Plug 'mrjones2014/smart-splits.nvim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'phaazon/hop.nvim'
    Plug 'rcarriga/nvim-notify'
    Plug 'simnalamburt/vim-mundo'

    " fine-cmdline group
    Plug 'MunifTanjim/nui.nvim'
    Plug 'VonHeikemen/fine-cmdline.nvim'

    " telescope group
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-symbols.nvim'

    " diffview group
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'sindrets/diffview.nvim'

    " auto-session group
    " Will complain errors under GUI
    if !has('gui_running')
        Plug 'rmagatti/auto-session'
        Plug 'rmagatti/session-lens'
    endif

    " treesitter group
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

    " nvim-tree group
    Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
    Plug 'kyazdani42/nvim-tree.lua'

    " Experimental replacements of coc.nvim
    Plug 'sbdchd/neoformat'
    " Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
    " Experience needs to be improved.
    " Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

    " Plug 'caenrique/nvim-toggle-terminal'
    " Plug 'tveskag/nvim-blame-line' " Has performance problem

    " " one-small-step-for-vimkind requires vim has no output on startup,
    " " which is too strict to be satisfied since there is always some output,
    " " e.x. when restoring sessions
    " Plug 'jbyuki/one-small-step-for-vimkind'
    " Plug 'mfussenegger/nvim-dap'

    " " defx group
    " " This plugin has been stopped developing, see ddu.vim and ddu-ui-filer
    " Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    " Plug 'kristijanhusak/defx-git'
    " Plug 'kristijanhusak/defx-icons'
else
    Plug 'chrisbra/Colorizer'
    Plug 'easymotion/vim-easymotion'
    Plug 'gcmt/taboo.vim' " Conflict with bufferline.nvim
    Plug 'mbbill/undotree', { 'on': 'UndotreeToggle'   }
    Plug 'pakutoma/toggle-terminal'
    Plug 'rhysd/vim-healthcheck'
    Plug 'vim-scripts/AnsiEsc.vim' " To enhance vim-flog

    " defx group
    " This plugin has been stopped developing, see ddu.vim and ddu-ui-filer
    Plug 'Shougo/defx.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

if has('gui_running')
    Plug 'drmikehenry/vim-fontsize'
endif

" Plug 'plasticboy/vim-markdown',     { 'for': 'markdown' }
" Plug 'NTBBloodbath/rest.nvim'
" Plug 'dense-analysis/ale'
" Plug 'joeytwiddle/sexy_scroller.vim'
" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" Plug 'ojroques/vim-oscyank'
" Plug 'psliwka/vim-smoothie'
" Plug 'tweekmonster/startuptime.vim'

" " Conflict with dirbuf
" Plug 'justinmk/vim-dirvish'
" " Plug 'kristijanhusak/vim-dirvish-git'
" Plug 'roginfarrer/vim-dirvish-dovish', {'branch': 'main'}

" Buggy
" Plug 'brooth/far.vim'

" " nerdtree group
" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()
"}}}

" ------------------------------ Miscellaneous ------------------------------"{{{
function! s:plugged(bundle)
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
if IsPlatform('win')
    source $VIMRUNTIME/mswin.vim
    behave mswin
    map <C-f> <PageDown>
endif
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
source $HOME/.vimrc_private

if IsPlatform('mac')
    let g:ruby_host_prog='~/.rbenv/shims/ruby'
    let g:python_host_prog='~/.pyenv/shims/python2'
    let g:python3_host_prog='~/.pyenv/shims/python3'
else
    let g:python3_host_prog='/usr/bin/python3'
endif

"}}}

" ------------------------------ Application Settings ------------------------"{{{
set nowrap
set nobackup
set number
set relativenumber
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
" set winheight=9999
set clipboard+=unnamed
set mouse=a
set vb t_vb=
set laststatus=2
set updatetime=10000
set cursorline
set cursorcolumn
if has('nvim')
    set undodir=~/.vim/undodir/nvim/
else
    set undodir=~/.vim/undodir/vim/
endif
set undofile
set termguicolors
set nrformats+=alpha
set shiftround
" set spell
if IsPlatform('win')
    set grepprg=d:/dev/tool/GnuWin32/bin/grep.exe\ -n
else
    " set grepprg=grep\ -n
    set grepprg=ag\ --nogroup\ --column\ -U\ --ignore\ tags
endif
set wildignore=*.class,*.pyc
set fillchars+=diff:\
set cedit=\<C-E>

if has('nvim')
    let g:backupdir=expand(stdpath('data') . '/backup')
    if !isdirectory(g:backupdir)
        call mkdir(g:backupdir, "p")
    endif
    let &backupdir=g:backupdir
endif

if has('gui_running')
    if !has('nvim')
        set macligatures
        set macthinstrokes
        " set guifont=Monaco\ for\ Powerline:h16
        " set guifont=Cascadia\ Code\ PL:h16
        set guifont=CaskaydiaCove\ Nerd\ Font:h16
    endif

    set linespace=2

    " set background=dark
    set background=light

    " let g:solarized_diffmode="high"
    " colorscheme solarized

    colorscheme solarized8_flat
    " colorscheme flattened_light
    " colorscheme dracula
    " colorscheme nord
    " colorscheme tender
    " colorscheme onedark
    " colorscheme gruvbox
    " colorscheme base16-default-light

    " set lines=65 columns=189
    " set lines=70 columns=300
    set lines=70 columns=189

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
    " neovide hacks
    if exists('g:neovide')
        set guifont=CaskaydiaCove\ Nerd\ Font:h16
        let g:neovide_cursor_vfx_mode = "torpedo"
        let g:neovide_remember_window_size = v:true
        set linespace=2
    endif

    " For CLI vim
    " set background=light
    " set background=dark
    " let g:solarized_termcolors=256
    " colorscheme solarized
    " colorscheme nord
    " colorscheme dracula
    " colorscheme space_vim_theme
    " colorscheme flattened_light
    " colorscheme solarized8_flat
    " colorscheme base16-oned

    if has('nvim')
        let g:tokyonight_style = 'day' " available: night, storm, day
        let g:tokyonight_italic_functions = 1
        " Change the "hint" color to the "orange" color, and make the "error" color bright red
        let g:tokyonight_colors = {
                    \ 'hint': 'orange',
                    \ 'error': '#ff0000'
                    \ }
        colorscheme tokyonight
    else
        set background=light
        let g:solarized_termcolors=256
        colorscheme solarized8_flat
    endif
endif

" vim-airline colorscheme
if s:plugged('vim-airline')
    if !has('gui_running') && has('nvim')
        let g:airline_theme = 'base16_harmonic_light'
        " let g:airline_theme = 'base16_solarized_light'
    else
        " let g:airline_theme = 'solarized'
        " let g:airline_theme = 'base16_onedark'
        let g:airline_theme = 'base16_solarized_light'
        " let g:airline_theme = 'base16_one_light'
        " let g:airline_theme = 'base16_grayscale_light'
        " let g:airline_theme = 'transparent'
        " let g:airline_theme = 'base16_unikitty_light'
    endif
endif
" LeaderF colorscheme
if s:plugged('LeaderF')
    if !has('gui_running') && has('nvim')
        let g:Lf_PopupColorscheme = 'default'
        " let g:Lf_PopupColorscheme = 'gruvbox_default'
        let g:Lf_PopupPalette = {
            \  'light': {
            \      'Lf_hl_popup_inputText': {
            \                'gui': 'NONE',
            \                'font': 'NONE',
            \                'guifg': '#627E99',
            \                'guibg': '#E4EAF0',
            \                'cterm': 'NONE',
            \                'ctermfg': '255',
            \                'ctermbg': '237'
            \              },
            \      'Lf_hl_popup_window': {
            \                'gui': 'NONE',
            \                'font': 'NONE',
            \                'guifg': '#555555',
            \                'guibg': '#DADBE1',
            \                'cterm': 'NONE',
            \                'ctermfg': '255',
            \                'ctermbg': '237'
            \              },
            \      'Lf_hl_popup_blank': {
            \                'gui': 'NONE',
            \                'font': 'NONE',
            \                'guifg': '#627E99',
            \                'guibg': '#E4EAF0',
            \                'cterm': 'NONE',
            \                'ctermfg': '255',
            \                'ctermbg': '237'
            \              }
            \      }
            \  }
    else
        " let g:Lf_PopupColorscheme = 'default'
        let g:Lf_PopupColorscheme = 'gruvbox_material'
        " let g:Lf_PopupColorscheme = 'powerline'
        " let g:Lf_PopupColorscheme = 'one'
        " let g:Lf_PopupColorscheme = 'popup'
    endif
endif

" Auto reload file if changed outside.
set autoread
au FocusGained,BufEnter * if mode() == 'n' && getcmdwintype() == '' | checktime | endif

"}}}

" ------------------------------ Plugin Settings --------------------------{{{
" FencView settings
let g:fencview_autodetect    = 0
let g:fencview_checklines    = 10
let g:fencview_auto_patterns = '*.txt,*.htm{l\=},*.php,*.lib,*.inc,*.sql'

" incsearch settings
if s:plugged('incsearch.vim')
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
endif

" UltiSnips settings
if s:plugged('ultisnips')
    let g:UltiSnipsExpandTrigger                           = '<C-Tab>'
    let g:UltiSnipsJumpForwardTrigger                      = '<C-j>'
    let g:UltiSnipsJumpBackwardTrigger                     = '<C-k>'
    let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = '~/.vim/UltiSnips'
    let g:ulti_expand_or_jump_res                          = 0
    let g:UltiSnipsEditSplit                               = 'tabdo'
    let g:UltiSnipsEnableSnipMate                          = 0

    nmap <leader>ue :UltiSnipsEdit<Space>

    " inoremap <silent> <TAB> <C-r>=CleverTab()<CR>
    " snoremap <silent> <TAB> <ESC>:call UltiSnips#ExpandSnippetOrJump()<CR>
    " function! CleverTab()"{{{
        " call UltiSnips#ExpandSnippetOrJump()
        " if g:ulti_expand_or_jump_res
            " return ''
        " else
            " if s:plugged('coc.nvim')
                " if coc#pum#visible()
                    " return coc#_select_confirm()
                " else
                    " return coc#refresh()
                " endif
            " else
                " if pumvisible()
                    " return "\<c-n>"
                " endif
            " endif
        " endif
    " endfunction"}}}
endif

" Ferret settings
" @see https://0x3f.org/posts/the-best-practice-of-searching-in-vim/
if s:plugged('ferret')
    let g:FerretExecutable='rg'
    let g:FerretExecutableArguments = {
                \   'ag': '--skip-vcs-ignores --ignore-dir=storage --vimgrep --width 4096 --follow --ignore-dir=vendor/composer --ignore-dir=storage',
                \   'rg': '--no-ignore-vcs --vimgrep --no-heading --no-config --max-columns 4096 --follow -g !vendor/composer/ -g !storage/ -g !node_modules/'
                \ }
    let g:FerretQFHandler='botright copen 20'
    let g:FerretLLHandler='botright lopen 20'

    nmap <leader>ak  <Plug>(FerretAck)
    nmap <leader>lak <Plug>(FerretLack)
    nmap <leader>aw  <Plug>(FerretAckWord)
    nmap <leader>as  <Plug>(FerretAcks)
    vmap <leader>ak  y:Ack <C-R>=EscapeRegex(@", 1)<CR>
    vmap <leader>lak y:Lack <C-R>=EscapeRegex(@", 1)<CR>

    " The patterns passed to the :Ack command may be not compatible with the
    " :Acks command, so we need to escape some characters in them additionally
    " in the command-line window.
    augroup escape_ferret_pattern_in_the_current_line_in_commandline_window
        au!
        au BufEnter * if mode() == 'n' && getcmdwintype() == '' | nnoremap <leader>ee :call EscapeFerretPatternInCurrentLine()<CR> | endif
    augroup END

    function! EscapeFerretPatternInCurrentLine()
        exec 's/>/\\>/g'
        exec 's/&/\\&/g'
    endfunction

    " List all tasks under the current directory
    map <leader><leader>tl :Ack //\s(TODO\|FIXME)\s(lidong\|donie)<CR>
    if has("autocmd")
        " Highlight TODO, FIXME, NOTE, etc.
        if v:version > 701
            autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|BUG\|HACK\)')
            autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
        endif
    endif
endif

" ListToggle settings
if s:plugged('ListToggle')
    let g:lt_location_list_toggle_map = '<leader>lt'
    let g:lt_quickfix_list_toggle_map = '<leader>ct'
    let g:lt_height = 20
endif

" Pydiction Settings
if s:plugged('Pydiction')
    if IsPlatform('win')
        let g:pydiction_location = 'D:/Program Files/vim/vimfiles/plugged/Pydiction/complete-dict'
    else
        let g:pydiction_location = '~/.vim/plugged/Pydiction/complete-dict'
    endif
endif

" SQL Type Default
let g:sql_type_default = 'sqlsvr'

" NERD_commenter Settings
if s:plugged('nerdcommenter')
    let NERDSpaceDelims = 1
    let NERDCreateDefaultMappings = 0
    map <leader>cc <plug>NERDCommenterComment
    map <leader>cs <plug>NERDCommenterSexy
    map <leader>cu <plug>NERDCommenterUncomment
endif

" NERD Tree
if s:plugged('nerdtree')
    nmap <leader>nt :NERDTreeToggle<CR>
    nmap <leader>nf :NERDTreeFind<CR>
    nmap <leader>nd :NERDTree %:h<CR>

    let NERDTreeIgnore      = ['\.scc$', '\.pyc$', '\~$']
    let NERDTreeNaturalSort = 1
endif

" TwitVim settings
if s:plugged('twitvim')
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
endif

if IsPlatform('win')
    let g:netrw_http_cmd = $VIM.'\plugged\binary-utils\dist\bin\curl.exe -o'
endif

if IsPlatform('win')
    let g:pydoc_cmd = "python C:\\Python27\\Lib\\pydoc.py"
endif

" shell.vim
let g:shell_mappings_enabled=0

" DirDiff
if s:plugged('vim-dirdiff')
    let g:DirDiffExcludes = 'CVS,*.class,*.exe,.*.swp,.svn,.git,assets,tags'
endif

" ALE settings
if s:plugged('ale')"{{{
    let g:ale_sign_column_always = 0
    let g:ale_set_highlights = 0
    let g:ale_set_signs = 0
    let g:ale_sign_highlight_linenrs = 1
    let g:airline#extensions#ale#enabled = 1
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '⚠'
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

    let g:ale_fix_on_save = 0
    let g:ale_php_phpcs_standard = 'PSR2'
    let g:ale_php_phpcs_executable='./vendor/bin/phpcs'
    let g:ale_php_php_cs_fixer_executable='./vendor/bin/php-cs-fixer'
    let g:ale_fixers = {'php': ['php_cs_fixer']}

    let g:ale_lint_on_save = 0
    let g:ale_linters = {'php': ['phpstan'], 'markdown': ['markdownlint']}
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

    " au FileType php let b:ale_disable_lsp = 1
endif"}}}

" pdv settings
let g:pdv_template_dir = $HOME .'/.vim/plugged/pdv/templates_snip'
augroup pdv
    au!
    au FileType php nnoremap <buffer> <leader>\\ :call pdv#DocumentWithSnip()<CR>
augroup END

" gtags settings
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

" easy-align settings
if s:plugged('vim-easy-align')
    vmap <leader>al <Plug>(EasyAlign)
    let g:easy_align_ignore_groups = ['String']
endif

" vim-markdown
let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim', 'php', 'bash=sh']

" leaderf settings
if s:plugged('LeaderF')"{{{
    let g:Lf_ShortcutF       = '<C-P>'
    let g:Lf_DefaultMode     = 'NameOnly'
    let g:Lf_DelimiterChar   = ";"
    let g:Lf_WindowPosition  = 'popup'
    let g:Lf_PreviewInPopup  = 1
    let g:Lf_CommandMap      = {'<c-c>': ['<esc>', '<c-c>']}
    let g:Lf_ExternalCommand = 'rg --files --no-ignore --follow "%s"'
    let g:Lf_ReverseOrder    = 1
    let g:Lf_StlSeparator    = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "Cascadia Code PL" }
    let g:Lf_ShowDevIcons    = 1
    let g:Lf_DevIconsFont    = "CaskaydiaCove Nerd Font"
    let g:Lf_ShowHidden      = 1
    let g:Lf_RgConfig        = [
        \ "--hidden"
    \ ]
    " Bring left border of the popup window into alignment.
    let g:Lf_PopupShowFoldcolumn = 0

    " " Looks not so good.
    " let g:Lf_PopupShowBorder = 1
    " let g:Lf_PopupBorders = ["─","│","─","│","╭","╮","╯","╰"]

    " autocmd FileType leaderf setlocal signcolumn=no

    nmap <leader>be  :LeaderfBuffer<CR>
    nmap <leader>bf  :LeaderfFunction<CR>
    nmap <leader>bt  :LeaderfBufTag<CR>
    nmap <leader>cl  :LeaderfColorscheme<CR>
    nmap <leader>cm  :LeaderfCommand<CR>
    nmap <leader>fh  :LeaderfHistoryCmd<CR>
    nmap <leader>fl  :LeaderfLine<CR>
    nmap <leader>hp  :LeaderfHelp<CR>
    nmap <leader>mru :LeaderfMru<CR>
    nmap <leader>ot  :call <SID>flexible_leaderf_tag()<CR>

    function! s:flexible_leaderf_tag()"{{{
        let l:cmd = "Leaderf tag"

        let l:cword = s:get_cword_safely()
        if l:cword != ''
            let l:cmd = l:cmd . " --input " . l:cword
        endif

        exec l:cmd
    endfunction"}}}
endif"}}}

" bufferline.nvim settings
if s:plugged('bufferline.nvim')
    nnoremap L :BufferLineCycleNext<CR>
    nnoremap H :BufferLineCyclePrev<CR>

    nnoremap <silent><A-L> :BufferLineMoveNext<CR>
    nnoremap <silent><A-H> :BufferLineMovePrev<CR>

    nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
    nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
    nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
    nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
    nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
    nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
    nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
    nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
    nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
    nnoremap <silent><leader>0 <Cmd>BufferLineGoToBuffer -1<CR>

lua << EOF
require("bufferline").setup({
    options = {
        mode = "buffers",
        separator_style = "slant",
        numbers = "ordinal",
        close_command = "bdelete! %d",
        right_mouse_command = nil,
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator_icon = "▎",
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 10,
        diagnostics = 'coc',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = ""
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or "")
                s = s .. sym
            end
            return s
        end,
        custom_filter = function(bufnr)
            -- if the result is false, this buffer will be shown, otherwise, this
            -- buffer will be hidden.

            -- filter out filetypes you don't want to see
            local exclude_ft = { "qf", "fugitive", "git" }
            local cur_ft = vim.bo[bufnr].filetype
            local should_filter = vim.tbl_contains(exclude_ft, cur_ft)

            if should_filter then
                return false
            end

            return true
        end,
        show_buffer_icons = false,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = "id",
    },
})
EOF
endif

" lualine settings
if s:plugged('lualine.nvim')
lua << END
require('lualine').setup{
    options = {
        icons_enabled = true,
        theme = 'auto',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }
        },
        lualine_x = {
            { 'diagnostics', sources = { "coc" }, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } },
            'encoding',
            'filetype'
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }
        },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {'fugitive', 'nvim-tree', 'quickfix', 'toggleterm'},
}
END
endif

" airline settings
if s:plugged('vim-airline')
    let g:airline_powerline_fonts = 1
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
endif

" vim-choosewin
if s:plugged('vim-choosewin')
    nmap - <Plug>(choosewin)
    let g:choosewin_overlay_enable = 0
endif

" wildfire
if s:plugged('wildfire.vim')
    nmap <leader>vv <Plug>(wildfire-quick-select)
endif

" vim-test settings
if s:plugged('vim-test')
    let g:test#runner_commands = ['PHPUnit']
    augroup vim_test"{{{
        au!
        autocmd FileType php nnoremap <leader>tT :call MyTestRun('nothing')<CR>:PHPUnit <C-R>=expand('%:.')<CR> --filter '::test'<Left>
        autocmd FileType php nnoremap <leader>tn :call MyTestRun('nearest')<CR>
        autocmd FileType php nnoremap <leader>tL :call MyTestRun('last')<CR>
        autocmd FileType php nnoremap <leader>tF :call MyTestRun('file')<CR>
        autocmd FileType php nnoremap <leader>trbn :TestNearest -d rebase<CR>
        autocmd FileType php nnoremap <leader>trbf :TestFile -d rebase<CR>
    augroup END"}}}
    function! MyTestRun(runner)"{{{
        if (exists('g:vimspector_is_running'))
            let g:test#php#phpunit#executable = 'env XDEBUG_SESSION=1 ./vendor/bin/phpunit'
        else
            let g:test#php#phpunit#executable = './vendor/bin/phpunit'
        endif

        if a:runner == "nothing"
            return ""
        endif

        call test#run(a:runner, [])
    endfunction"}}}
endif

if has('nvim')
    " let test#strategy = 'asyncrun'
    " let test#strategy = 'make'
    " let test#strategy = 'dispatch'
    " let test#strategy = 'vimproc'
    let test#strategy = 'neovim'
else
    " let test#strategy = 'asyncrun'
    " let test#strategy = 'dispatch'
    let test#strategy = 'vimterminal'
    " let test#vim#term_position = "topleft"
endif

" Git mappings, coc, fugitive settings
if s:plugged('vim-fugitive')
    nnoremap <leader>gg  <Cmd>Git<CR>
    nnoremap <leader>gl  <Cmd>Git pull<CR>
    nnoremap <leader>gp  <Cmd>Git push<CR>
    nnoremap <leader>dgh <Cmd>diffget //2<CR>
    nnoremap <leader>dgl <Cmd>diffget //3<CR>
    nnoremap <Leader>gb  <Cmd>Git blame<CR>
endif
if s:plugged('coc.nvim')
    nnoremap <leader>gc  <Cmd>CocList branches<CR>
endif
if s:plugged('git-time-lapse')
    nnoremap <leader>gtl <Cmd>GitTimeLapse<CR>
endif
if s:plugged('vim-twiggy')
    nnoremap <leader>lb :Twiggy<CR>

    let g:twiggy_group_locals_by_slash = 0
    let g:twiggy_local_branch_sort     = 'mru'
    let g:twiggy_remote_branch_sort    = 'date'
    let g:twiggy_num_columns           = 50
endif

" gv.vim settings
if s:plugged('gv.vim')
    nnoremap <leader>gvl :GV  --pretty=%cd\ %h%d\ %s\ (%an,\ %ci) --date=format:%Y-%m-%d --abbrev-commit --no-merges<CR>
    nnoremap <leader>gvc :GV! --pretty=%cd\ %h%d\ %s\ (%an,\ %ci) --date=format:%Y-%m-%d --abbrev-commit --no-merges<CR>
    nnoremap <leader>gva :GV  --pretty=%cd\ %h%d\ %s\ (%an,\ %ci) --date=format:%Y-%m-%d --abbrev-commit --no-merges --author<space>
    nnoremap <leader>gvg :GV  --pretty=%cd\ %h%d\ %s\ (%an,\ %ci) --date=format:%Y-%m-%d --abbrev-commit --no-merges --grep<space>
    vnoremap <leader>gvc :GV!<CR>
    augroup gv
        au FileType git set fdl=0
    augroup END
endif

" vim-flog settings
if s:plugged('vim-flog')
    nnoremap <leader>gvv :Flog -all<CR>

    if s:plugged('AnsiEsc.vim')
        let g:flog_use_ansi_esc = 1
    endif
endif

" auto-pairs settings
if s:plugged('auto-pairs')
    let g:AutoPairsMapCh = 0
endif

" Nord color scheme
let g:nord_italic = 1
let g:nord_italic_comments = 1

" vim-fontsize
if s:plugged('vim-fontsize')
    nmap <silent> <Leader>=  <Plug>FontsizeBegin
    nmap <silent> <Leader>+  <Plug>FontsizeInc
    nmap <silent> <Leader>-  <Plug>FontsizeDec
    nmap <silent> <Leader>0  <Plug>FontsizeDefault
endif

" Toggle terminal
if has('nvim') && s:plugged('toggleterm.nvim')
lua << EOF
require("toggleterm").setup{
    open_mapping    = [[<c-\>]],
    direction       = 'float',
    insert_mappings = true,
    shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
}
EOF
elseif has('nvim') && s:plugged('nvim-toggle-terminal')
    nnoremap <silent> <C-\> :ToggleTerminal<Enter>
    tnoremap <silent> <C-\> <C-\><C-n>:ToggleTerminal<Enter>
elseif s:plugged('toggle-terminal')
    let g:toggle_terminal#command = 'zsh'
    nnoremap <silent> <C-\> :ToggleTerminal<CR>
    tnoremap <silent> <C-\> <C-w>:ToggleTerminal<CR>
endif

" startify settings
if s:plugged('vim-startify')
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
endif

" Gutentags settings
if s:plugged('vim-gutentags') && s:plugged('gutentags_plus')
    let g:gutentags_plus_nomap = 1
    " let g:gutentags_define_advanced_commands = 1
    " enable gtags module
    let g:gutentags_modules = ['ctags', 'gtags_cscope']
    " config project root markers.
    " let g:gutentags_project_root = ['.root']
    " generate datebases in my cache directory, prevent gtags files polluting my project
    if has('nvim')
        let g:gutentags_cache_dir = expand('~/.cache/tags')
    else
        let g:gutentags_cache_dir = expand('~/.cache/vim_tags')
    endif
    " change focus to quickfix window after search (optional).
    let g:gutentags_plus_switch = 1
    let g:gutentags_ctags_exclude = ['_ide_helper.php', '*.js', 'Makefile']
    let g:gutentags_ctags_extra_args = ['--PHP-kinds=+cdfint-va']
endif

" undotree
if s:plugged('undotree')
    nnoremap <leader>ut :UndotreeToggle<CR>
endif

" merginal settings
if s:plugged('merginal')
    let g:merginal_splitType=''
endif

" defx settings
if s:plugged('defx.nvim')
    call defx#custom#option('_', {
                \ 'winwidth': 50,
                \ 'split': 'vertical',
                \ 'direction': 'topleft',
                \ 'show_ignored_files': 0,
                \ 'buffer_name': 'tabfx',
                \ 'columns': 'icon:icons:indent:filename:git:size',
                \ 'toggle': 1,
                \ 'resume': 1,
                \ 'listed': 1
                \ })

    call defx#custom#column('icon', {
                \ 'directory_icon': '▸',
                \ 'opened_icon': '▾',
                \ 'root_icon': '+',
                \ })

    call defx#custom#column('mark', {
                \ 'readonly_icon': '✗',
                \ 'selected_icon': '✓',
                \ })

    nnoremap <silent> <Leader>dt :<C-U>Defx<CR>
    nnoremap <silent>sf :<C-u>Defx -listed -resume -buffer-name=tab`tabpagenr()` `expand('%:p:h')` -search=`expand('%:p')`<CR>
    nnoremap <silent><leader>fi :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>

    autocmd FileType defx call s:defx_mappings()

    function! s:defx_mappings() abort
        nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
        nnoremap <silent><buffer><expr> <BS>  defx#do_action('cd', ['..'])
        nnoremap <silent><buffer><expr> <C-r> defx#do_action('redraw')
        nnoremap <silent><buffer><expr> D     defx#do_action('new_directory')
        nnoremap <silent><buffer><expr> N     defx#do_action('new_file')
        nnoremap <silent><buffer><expr> S     defx#do_action('toggle_sort', 'FILENAME')
        nnoremap <silent><buffer><expr> o     <SID>defx_toggle_tree()
        nnoremap <silent><buffer><expr> t     defx#do_action('open', 'tabnew')
    endfunction

    function! s:defx_toggle_tree() abort
        " Open current file, or toggle directory expand/collapse
        if defx#is_directory()
            return defx#do_action('open_or_close_tree')
        endif
        return defx#do_action('multi', ['drop'])
    endfunction
endif

" vim-plug settings
let g:plug_window='-tabnew'

" vim-clap
if s:plugged('vim-clap')
    " let g:clap_theme = 'material_design_dark'
    " let g:clap_theme = { 'search_text': {'guifg': 'red', 'ctermfg': 'red'} }
    let g:clap_provider_grep_executable = 'rg'
    let g:clap_provider_grep_opts = '--no-ignore-vcs --vimgrep --no-heading --no-config --max-columns 4096 --ignore-case --follow'
endif

" unimpaired
if s:plugged('vim-unimpaired')
    vmap <S-Up>    [egv
    vmap <S-Down>  ]egv
    vmap <S-Left>  <gv
    vmap <S-Right> >gv
endif

" dirbuf.nvim settings
if s:plugged('dirbuf.nvim')
    nmap _ <Plug>(dirbuf_up)

lua << EOF
require("dirbuf").setup {
    hash_padding = 2,
    show_hidden  = true,
    sort_order   = "directories_first",
}
EOF
endif

" dirvish settings
if s:plugged('vim-dirvish')
    let g:dirvish_mode = ':sort ,^\v(.*[\/])|\ze,'
    let g:dirvish_git_show_ignored = 0

    nmap <silent> <Space>- :Dirvish<CR>
    nmap <silent> _ :execute (@% == '' ? 'Dirvish' : 'Dirvish %')<CR>
    autocmd FileType dirvish nmap <silent><buffer> _ <Plug>(dirvish_up)

    " --- dirvish-dovish settings ---{{{
    " unmap all default mappings
    let g:dirvish_dovish_map_keys = 0

    augroup dirvish_dovish_map_keys
        au!
        au FileType dirvish unmap <buffer> p
        au FileType dirvish nmap <silent><buffer> i  <Plug>(dovish_create_file)
        au FileType dirvish nmap <silent><buffer> I  <Plug>(dovish_create_directory)
        au FileType dirvish nmap <silent><buffer> dd <Plug>(dovish_delete)
        au FileType dirvish nmap <silent><buffer> r  <Plug>(dovish_rename)
        au FileType dirvish nmap <silent><buffer> yy <Plug>(dovish_yank)
        au FileType dirvish xmap <silent><buffer> yy <Plug>(dovish_yank)
        au FileType dirvish nmap <silent><buffer> p  <Plug>(dovish_copy)
        au FileType dirvish nmap <silent><buffer> P  <Plug>(dovish_move)
    augroup END
    " --- END ---}}}
endif

" nvim-tree.lua settings
if s:plugged('nvim-tree.lua')
    nnoremap <silent> <leader>tf :NvimTreeFindFileToggle<CR>
    nnoremap <silent> <leader>tt :NvimTreeToggle<CR>

lua << EOF
require("nvim-tree").setup {
    view = {
        adaptive_size = true,
        centralize_selection = false,
        width = 50,
        height = 50,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
                -- user mappings go here
            },
        },
    },
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        timeout = 400,
    },
    filters = {
        dotfiles = true,
    },
}
EOF
endif

" sideways settings
" Move items/parameters/arguments left or right.
if s:plugged('sideways.vim')
    nnoremap <S-Left>  :SidewaysLeft<CR>
    nnoremap <S-Right> :SidewaysRight<CR>
endif

" vim-expand-region settings
if s:plugged('vim-expand-region')
    vmap v <Plug>(expand_region_expand)
    vmap V <Plug>(expand_region_shrink)
endif

" vim-silicon settings
if s:plugged('vim-silicon')
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
          \   'line-number':           v:false,
          \   'round-corner':          v:true,
          \   'window-controls':       v:false,
          \ }
endif

" vim-which-key settings
if s:plugged('vim-which-key')
    let g:mapleader = ','
    let g:maplocalleader = ','
    let g:which_key_vertical = 1
    nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>
    nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
endif

" vim-fold-cycle settings
if s:plugged('vim-fold-cycle')
    let g:fold_cycle_default_mapping = 0 "disable default mappings
    nmap <Right> <Plug>(fold-cycle-open)
    nmap <Left> <Plug>(fold-cycle-close)
endif

" vira settings
if s:plugged('vira')
    " let g:vira_async_timer = 30000
    " let g:vira_async_timer_init = 30000
    let g:vira_config_file_servers  = $HOME . '/.config/vira/vira_servers.yaml'
    let g:vira_config_file_projects = $HOME . '/.config/vira/vira_projects.yaml'
    let g:vira_menu_height          = 50

    nnoremap <silent> <leader>va  :ViraSetActiveTicket<space>
    nnoremap <silent> <leader>vb  :ViraBrowse<CR>
    nnoremap <silent> <leader>vc  :ViraComment<CR>
    nnoremap <silent> <leader>ved :ViraEditDescription<CR>
    nnoremap <silent> <leader>vfR :ViraFilterReset<CR>
    nnoremap <silent> <leader>vfe :ViraFilterEdit<CR>
    nnoremap <silent> <leader>vfr :ViraFilterReporter<CR>
    nnoremap <silent> <leader>vfs :ViraFilterStatuses<CR>
    nnoremap <silent> <leader>vi  :ViraIssues<CR>
    nnoremap <silent> <leader>vq  :ViraQuit<CR>
    nnoremap <silent> <leader>vr  :ViraReport<CR>
    nnoremap <silent> <leader>vsa :ViraSetAssignee<CR>

    command! -nargs=1 ViraSetActiveIssue :call s:Vira_SetActiveIssue(<q-args>)
    function! s:Vira_SetActiveIssue(ticket_number)"{{{
        let g:vira_active_issue = 'DEV-' .. a:ticket_number
        ViraReport
    endfunction"}}}

    command! -nargs=0 ViraInitActiveIssue :call s:Vira_SetActiveIssueGivenCurrentGitBranch()
    function! s:Vira_SetActiveIssueGivenCurrentGitBranch()"{{{
        let l:current_branch_name = system("git branch --show-current")
        let g:vira_active_issue = matchstr(l:current_branch_name, 'DEV-\d\+')
    endfunction"}}}
    call s:Vira_SetActiveIssueGivenCurrentGitBranch()
endif

" textobj settings
if s:plugged('vim-textobj-lastpat')
    xmap an <Plug>(textobj-lastpat-n)
    omap an <Plug>(textobj-lastpat-n)
    xmap aN <Plug>(textobj-lastpat-N)
    omap aN <Plug>(textobj-lastpat-N)
endif

" rest.nvim settings
if s:plugged('rest.nvim')
    au FileType http nmap <leader>sr <Plug>RestNvim
endif

" vim-devicons settings
if s:plugged('vim-devicons')
    let g:webdevicons_enable_airline_tabline = 1
    let g:webdevicons_enable_airline_statusline = 1
endif

" vim-oscyank settings
if s:plugged('vim-oscyank') && !exists('g:neovide')
    autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg +' | endif
endif

" nvim-colorizer settings
if s:plugged('nvim-colorizer')
lua << EOF
require'colorizer'.setup {
    '*';
}
EOF
endif

" diffview settings
" :DiffviewFileHistory
if s:plugged('diffview.nvim')
    nnoremap <leader>dv :DiffviewOpen<CR>
    lua << EOF
    local actions = require("diffview.actions")

    require'diffview'.setup {
        diff_binaries = false,    -- Show diffs for binaries
        enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
        use_icons = true,         -- Requires nvim-web-devicons
        icons = {                 -- Only applies when use_icons is true.
        folder_closed = "",
        folder_open = "",
        },
        signs = {
            fold_closed = "",
            fold_open = "",
        },
        file_panel = {
            win_config = {
                position = "left",            -- One of 'left', 'right', 'top', 'bottom'
                width = 35,                   -- Only applies when position is 'left' or 'right'
                height = 10,                  -- Only applies when position is 'top' or 'bottom'
            },
            listing_style = "tree",       -- One of 'list' or 'tree'
            tree_options = {              -- Only applies when listing_style is 'tree'
                flatten_dirs = true,
                folder_statuses = "always"  -- One of 'never', 'only_folded' or 'always'.
            }
        },
        file_history_panel = {
            win_config = {
                position = "bottom",
                width = 35,
                height = 16,
            },
            log_options = {
                single_file = {
                    max_count = 256,      -- Limit the number of commits
                    follow = false,       -- Follow renames (only for single file)
                    all = false,          -- Include all refs under 'refs/' including HEAD
                    merges = false,       -- List only merge commits
                    no_merges = false,    -- List no merge commits
                    reverse = false,      -- List commits in reverse order
                },
                multi_file = {
                    max_count = 256,      -- Limit the number of commits
                    all = false,          -- Include all refs under 'refs/' including HEAD
                    merges = false,       -- List only merge commits
                    no_merges = false,    -- List no merge commits
                    reverse = false,      -- List commits in reverse order
                }
            },
        },
        default_args = {    -- Default args prepended to the arg-list for the listed commands
            DiffviewOpen = {},
            DiffviewFileHistory = {},
        },
        keymaps = {
            disable_defaults = true, -- Disable the default keymaps
            view = {
                -- The `view` bindings are active in the diff buffers, only when the current
                -- tabpage is a Diffview.
                ["<tab>"]      = actions.select_next_entry, -- Open the diff for the next file
                ["<s-tab>"]    = actions.select_prev_entry, -- Open the diff for the previous file
                ["gf"]         = actions.goto_file_tab,         -- Open the file in a new split in previous tabpage
                ["<C-w><C-f>"] = actions.goto_file_split,   -- Open the file in a new split
                ["<C-w>gf"]    = actions.goto_file,     -- Open the file in a new tabpage
                ["<leader>e"]  = actions.focus_files,       -- Bring focus to the files panel
                ["<leader>b"]  = actions.toggle_files,      -- Toggle the files panel.
            },
            file_panel = {
                ["j"]             = actions.next_entry,         -- Bring the cursor to the next file entry
                ["<down>"]        = actions.next_entry,
                ["k"]             = actions.prev_entry,         -- Bring the cursor to the previous file entry.
                ["<up>"]          = actions.prev_entry,
                ["<cr>"]          = actions.select_entry,       -- Open the diff for the selected entry.
                ["o"]             = actions.select_entry,
                ["<2-LeftMouse>"] = actions.select_entry,
                ["-"]             = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
                ["S"]             = actions.stage_all,          -- Stage all entries.
                ["U"]             = actions.unstage_all,        -- Unstage all entries.
                ["X"]             = actions.restore_entry,      -- Restore entry to the state on the left side.
                ["R"]             = actions.refresh_files,      -- Update stats and entries in the file list.
                -- ["L"]             = actions.open_commit_log,    -- Open the commit log panel.
                ["<c-b>"]         = actions.scroll_view(-0.25), -- Scroll the view up
                ["<c-f>"]         = actions.scroll_view(0.25),  -- Scroll the view down
                ["<tab>"]         = actions.select_next_entry,
                ["<s-tab>"]       = actions.select_prev_entry,
                ["gf"]            = actions.goto_file_tab,
                ["<C-w><C-f>"]    = actions.goto_file_split,
                ["<C-w>gf"]       = actions.goto_file,
                ["i"]             = actions.listing_style,        -- Toggle between 'list' and 'tree' views
                ["f"]             = actions.toggle_flatten_dirs,  -- Flatten empty subdirectories in tree listing style.
                ["<leader>e"]     = actions.focus_files,
                ["<leader>b"]     = actions.toggle_files,
            },
            file_history_panel = {
                ["g!"]            = actions.options,          -- Open the option panel
                ["<C-A-d>"]       = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
                ["y"]             = actions.copy_hash,        -- Copy the commit hash of the entry under the cursor
                -- ["L"]             = actions.open_commit_log,
                ["zR"]            = actions.open_all_folds,
                ["zM"]            = actions.close_all_folds,
                ["j"]             = actions.next_entry,
                ["<down>"]        = actions.next_entry,
                ["k"]             = actions.prev_entry,
                ["<up>"]          = actions.prev_entry,
                ["<cr>"]          = actions.select_entry,
                ["o"]             = actions.select_entry,
                ["<2-LeftMouse>"] = actions.select_entry,
                ["<c-b>"]         = actions.scroll_view(-0.25),
                ["<c-f>"]         = actions.scroll_view(0.25),
                ["<tab>"]         = actions.select_next_entry,
                ["<s-tab>"]       = actions.select_prev_entry,
                ["gf"]            = actions.goto_file_tab,
                ["<C-w><C-f>"]    = actions.goto_file_split,
                ["<C-w>gf"]       = actions.goto_file,
                ["<leader>e"]     = actions.focus_files,
                ["<leader>b"]     = actions.toggle_files,
            },
            option_panel = {
                ["<tab>"] = actions.select_entry,
                ["q"]     = actions.close,
            },
        },
    }

    function _G.diff_view_commit(commit_hash)
        require'diffview'.open(commit_hash .. '~1..' .. commit_hash)
    end
EOF

    au! FileType GV call <SID>MapKeyBindingsForGv()
    function! s:MapKeyBindingsForGv()
        exec 'nnoremap ri <Esc>:call <SID>RebaseInteractivelySinceCommitUnderCursorInGv()<CR>'
        exec 'nnoremap vv <Esc>:call <SID>DiffviewCommitUnderCursorInGv()<CR>'
    endfunction

    function! s:RebaseInteractivelySinceCommitUnderCursorInGv()
        normal! ^2f w
        exec 'Git rebase --interactive ' . expand('<cword>') . '~1'
    endfunction

    function! s:DiffviewCommitUnderCursorInGv()
        normal! ^2f w
        call v:lua.diff_view_commit(expand('<cword>'))
    endfunction

    au! FileType floggraph nnoremap vv <Esc>:call <SID>DiffviewCommitUnderCursorInFlog()<CR>
    function! s:DiffviewCommitUnderCursorInFlog()
        normal! ^f[w
        call v:lua.diff_view_commit(expand('<cword>'))
    endfunction
endif

" Tabular settings
if s:plugged('tabular')
    au FileType markdown inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

    function! s:align()"{{{
        let p = '^\s*|\s.*\s|\s*$'
        if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
            let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
            let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
            Tabularize/|/l1
            normal! 0
            call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
        endif
    endfunction"}}}
endif

" vista settings
if s:plugged('vista.vim')
    nnoremap <silent> <leader>tb :Vista!!<CR>

    let g:vista_ignore_kinds = ['Variable', 'Function']
    let g:vista_sidebar_position = 'vertical botright'
    let g:vista_sidebar_width = 50
    let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
    let g:vista_default_executive = 'coc'
    let g:vista_executive_for = {
                \ 'php': 'coc',
                \ }
    let g:vista_fzf_preview = ['right:50%']
    let g:vista#renderer#enable_icon = 1
    let g:vista#renderer#icons = {
                \   "function": "\uf794",
                \   "variable": "\uf71b",
                \  }
    let g:vista_stay_on_open = 0
endif

" Telescope settings
if s:plugged('telescope.nvim')
    nnoremap <leader>tslg <cmd>Telescope live_grep<CR>

lua << EOF
require('telescope').setup{
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                ["<esc>"] = require('telescope.actions').close,
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key",
                ["<C-j>"] = require('telescope.actions').move_selection_next,
                ["<C-k>"] = require('telescope.actions').move_selection_previous
            }
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
}
EOF
endif

" auto-session settings
if s:plugged('auto-session')
    set sessionoptions+=winpos,terminal,folds

    let g:auto_session_pre_save_cmds = ["tabdo Vista!", "tabdo windo call CleanupBeforeSaveSession()", "tabdo NvimTreeClose"]

    nnoremap <leader>os :<C-u>SearchSession<CR>
    nnoremap <leader>ss :<C-u>SaveSession<CR>

lua << EOF
require('auto-session').setup {
    log_level = 'error',
    auto_session_use_git_branch = true,
    auto_session_enabled = true,
    auto_session_create_enabled = false,
    auto_save_enabled = false,
}
EOF

    function! CleanupBeforeSaveSession()"{{{
        let l:ft = &ft

        if l:ft == 'GV'
            execute ':tabclose'
        elseif l:ft == 'DiffviewFiles' || l:ft == 'DiffviewFileHistory'
            execute ':tabclose'
        endif
    endfunction"}}}
endif

" session-lens settings
if s:plugged('session-lens')
lua << EOF
require('session-lens').setup {
    path_display = {'shorten'},
    -- previewer = true
}
EOF
endif

" vim-lua-format settings
if s:plugged('vim-lua-format')
    " TODO: Choose a proper key binding "
    " autocmd FileType lua nnoremap <buffer> <c-k> :call LuaFormat()<CR>
    " autocmd BufWrite *.lua call LuaFormat()
endif

" gist-vim settings
if s:plugged('gist-vim')
    nnoremap <leader><leader>gl :Gist -l<CR>
    nnoremap <leader><leader>gb :Gist -b<CR>
endif

" Vimspector settings
if s:plugged('vimspector')
    " let g:vimspector_bottombar_height = 0

    let g:vimspector_sign_priority = {
                \    'vimspectorBP':         999,
                \    'vimspectorBPCond':     999,
                \    'vimspectorBPLog':      999,
                \    'vimspectorBPDisabled': 999,
                \    'vimspectorPC':         999,
                \ }

    au FileType php nmap <F3> :call MyVimspectorRun('stop')<CR>
    au FileType php nmap <F5> :call MyVimspectorRun('continue')<CR>
    au FileType php nmap <Leader>bp <Plug>VimspectorBreakpoints
    au FileType php nmap <leader><leader><F3> :call MyVimspectorRun('reset')<CR>
    au FileType php nmap <leader>di <Plug>VimspectorBalloonEval
    au FileType php xmap <leader>di <Plug>VimspectorBalloonEval

    function! MyVimspectorRun(command)"{{{
        if a:command == 'continue'
            let g:vimspector_is_running = 1
        elseif exists('g:vimspector_is_running')
            unlet g:vimspector_is_running
        endif

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
    endfunction"}}}

    function! s:CustomiseUI()"{{{
        call win_gotoid( g:vimspector_session_windows.variables )
        exe "normal \<C-W>_"

        " " Close the trace window
        " call win_gotoid( g:vimspector_session_windows.stack_trace )
        " hide

        " Close the output window
        call win_gotoid( g:vimspector_session_windows.output )
        hide
    endfunction"}}}

    function s:SetUpTerminal()"{{{
        " Customise the terminal window size/position
        " For some reasons terminal buffers in Neovim have line numbers
        call win_gotoid( g:vimspector_session_windows.terminal )
        set norelativenumber nonumber
    endfunction"}}}

    augroup MyVimspectorUICustomistaion
        autocmd!
        autocmd User VimspectorUICreated call s:CustomiseUI()
        autocmd User VimspectorTerminalOpened call s:SetUpTerminal()
    augroup END
endif

" Far.vim settings
if s:plugged('far.vim')
    set lazyredraw            " improve scrolling performance when navigating through large results
    set regexpengine=1        " use old regexp engine
    set ignorecase smartcase  " ignore case only when the pattern contains no capital letters

    let g:far#source = 'rg'

    nnoremap <silent> <leader>ff :Farf<CR>
    vnoremap <silent> <leader>ff :Farf<CR>
    nnoremap <silent> <leader>fr :Farr<CR>
    vnoremap <silent> <leader>fr :Farr<CR>
endif

" Fine-cmdline settings
if s:plugged('fine-cmdline.nvim')
    nnoremap <leader>fc <cmd>FineCmdline<CR>
endif

" nvim-dap settings
if s:plugged('nvim-dap')
lua << END
local dap = require"dap"
dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = "Attach to running Neovim instance",
    host = function()
      local value = vim.fn.input('Host [127.0.0.1]: ')
      if value ~= "" then
        return value
      end
      return '127.0.0.1'
    end,
    port = function()
      local val = tonumber(vim.fn.input('Port: '))
      assert(val, "Please provide a port number")
      return val
    end,
  }
}

dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host, port = config.port })
end
END
endif

" vim-grepper settings
if s:plugged('vim-grepper')
    nmap <leader>gs <plug>(GrepperOperator)
    xmap <leader>gs <plug>(GrepperOperator)
endif

" copilot.vim settings
if s:plugged('copilot.vim')
    let g:copilot_node_command = "~/.nvm/versions/node/v16.15.0/bin/node"

    imap <M-,> <Plug>(copilot-previous)
    imap <M-.> <Plug>(copilot-next)
endif

" vim-php-namespace settings
if s:plugged('vim-php-namespace')
    let g:php_namespace_sort_after_insert  = 1
    let g:php_namespace_expand_to_absolute = 1

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
endif

" NeoZoom settings
if s:plugged('NeoZoom.lua')
lua << EOF
require('neo-zoom').setup {}
EOF
endif

" smart-splits.nvim settings
if s:plugged('smart-splits.nvim')
    nmap <A-Left>  :SmartResizeLeft<CR>
    nmap <A-Right> :SmartResizeRight<CR>
    nmap <A-Up>    :SmartResizeUp<CR>
    nmap <A-Down>  :SmartResizeDown<CR>
    nmap <C-h>     :SmartCursorMoveLeft<CR>
    nmap <C-l>     :SmartCursorMoveRight<CR>
    nmap <C-j>     :SmartCursorMoveDown<CR>
    nmap <C-k>     :SmartCursorMoveUp<CR>
endif

" lsp_lines.nvim settings
if s:plugged('lsp_lines.nvim')
lua << EOF
require("lsp_lines").setup()
-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
    virtual_text = false,
})
vim.keymap.set("", "<Leader>tl", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
EOF
endif

" Goyo settings
if s:plugged('goyo.vim')
    function! s:goyo_enter()
        set nocursorcolumn
    endfunction

    function! s:goyo_leave()
        set cursorcolumn
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
endif

" nvim-treesitter settings
if s:plugged('nvim-treesitter')
lua << EOF
require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { 'bash', 'c', 'go', 'javascript', 'json', 'lua', 'php', 'python', 'vim', 'yaml' },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = {},

    indent = { enable = true },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        disable = {},

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
EOF
endif

" hop.nvim settings
if s:plugged('hop.nvim')
lua << EOF
require'hop'.setup()

-- Line-wise motions
vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})

-- Context-wise motions
vim.api.nvim_set_keymap('', '<leader><leader>f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', '<leader><leader>F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', '<leader><leader>t', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', '<leader><leader>T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })<cr>", {})
EOF
endif

" nvim-hlslens settings
if s:plugged('nvim-hlslens')
lua << EOF
local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
EOF
endif

" wilder settings
if s:plugged('wilder.nvim')
    call wilder#setup({
                \ 'modes': [':', '/', '?'],
                \ 'next_key': '<Tab>',
                \ 'previous_key': '<S-Tab>',
                \ 'accept_key': '<Down>',
                \ 'reject_key': '<Up>',
                \ 'enable_cmdline_enter': 0,
                \ })
endif

" neoformat settings
if s:plugged('neoformat')
    let g:neoformat_php_phpcsfixer = {
            \ 'exe': './vendor/bin/php-cs-fixer',
            \ 'args': ['fix', '--ansi'],
            \ 'replace': 1,
            \ }

    let g:neoformat_enabled_php = ['phpcsfixer']
endif

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
    au BufRead *.omnijs set filetype=javascript
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
    au FileType php        setl fdm=syntax
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
    " au WinLeave * if &buftype=='quickfix' | lclose | endif
    au! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter>
augroup END

" vim help
augroup vim_help
    au!
    au FileType vim set keywordprg='help'
augroup END

augroup disable_numbers_in_diff_mode
    au!
    au BufEnter * if &diff | set nonu nornu | endif
augroup END

if s:plugged('taboo.vim')
    augroup on_gv_start
        au!
        au FileType GV TabooRename Commits
    augroup END
endif

" vim-after-object settings
if s:plugged('vim-after-object')
    autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
endif
"}}}

" ------------------------------ Key mappings -------------------------------"{{{
" Quit mappings
nmap <leader><leader>q :q<CR>
imap <leader><leader>q <ESC>:q<CR>
nmap <leader>aq :qa<CR>
imap <leader>aq <ESC>:qa<CR>
nmap <leader>Q  :q!<CR>
imap <leader>Q  <ESC>:q!<CR>
nmap <leader>aQ :qa!<CR>
imap <leader>aQ <ESC>:qa!<CR>

" Edit mappings
nmap <leader>w :up<CR>
nmap <leader>W :SudoWrite<CR>
imap <leader>w <ESC>:up<CR>
imap <leader>W <ESC>:SudoWrite<CR>
nmap <leader>x :x<CR>
imap <leader>x <ESC>:x<CR>
imap <leader>u <C-O>:normal u<CR>
imap <leader>o <C-O>:normal o<CR>
imap <leader>O <C-O>:normal O<CR>
xnoremap <expr> p '"_d"'.v:register.'P'
imap <C-e> <ESC>A

" Tab and window mappings
nmap <C-T><C-T> :tabnew<CR>
imap <C-T><C-T> <ESC>:tabnew<CR>

if s:plugged('bufferline.nvim')
    nmap <C-T><C-W> :bdelete<CR>
    imap <C-T><C-W> <ESC>:bdelete<CR>

    nmap <leader>tc :bdelete<CR>
    imap <leader>tc <ESC>:bdelete<CR>
else
    nmap <C-T><C-W> :tabc<CR>
    imap <C-T><C-W> <ESC>:tabc<CR>

    nmap <leader>tc :tabc<CR>
    imap <leader>tc <ESC>:tabc<CR>
endif

nmap <leader>to :tabo<CR>
nmap <leader><leader>dut :tab sp<CR>
nnoremap <leader>oo <C-w><C-o>
inoremap <leader>oo <ESC><C-w><C-o>a
nmap <leader>hs :sp<CR><C-W>_
nmap <leader>vs :vsp<CR><C-W>_
if s:plugged('vim-maximizer')
    nnoremap <leader>mm :MaximizerToggle<CR>
    vnoremap <leader>mm :MaximizerToggle<CR>gv
    inoremap <leader>mm <C-o>:MaximizerToggle<CR>
endif
" Jump to next window and maximize it.
" Notice that <TAB> is equivalent to <C-I> in some conditions,
" so remap <C-I> as an opposite of <C-O>.
nmap     <Tab>   <C-W>j<C-W>_
nnoremap <S-Tab> <C-W>k<C-W>_
nnoremap <C-U>   <C-I>

" Move window around
" :h window-moving
" <C-W> H, J, K, L
nnoremap <leader>T <C-w>T

" Motion remappings
nnoremap gH H
nnoremap gM M
nnoremap gL L
if ! s:plugged('bufferline.nvim')
    nnoremap H  :tabp<CR>
    nnoremap L  :tabn<CR>
endif

" Move focus among windows
" Use smart-splits.nvim in neovim
if !has('nvim')
    nnoremap <C-k> <C-W>k
    nnoremap <C-j> <C-W>j
    nnoremap <C-h> <C-W>h
    nnoremap <C-l> <C-W>l
endif

" Current file or path related mappings
nmap <leader><leader>O   :e <C-R>=expand("%:p:~")<CR>
nmap <leader><leader>D   :e <C-R>=expand("%:p:~:h").'/'<CR>
nmap <leader><leader>rn  :Rename <C-R>=expand('%:t')<CR>
nmap <leader><leader>mv  :Move <C-R>=expand('%:.')<CR>
nmap <leader><leader>rm  :Delete
nmap <leader><leader>duf :saveas <C-R>=expand('%:.')<CR>

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

" Delete lines which contain the current word or selected text.
nnoremap <leader>dl yiw:call Preserve("g/".EscapeRegex(@")."/d")<CR>
vnoremap <leader>dl y:call   Preserve("g/".EscapeRegex(@")."/d")<CR>

" Set TODO comments done.
nnoremap <leader>dn :s/\(^\s*\/\/\s\)\@<=TODO\s\(lidong\\|donie\):\s//<CR>

" Edit & source vimrc
exec 'nmap <leader><leader>, :tabnew '.gbl_vimrc_file.'<CR><C-W>_'
exec 'nmap <leader><leader>. :so '.gbl_vimrc_file.'<CR>'
" Source vimrc after it is modified
" exec 'au! bufwritepost '.gbl_vimrc_name.' so '.gbl_vimrc_file
" To fix the problem that the folding method remains to be 'syntax' when open the vimrc file in a php file
exec 'au! bufreadpre '.gbl_vimrc_name.' setl fdm=marker'

" Show PWD
nmap <leader>pwd :pwd<CR>

" Convert between traditional and simplified chinese characters.
nmap <leader>g2b <ESC>:call G2B()<CR>
nmap <leader>b2g <ESC>:call B2G()<CR>

" Find and replace
nmap <leader>// yiw/\<<C-R>"\>\C
vmap <leader>// y/\m<C-R>=EscapeRegex(@")<CR>\C
" vmap <leader>// y/\V<C-R>=escape(@",'/\')<CR>
nmap <leader>rr yiw:%s/\<<C-R>"\>\C//g<LEFT><LEFT>
vmap <leader>rr y:%s/<C-R>=EscapeRegex(@")<CR>\C//g<LEFT><LEFT>
nmap <leader>rl yiw:s/\<<C-R>"\>\C//g<LEFT><LEFT>
vmap <leader>rl y:s/<C-R>=EscapeRegex(@")<CR>\C//g<LEFT><LEFT>

" " Convert between encodings.
" nmap <leader>gbk  :set fenc=cp936<CR>
" nmap <leader>utf8 :set fenc=utf-8<CR>
" nmap <leader>fdos :set ff=dos<CR>
" nmap <leader>edos :e   ++ff=dos<CR>
" nmap <leader>unix :set ff=unix<CR>

" 为xbindkeys捕获热键
if has('unix') && executable('xbindkeys')
    nmap <leader>key :let @+=system('xbindkeys -k\|tail -n 1')<CR>
endif

" Select the last pasted area
nnoremap vp `[v`]
nnoremap vP V']

" Clear highlighting of the last search
nmap <leader><leader>cc :nohl<CR>

" Search word
" if has('gui_running')
    " nmap <leader>/w /\<\>\C<left><left><left><left>
" else
    nmap <leader>/w /\<\>\C<left><left><left><left><left><left><left><left><left><left><left><left><left><left>
" endif

" Format JSON string
nmap <leader><leader>json :%!python -m json.tool<CR>:set ft=json<CR>

" repeat last command
nmap <leader>!! :<up><CR>

" dash
nmap <silent> <leader><leader>ds <Plug>DashSearch

" Open MR of the current branch in web browser
nmap <leader><leader>mr :AsyncRun glab mr view -w<CR>

" Open the link under cursor
if IsPlatform('mac')
    nnoremap gx <Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>
elseif IsPlatform('unix')
    nnoremap gx <Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>
endif
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

" @see https://vim.fandom.com/wiki/Different_syntax_highlighting_within_regions_of_a_file
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
command! -nargs=0 SaveNOEOF :call SaveNOEOF()
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
" @see http://0x3f.org/posts/humanize-preview-window-in-vim/
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
command! -nargs=0 PruneBuffers call CloseFugitiveBuffers()
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
function! EscapeRegex(str, ...)"{{{
    let pattern = a:str
    let pattern = escape(pattern, '^$.*[]~"/\')

    if a:0 && a:1
        let pattern = escape(pattern, '()+?{}|')
        let pattern = substitute(pattern, '\\/', '/', 'g')
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
    if exists('g:Lf_py') && !has('nvim')
        exec g:Lf_py "jumpsExplManager.refresh()"
        exec g:Lf_py "tagExplManager.refresh()"
        exec g:Lf_py "fileExplManager.refresh()"
    endif

    " Restart COC
    call coc#rpc#restart()
endfunction
nnoremap <leader><leader>rs :call ResetIDE()<CR>

" Copy relative path of current file.
command! CopyRelativeFilePath let @+=expand('%:.') | if s:plugged('vim-oscyank') | execute 'OSCYankReg +' | endif | echo 'File path copied.'
command! CopyAbsoluteFilePath let @+=expand('%:p') | if s:plugged('vim-oscyank') | execute 'OSCYankReg +' | endif | echo 'File path copied.'

" Copy fully qualified class & method name in php files
" @see https://github.com/tyru/current-func-info.vim
au filetype php command! CopyFQCN let @+=GetFullyQualifiedClassNameForPhp()  | if s:plugged('vim-oscyank') | execute 'OSCYankReg +' | endif | echo @+ . ' copied.'
au filetype php command! CopyFQMN let @+=GetFullyQualifiedMethodNameForPhp() | if s:plugged('vim-oscyank') | execute 'OSCYankReg +' | endif | echo @+ . ' copied.'
function! GetFullyQualifiedClassNameForPhp()"{{{
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
    normal! ^w"ayt;

    " Search for the class definition
    /\(^\(\(abstract\|final\)\s\+\|\)\)\@<=class\|^trait
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
function! GetFullyQualifiedMethodNameForPhp()"{{{
    let l:full_class_name = GetFullyQualifiedClassNameForPhp()

    if s:plugged('vista.vim')
        let l:is_vista_initially_openned = vista#sidebar#IsOpen()

        if !l:is_vista_initially_openned
            exec 'Vista!!'
        endif

        while !vista#sidebar#IsOpen()
            sleep 100m
        endw

        let l:current_tag = vista#util#BinarySearch(g:vista.functions, line('.'), 'lnum', 'text')

        if !l:is_vista_initially_openned
            exec 'Vista!'
        endif
    else
        " Fallback solution, should place the cursor on the method name.

        let l:r_a = @a

        normal! "ayiw

        let l:current_tag = @a

        let @a = l:r_a
    endif

    let l:full_method_name = l:full_class_name . '::' . l:current_tag . '()'

    return l:full_method_name
endfunction"}}}

function! s:get_cword_safely()"{{{
    let l:cword = expand('<cword>')

    if match(l:cword, '^\w\+$') == -1
        return ''
    endif

    return l:cword
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
" augroup php_force_html_comment
    " au!
    " au FileType php nmap <buffer> <leader>fhcc :call ForceHTMLComment("n", "Comment")<CR>
    " au FileType php vmap <buffer> <leader>fhcc :call ForceHTMLComment("x", "Comment")<CR>
    " au FileType php nmap <buffer> <leader>fhcs :call ForceHTMLComment("n", "Sexy")<CR>
    " au FileType php vmap <buffer> <leader>fhcs :call ForceHTMLComment("x", "Sexy")<CR>
    " au FileType php nmap <buffer> <leader>fhcu :call ForceHTMLComment("n", "Uncomment")<CR>
    " au FileType php vmap <buffer> <leader>fhcu :call ForceHTMLComment("x", "Uncomment")<CR>
" augroup END

function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    au!
    au FileType php call PhpSyntaxOverride()
augroup END
"}}}

" ------------------------------ COC settings -----------------------------{{{
if s:plugged('coc.nvim')
    nnoremap <leader>cocc :CocConfig<CR>

    let g:coc_node_path='~/.nvm/versions/node/v14.16.1/bin/node'
    let g:coc_global_extensions = [
        \'@yaegassy/coc-intelephense',
        \'@yaegassy/coc-nginx',
        \'@yaegassy/coc-phpstan',
        \'coc-diagnostic',
        \'coc-git',
        \'coc-grammarly',
        \'coc-json',
        \'coc-lists',
        \'coc-markdownlint',
        \'coc-php-cs-fixer',
        \'coc-project',
        \'coc-snippets',
        \'coc-spell-checker',
        \'coc-ultisnips',
        \'coc-vimlsp',
        \'coc-yaml',
        \'coc-yank',
        \]

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

    inoremap <silent><expr> <C-n>  coc#pum#visible() ? coc#pum#next(1)       : "\<C-n>"
    inoremap <silent><expr> <C-p>  coc#pum#visible() ? coc#pum#prev(1)       : "\<C-p>"
    inoremap <silent><expr> <down> coc#pum#visible() ? coc#pum#next(0)       : "\<down>"
    inoremap <silent><expr> <up>   coc#pum#visible() ? coc#pum#prev(0)       : "\<up>"
    inoremap <expr>         <cr>   coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

    " --- The COC implementation of <TAB> behavior ---
    inoremap <silent><expr> <TAB>
                \ coc#pum#visible() ? coc#_select_confirm() :
                \ coc#expandableOrJumpable() ?
                \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<tab>'
    " --- The COC implementation of <TAB> behavior END ---

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gD <Plug>(coc-declaration)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    " nmap <silent> gR <Plug>(coc-references)
    nmap <silent> gr <Plug>(coc-references-used)

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
        autocmd FileType typescript,json,php setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Code actions.
    xmap <leader>ac  <Plug>(coc-codeaction-selected)
    nmap <leader>ac  <Plug>(coc-codeaction-line)

    " Introduce function text object
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    " " 'if' works not as expected in PHP syntax.
    " xmap if <Plug>(coc-funcobj-i)
    " omap if <Plug>(coc-funcobj-i)

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
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
    " Manage extensions.
    nnoremap <silent> <space>e  :<C-u>CocList extensions<CR>
    " Show commands.
    nnoremap <silent> <space>c  :<C-u>CocList commands<CR>
    " Search workspace symbols.
    nnoremap <silent> <leader>cocs  :<C-u>CocList -I symbols<CR>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent> <leader>cocp  :<C-u>CocListResume<CR>
    nnoremap <leader>sy :<C-u>CocList -A --normal yank<CR>
    nnoremap <leader>sn :<C-u>CocList -A snippets<CR>
    nnoremap <leader>op :<C-u>CocList project<CR>
    " nnoremap <leader>os :<C-u>CocList sessions<CR>
    " nnoremap <leader>ss :<C-u>CocCommand session.save<CR>
    nnoremap <leader>sC :<C-u>let v:this_session=''<CR>:echo 'Session closed.'<CR>

    " vim-test is more convinient to run tests.
    " nmap <silent> gl <Plug>(coc-codelens-action)

    highlight CocFloating guibg=#99cccc guifg=#336699

    " " coc-prettier
    " command! -nargs=0 Prettier :CocCommand prettier.formatFile

    command! -nargs=0 CocFormat :call CocAction('format')<CR>
endif
"}}}
