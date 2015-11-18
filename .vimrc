"---------------------------------------------------------------------------
"        __             _       _                 _
"   ____/ /___   _____ (_)_____( )_____   _   __ (_)____ ___   _____ _____
"  / __  // _ \ / ___// // ___/|// ___/  | | / // // __ `__ \ / ___// ___/
" / /_/ //  __// /   / /(__  )  (__  )   | |/ // // / / / / // /   / /__
" \__,_/ \___//_/   /_//____/  /____/    |___//_//_/ /_/ /_//_/    \___/
"
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" basic settings {{{1

if has('vim_starting') && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
      \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif

if has('unix')
  let $DOTVIM=expand('~/.vim')
else
  let $DOTVIM=expand('~/vimfiles')
endif

let $VIMBUNDLE=$DOTVIM.'/bundle'
let $NEOBUNDLEPATH=$VIMBUNDLE.'/neobundle.vim'

function! s:bundled(bundle)
  if !isdirectory($VIMBUNDLE)
    return 0
  endif
  if stridx(&runtimepath, $NEOBUNDLEPATH) == -1
    return 0
  endif

  if a:bundle ==# 'neobundle.vim'
    return 1
  else
    return neobundle#is_installed(a:bundle)
  endif
endfunction

"---------------------------------------------------------------------------
" NeoBundle {{{2
filetype off

if has('vim_starting') && isdirectory($NEOBUNDLEPATH)
  set runtimepath+=$NEOBUNDLEPATH
endif

if s:bundled('neobundle.vim')
  call neobundle#begin($VIMBUNDLE)

  let g:neobundle_default_git_protocol = 'https'
  " original repos on github
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'AndrewRadev/linediff.vim'
  NeoBundle 'AndrewRadev/sideways.vim'
  NeoBundleLazy 'Keithbsmiley/swift.vim', { 'autoload' : {
    \ 'filetypes' : 'swift',
    \ }}
  NeoBundle 'LeafCage/yankround.vim'
  NeoBundle 'Shougo/neocomplete'
  NeoBundleLazy 'Shougo/neomru.vim', { 'autoload' : {
    \ 'unite_sources' : 'file_mru',
    \ }}
  NeoBundle 'Shougo/neosnippet', '', 'default'
  call neobundle#config('neosnippet', {
    \ 'lazy' : 1,
    \ 'autoload' : {
    \   'insert' : 1,
    \   'filetypes' : 'snippet',
    \   'commands' : ['NeoSnippetEdit'],
    \   'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
    \ }})
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'Shougo/unite.vim', '', 'default'
  call neobundle#config('unite.vim',{
    \ 'lazy' : 1,
    \ 'autoload' : {
    \   'commands' : [{ 'name' : 'Unite',
    \                   'complete' : 'customlist,unite#complete_source'},
    \                 'UniteWithCursorWord', 'UniteWithInput']
    \ }})
  NeoBundleLazy 'Shougo/unite-help', { 'autoload' : {
    \ 'unite_sources' : 'help',
    \ }}
  NeoBundle 'Shougo/unite-outline', '', 'default'
  call neobundle#config('unite-outline', {
    \ 'lazy' : 1,
    \ 'autoload' : {
    \   'unite_sources' : 'outline',
    \ }})
  NeoBundle 'Shougo/vimfiler', '', 'default'
  call neobundle#config('vimfiler', {
    \ 'lazy' : 1,
    \ 'depends' : 'Shougo/unite.vim',
    \ 'autoload' : {
    \   'commands' : [
    \                 { 'name' : 'VimFiler',
    \                   'complete' : 'customlist,vimfiler#complete' },
    \                 { 'name' : 'VimFilerTab',
    \                   'complete' : 'customlist,vimfiler#complete' },
    \                 { 'name' : 'VimFilerExplorer',
    \                   'complete' : 'customlist,vimfiler#complete' },
    \                 { 'name' : 'Edit',
    \                   'complete' : 'customlist,vimfiler#complete' },
    \                 { 'name' : 'Write',
    \                   'complete' : 'customlist,vimfiler#complete' },
    \                 'Read', 'Source'],
    \   'mappings' : ['<Plug>(vimfiler_switch)'],
    \   'explorer' : 1,
    \ }})
  NeoBundle 'Shougo/vimproc.vim', '', 'default'
  call neobundle#config('vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin'  : 'make -f make_cygwin.mak',
    \     'mac'     : 'make -f make_mac.mak',
    \     'unix'    : 'make -f make_unix.mak',
    \    },
    \ })
  NeoBundle 'Yggdroot/indentLine'
  NeoBundle 'airblade/vim-rooter'
  NeoBundleLazy 'basyura/J6uil.vim', {
    \ 'autoload' : {
    \   'commands' : [
    \     'J6uil',
    \   ],
    \   'unite_sources' : [
    \     'J6uil/rooms',
    \     'J6uil/members',
    \   ]},
    \ }
  NeoBundle 'basyura/unite-rails'
  NeoBundle 'bling/vim-airline'
  NeoBundleLazy 'chrisbra/vim-diff-enhanced', { 'autoload' : {
    \ 'commands' : [
    \   'EnhancedDiff',
    \   'PatienceDiff',
    \ ]}
    \ }
  NeoBundle 'cohama/agit.vim'
  NeoBundleLazy 'ctrlpvim/ctrlp.vim', { 'autoload' : {
    \   'mappings' : '<Plug>(ctrlp',
    \ }}
  NeoBundleLazy 'c9s/perlomni.vim', { 'autoload' : {
    \ 'filetypes' : ['perl']
    \ }}
  NeoBundle 'fatih/vim-go'
  NeoBundleLazy 'gregsexton/gitv', {
    \ 'depends' : 'tpope/vim-fugitive',
    \ 'autoload' : {
    \   'commands' : [
    \     'Gitv',
    \   ]},
    \ }
  NeoBundle 'haya14busa/vim-asterisk'
  NeoBundleLazy 'haya14busa/incsearch.vim', {
    \ 'autoload' : {
    \   'mappings' : '<Plug>(incsearch',
    \ }}
  NeoBundle 'junegunn/vim-easy-align'
  NeoBundleLazy 'justinmk/vim-sneak', {
    \ 'autoload' : {
    \   'mappings' : [
    \     '<Plug>Sneak',
    \   ]
    \ }}
  NeoBundle 'kana/vim-altr'
  NeoBundleLazy 'kana/vim-fakeclip'
  NeoBundle 'kana/vim-niceblock'
  NeoBundle 'kana/vim-operator-user'
  NeoBundle 'kana/vim-operator-replace',
    \ { 'depends' : 'kana/vim-operator-user' }
  NeoBundle 'kana/vim-smartchr'
  NeoBundleLazy 'kana/vim-smarttill', {
    \ 'autoload' : {
    \   'mappings' : [
    \     '<Plug>(smarttill-t)',
    \     '<Plug>(smarttill-T)',
    \   ],
    \ }}
  NeoBundle 'kana/vim-smartword'
  NeoBundle 'kana/vim-submode'
  NeoBundle 'kana/vim-textobj-user'
  NeoBundle 'kana/vim-textobj-entire',
    \ { 'depends' : 'kana/vim-textobj-user' }
  NeoBundle 'kana/vim-textobj-function',
    \ { 'depends' : 'kana/vim-textobj-user' }
  NeoBundle 'kana/vim-textobj-indent',
    \ { 'depends' : 'kana/vim-textobj-user' }
  NeoBundle 'kana/vim-textobj-line',
    \ { 'depends' : 'kana/vim-textobj-user' }
  NeoBundleLazy 'kana/vim-vspec'
  NeoBundle 'rhysd/vim-operator-surround'
  NeoBundle 'rhysd/vim-textobj-word-column'
  NeoBundleLazy 'majutsushi/tagbar', {
    \ 'autoload' : {
    \   'commands' : [
    \     'Tagbar'
    \   ]},
    \ }
  NeoBundleLazy 'mattn/gist-vim', {
    \ 'autoload' : {
    \   'commands' : [
    \     'Gist'
    \   ]},
    \ }
  NeoBundleLazy 'mattn/httpstatus-vim', {
    \ 'autoload' : {
    \   'commands' : [
    \     'HttpStatus',
    \   ],
    \   'unite_sources' : 'httpstatus',
    \ }}
  NeoBundle 'mattn/learn-vimscript'
  NeoBundle 'mattn/vim-textobj-url',
    \ { 'depends' : 'kana/vim-textobj-user' }
  NeoBundle 'mattn/emmet-vim'
  NeoBundle 'mhinz/vim-startify'
  NeoBundle 'mhinz/vim-signify'
  NeoBundle 'nelstrom/vim-markdown-folding'
  NeoBundle 'ntpeters/vim-better-whitespace'
  NeoBundleLazy 'osyo-manga/vim-brightest'
  NeoBundleLazy 'osyo-manga/vim-monster', { 'autoload' : {
    \   'filetypes' : ['ruby', 'eruby', 'haml'],
    \ }}
  NeoBundleLazy 'osyo-manga/vim-over', {
    \ 'autoload' : {
    \   'commands' : [
    \     'OverCommandLine',
    \   ]},
    \ }
  NeoBundle 'osyo-manga/vim-reanimate'
  NeoBundleLazy 'osyo-manga/unite-quickfix', { 'autoload' : {
    \ 'unite_sources' : 'quickfix',
    \ }}
  NeoBundleLazy 'osyo-manga/unite-filetype', { 'autoload' : {
    \ 'unite_sources' : 'filetype',
    \ }}
  NeoBundleLazy 'osyo-manga/unite-highlight', { 'autoload' : {
    \ 'unite_sources' : 'output:highlight',
    \ }}
  NeoBundle 'osyo-manga/vim-watchdogs'
  NeoBundleLazy 'pasela/unite-webcolorname', { 'autoload' : {
    \ 'unite_sources' : 'webcolorname',
    \ }}
  NeoBundleLazy 'rbtnn/vimconsole.vim', {
    \ 'autoload' : {
    \   'commands' : [
    \     'VimConsoleRedraw',
    \     'VimConsoleClear',
    \     'VimConsoleToggle',
    \     'VimConsoleDump',
    \     'VimConsole',
    \     'VimConsoleLog',
    \     'VimConsoleError',
    \     'VimConsoleWarn',
    \   ]},
    \ }
  NeoBundle 'rhysd/committia.vim'
  NeoBundle 'rhysd/conflict-marker.vim'
  NeoBundleLazy 'rhysd/vim-grammarous', {
    \ 'autoload' : {
    \   'commands' : [
    \     'GrammarousCheck',
    \     'GrammarousReset',
    \   ]},
    \ }
  NeoBundle 'rhysd/unite-ruby-require.vim'
  NeoBundleLazy 'rking/ag.vim'
  NeoBundle 'rphillips/vim-zoomwin'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'sgur/vim-textobj-parameter',
    \ { 'depends' : 'kana/vim-textobj-user' }
  NeoBundleLazy 'sjl/gundo.vim', {
    \ 'autoload' : {
    \   'commands' : [
    \     'GundoToggle',
    \   ]},
    \ }
  NeoBundle 't9md/vim-surround_custom_mapping'
  NeoBundle 'terryma/vim-expand-region'
  NeoBundle 'thinca/vim-ambicmd'
  NeoBundle 'thinca/vim-fontzoom'
  NeoBundleLazy 'thinca/vim-github', {
    \ 'autoload' : {
    \   'commands' : [
    \     'Github',
    \   ]},
    \ }
  NeoBundle 'thinca/vim-poslist'
  NeoBundleLazy 'thinca/vim-prettyprint', {
    \ 'autoload' : {
    \   'commands' : [
    \     'PP',
    \   ]},
    \ }
  NeoBundle 'thinca/vim-qfreplace'
  NeoBundleLazy 'thinca/vim-quickrun', {
    \ 'autoload' : {
    \   'mappings' : [
    \     ['nxo', '<Plug>(quickrun)']
    \   ],
    \   'commands' : [
    \     'QuickRun',
    \   ]},
    \ }
  NeoBundle 'thinca/vim-ref', '', 'default'
  call neobundle#config('vim-ref',{
    \ 'lazy' : 1,
    \ 'autoload' : {
    \   'commands' : [{ 'name' : 'Ref',
    \                   'complete' : 'customlist,ref#complete'}],
    \   'unite_sources' : ['ref'],
    \ }})
  NeoBundleLazy 'thinca/vim-scouter', {
    \ 'autoload' : {
    \   'commands' : [
    \     'Scouter',
    \   ]},
    \ }
  NeoBundle 'thinca/vim-singleton'
  NeoBundle 'thinca/vim-textobj-comment',
    \ { 'depends' : 'kana/vim-textobj-user' }
  NeoBundle 'thinca/vim-textobj-between',
    \ { 'depends' : 'kana/vim-textobj-user' }
  NeoBundleLazy 'thinca/vim-unite-history', { 'autoload' : {
    \ 'unite_sources' : ['history/command', 'history/search'],
    \ }}
  NeoBundle 'thinca/vim-themis'
  NeoBundle 'tpope/vim-commentary'
  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'tpope/vim-rails'
  NeoBundle 'tpope/vim-rbenv'
  NeoBundle 'tpope/vim-repeat'
  NeoBundle 'tpope/vim-surround'
  NeoBundleLazy 'tsukkee/unite-tag', { 'autoload' : {
    \ 'unite_sources' : 'tag',
    \ }}
  NeoBundleLazy 'tyru/capture.vim', {
    \ 'autoload' : {
    \   'commands' : [
    \     'Capture',
    \   ]},
    \ }
  NeoBundle 'tyru/operator-camelize.vim',
    \ { 'depends' : 'kana/vim-operator-user' }
  NeoBundle 'tyru/open-browser.vim', {
    \ 'autoload' : {
    \   'mappings' : '<Plug>(openbrowser-smart-search)',
    \   'commands' : [
    \     'OpenBrowserSmartSearch',
    \     'OpenBrowser',
    \   ]},
    \ }
  NeoBundleLazy 'tyru/operator-html-escape.vim',
    \ { 'depends' : 'kana/vim-operator-user' }
  NeoBundleLazy 'tyru/restart.vim', {
    \ 'gui' : 1,
    \ 'autoload' : {
    \   'commands' : [
    \     'Restart',
    \   ]},
    \ }
  NeoBundle 'tyru/winmove.vim'
  NeoBundleLazy 'ujihisa/unite-colorscheme', { 'autoload' : {
    \ 'unite_sources' : 'colorscheme',
    \ }}
  NeoBundle 'vim-jp/vital.vim'
  NeoBundleLazy 'vim-ruby/vim-ruby', { 'autoload' : {
    \ 'mappings' : '<Plug>(ref-keyword)',
    \ 'filetypes' : ['ruby', 'eruby', 'haml'],
    \ }}
  NeoBundle 'vimtaku/hl_matchit.vim'
  NeoBundle 'wellle/targets.vim'
  NeoBundleLazy 'will133/vim-dirdiff', { 'autoload' : {
    \ 'commands' : [
    \   'DirDiff',
    \ ]},
    \ }
  NeoBundle 'deris/columnjump'
  NeoBundle 'deris/vim-fitcolumn'
  NeoBundle 'deris/parajump'
  NeoBundle 'deris/vim-cmdline-switch'
  NeoBundle 'deris/vim-diffbuf'
  NeoBundle 'deris/vim-duzzle'
  NeoBundle 'deris/vim-pasta'
  NeoBundle 'deris/vim-operator-insert'
  NeoBundle 'deris/vim-quickfixdo'
  NeoBundle 'deris/vim-rengbang'
  NeoBundle 'deris/vim-shot-f'
  NeoBundle 'deris/vim-textobj-ipmac'
  NeoBundle 'deris/vim-textobj-enclosedsyntax',
    \ { 'depends' : 'kana/vim-textobj-user' }
  NeoBundle 'deris/vim-textobj-headwordofline',
    \ { 'depends' : 'kana/vim-textobj-user' }

  " vim-scripts repos
  NeoBundleLazy 'HybridText', { 'autoload' : {
    \ 'filetypes' : 'hybrid',
    \ }}
  NeoBundle 'L9'
  NeoBundleLazy 'UnconditionalPaste'
  NeoBundle 'matchit.zip'
  NeoBundleLazy 'vimwiki'

  " color scheme
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'croaker/mustang-vim'
  NeoBundle 'deris/molokai'
  NeoBundle 'deris/vim-wombat'
  NeoBundle 'jnurmine/Zenburn'
  NeoBundle 'nanotech/jellybeans.vim'
  NeoBundle 'newspaper.vim'
  NeoBundle 'w0ng/vim-hybrid'

  " Japanese help
  NeoBundle 'vim-jp/vimdoc-ja'

  " Installation check.
  NeoBundleCheck
  call neobundle#end()
endif
" }}}

if has('mac')
  set rtp+=~/go/src/github.com/nsf/gocode/vim
endif

filetype plugin indent on

if s:bundled('vim-singleton')
  if has('clientserver')
    call singleton#enable()
  endif
endif

"---------------------------------------------------------------------------
" Setting options:{{{2

" enable syntax highlighting
syntax enable

set ignorecase
set smartcase
set incsearch
set hlsearch

set tabstop=4
set expandtab
set autoindent
set backspace=indent,eol,start
set nowrapscan
set showmatch
set matchpairs+=<:>
set wildmenu
set wildmode=longest,full
set wildignore=.git,.hg,.svn
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.so,*.out,*.class
set wildignore+=*.swp,*.swo,*.swn
set wildignore+=*.DS_Store
let format_allow_over_tw = 1
set shiftwidth=2
set smartindent
set smarttab
set whichwrap=b,s,h,l,<,>,[,]
set hidden
set textwidth=0
set formatoptions-=t
set formatoptions-=c
set formatoptions-=r
set formatoptions-=o
set formatoptions-=v
set formatoptions+=l
set formatoptions+=j
set number
set ruler
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<
set t_Co=256
set nrformats=hex
set winaltkeys=no
set visualbell
set noequalalways

set nowrap
set laststatus=2
set cmdheight=2
set showcmd
set title
set lines=50
set showtabline=2
set previewheight=10
set helpheight=12
set virtualedit=block
set scrolloff=5
set backup

function! s:LetAndMkdir(variable, path) "{{{
  try
    if !isdirectory(a:path)
      call mkdir(a:path, 'p')
    endif
  catch
    echohl WarningMsg
    echom '[error]' . a:path . 'is exist and is not directory, but is file or something.'
    echohl None
  endtry

  execute printf("let %s = a:path", a:variable)
endfunction "}}}

call s:LetAndMkdir('&backupdir', $DOTVIM.'/backup')
if has('unix')
  set backupskip=/tmp/*,/private/tmp/*
endif
set swapfile
call s:LetAndMkdir('&directory', $DOTVIM.'/swap')
set history=2000
let &showbreak = '+++ '
set ttyfast
if has('persistent_undo')
  set undofile
  call s:LetAndMkdir('&undodir', $DOTVIM.'/undo')
endif

set tags=./tags;

let &termencoding = &encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set fileformats=unix,dos,mac

if exists('&ambiwidth')
  set ambiwidth=double
endif

if s:bundled('vim-wombat')
  colorscheme wombat
else
  colorscheme desert
endif

scriptencoding utf-8

if has('vim_starting') && has('unix')
  let $PATH=$PERLBREW_ROOT.'/bin:'.$PATH
  let s:my_perl_path = split(system('which perl'), '[\r\n]')[0]
  let s:my_perl_path = fnamemodify(s:my_perl_path, ':p:h')
  if s:my_perl_path =~ '^/'
    let $PATH=s:my_perl_path.':'.$PATH
  endif
endif

if has('win32')
  let g:my_win32_grep_path = 'C:/usr/local/bin/jvgrep.exe'

  if executable(g:my_win32_grep_path)
    let &grepprg = g:my_win32_grep_path . ' -n8 --enc utf-8,cp932,euc-jp'
  endif
elseif has('unix')
  if executable('ag')
    set grepprg=ag\ --vimgrep\ -S\ $*\ /dev/null
    set grepformat=%f:%l:%c:%m
  endif
endif

" Show em space
augroup hilightIdegraphicSpace
  autocmd!
  autocmd VimEnter,ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd Syntax * syntax match IdeographicSpace containedin=ALL /　/
augroup END

" vimdiff highlight
augroup diffcolor
  autocmd!
  autocmd VimEnter,ColorScheme * hi DiffAdd    cterm=bold ctermbg=DarkGreen   gui=bold guibg=DarkGreen
  autocmd VimEnter,ColorScheme * hi DiffChange            ctermbg=DarkMagenta          guibg=DarkMagenta
  autocmd VimEnter,ColorScheme * hi DiffDelete            ctermbg=DarkRed              guibg=DarkRed
  autocmd VimEnter,ColorScheme * hi DiffText   cterm=bold ctermbg=Blue        gui=bold guibg=Blue
augroup END

" highlight cursorline and cursorcolumn only current window
augroup cursorsetting
  autocmd!
  autocmd BufWinEnter,WinEnter * setlocal cursorline cursorcolumn
  autocmd BufWinLeave,WinLeave * setlocal nocursorline nocursorcolumn
augroup END

" move current file directory
augroup movecurrentdir
  autocmd!
  autocmd BufRead,BufEnter * lcd %:p:h
augroup END

" make directory if parent directory does'nt exist
augroup AutoMkdir
  autocmd!
  autocmd BufNewFile * call PromptAndMakeDirectory()
augroup END

function! PromptAndMakeDirectory()
  let dir = expand("<afile>:p:h")
  if !isdirectory(dir) && confirm("Create a new directory [".dir."]?", "&Yes\n&No") == 1
    call mkdir(dir, "p")
    " Reset fullpath of the buffer in order to avoid problems when using autochdir.
    file %
  endif
endfunction

let plugin_autodate_disable  = 1
let plugin_cmdex_disable     = 1
let plugin_dicwin_disable    = 1
let plugin_format_disable    = 1
let plugin_hz_ja_disable     = 1
let plugin_scrnmode_disable  = 1
let plugin_verifyenc_disable = 1

" }}}

"---------------------------------------------------------------------------
" key map:{{{2

let mapleader = ","
let maplocalleader = ","

nnoremap \  ,

if has('mac')
  noremap ¥ \
  noremap \ ¥
endif

" Esc
noremap  <C-[> <C-c>
noremap! <C-[> <C-c>
noremap  <C-c> <C-[>
noremap! <C-c> <C-[>
noremap  <C-@> <ESC>
noremap! <C-@> <ESC>

inoremap jk <Esc>
if has('mac')
  " prevent miss type
  inoremap <D-j>k <Esc>
  inoremap <D-j><D-k> <Esc>
endif

" switch j,k and gj,gk
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap gj j
vnoremap gk k

" key map ^,$ to <Space>h,l. Because ^ and $ is difficult to type and damage little finger!!!
noremap <Space>h ^
noremap <Space>l $

" same as above. but don't use noremap because want to map to matchit plugin
map <Space>n %

" move middle of current line.(not middle of screen)
nnoremap <silent> gm   :<C-u>call <SID>MoveMiddleOfLine()<CR>

function! s:MoveMiddleOfLine()
  let strwidth = strdisplaywidth(getline('.'))
  let winwidth  = winwidth(0)

  if strwidth < winwidth
    call cursor(0, col('$') / 2)
  else
    normal! gm
  endif
endfunction

" edit vimrc
if has('gui')
  nnoremap <silent> <Space>.   :<C-u>execute 'tab drop ' . escape(resolve($MYVIMRC), ' ')<CR>
else
  nnoremap <silent> <Space>.   :<C-u>execute 'tabe ' . escape(resolve($MYVIMRC), ' ')<CR>
endif

" for help
" nnoremap <C-h>      :<C-u>help<Space>
" nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>

" last selected text operator
onoremap gv         :<C-u>normal! gv<CR>

" select last changed text
nnoremap gc         `[v`]
vnoremap gc         :<C-u>normal gc<CR>
onoremap gc         :<C-u>normal gc<CR>
" move last changed text
nnoremap gI `.zz


" paste last yanked text
nnoremap 'p  "0p

" Use more logical mapping (see :h Y)
nnoremap Y y$
" paste from clipboard
nnoremap <Space>p "*p
vnoremap <Space>p "*p
nnoremap <Space>P "*P
vnoremap <Space>P "*P
" yank to clipboard
nnoremap <Space>y "*y
nnoremap <Space>Y "*y$
vnoremap <Space>y "*y
" delete to clipboard
nnoremap <Space>d "*d
nnoremap <Space>D "*d$
vnoremap <Space>d "*d

" insert blank line
nnoremap <silent> <Space>o   :<C-u>for i in range(1, v:count1) \| call append(line('.'),   '') \| endfor \| silent! call repeat#set("<Space>o", v:count1)<CR>
nnoremap <silent> <Space>O   :<C-u>for i in range(1, v:count1) \| call append(line('.')-1, '') \| endfor \| silent! call repeat#set("<Space>O", v:count1)<CR>
nnoremap <silent> <S-Space>O :<C-u>for i in range(1, v:count1) \| call append(line('.')-1, '') \| endfor \| silent! call repeat#set("<S-Space>O"), v:count1<CR>

" from ujihisa's vimrc
nnoremap <Space>I $i
nnoremap X ^x

" swap ; and :
nnoremap ; :
vnoremap ; :
nnoremap q; q:
vnoremap q; q:
nnoremap : ;
vnoremap : ;

" repeat last command-line
nnoremap <Space>; @:

" repeat the previous @x
nnoremap <Leader>. @@

" repeats the last command on every line
vnoremap .  :normal .<CR>

" @: repeats macro on every line
" vnoremap @  :normal @

let reg_list = []
call extend(reg_list, range(char2nr('0'), char2nr('9')))
call extend(reg_list, range(char2nr('a'), char2nr('z')))
call extend(reg_list, ['"', '.', '=', '*', '+', ':', '@'])
for i in reg_list
  execute 'vnoremap @'.i . ' :normal @'.i.'<CR>'
endfor

" disable because this is dangerous key
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" Don't use Ex mode, use Q for formatting
nnoremap Q gq

" Sticky Shift if difficult to type key
inoremap <expr> ;  <SID>sticky_func()
cnoremap <expr> ;  <SID>sticky_func()
snoremap <expr> ;  <SID>sticky_func()

function! s:sticky_func()
  let l:sticky_table = {
    \ ',' : '<', '.' : '>', '/' : '?',
    \ '1' : '!', '2' : '@', '3' : '#', '4' : '$', '5' : '%',
    \ '6' : '^', '7' : '&', '8' : '*', '9' : '(', '0' : ')', '-' : '_', '=' : '+',
    \ ';' : ':', '[' : '{', ']' : '}', '`' : '~', "'" : "\"", '\' : '|',
    \ }
  let l:special_table = {
    \ "\<ESC>" : "\<ESC>", "\<Space>" : ';', "\<CR>" : ";\<CR>"
    \ }

  let l:key = nr2char(getchar())
  if l:key =~ '\l'
    return toupper(l:key)
  elseif has_key(l:sticky_table, l:key)
    return l:sticky_table[l:key]
  elseif has_key(l:special_table, l:key)
    return l:special_table[l:key]
  else
    return 0
  endif
endfunction


nnoremap <silent><expr> r   <SID>sticky_with_replacemode(0)
nnoremap <silent><expr> gr  <SID>sticky_with_replacemode(1)

function! s:sticky_with_replacemode(gr)
  let l:gr = (a:gr ? 'gr' : 'r')

  let l:key = nr2char(getchar())
  if l:key == ';'
    return l:gr . s:sticky_func()
  else
    return l:gr . l:key
  endif
endfunction

" use <C-q> instead of @
nnoremap <C-q> @
nnoremap <C-q><C-q> @@

" map w to iw in motion. Because iw is commonly-used key and don't use w in motion.
onoremap w iw
onoremap W iW

" text-object
onoremap aa  a>
vnoremap aa  a>
onoremap ia  i>
vnoremap ia  i>

onoremap ar  a]
vnoremap ar  a]
onoremap ir  i]
vnoremap ir  i]

onoremap ad  a"
vnoremap ad  a"
onoremap id  i"
vnoremap id  i"

" ex command
nnoremap <Space>w :<C-u>update<CR>
nnoremap <Space>q :<C-u>SafeQuit<CR>
nnoremap <Space>Q :<C-u>SafeQuit!<CR>
nnoremap <S-Space>Q :<C-u>SafeQuit!<CR>
nnoremap <Space>bd :<C-u>bwipeout<CR>
nnoremap <Space>bD :<C-u>bwipeout!<CR>
nnoremap <Space>bb :<C-u>buffer #<CR>

function! s:safeQuit(bang)
  " exit if current buffer is last tab or last window
  if !(tabpagenr('$') == 1 && winnr('$') == 1)
    execute 'quit'.a:bang
    return
  endif

  " confirm whether exit or not
  echohl WarningMsg
  let l:input = input('Are you sure to quit vim?[y/n]: ')
  echohl None
  redraw!

  if l:input ==? 'y'
    execute 'quit'.a:bang
  endif
endfunction

command! -bang SafeQuit call s:safeQuit('<bang>')

" virtual replace mode
nnoremap R gR

" window commands
nnoremap <M-h>   <C-w>h
nnoremap <M-j>   <C-w>j
nnoremap <M-k>   <C-w>k
nnoremap <M-l>   <C-w>l
nnoremap <M-H>   <C-w>H
nnoremap <M-J>   <C-w>J
nnoremap <M-K>   <C-w>K
nnoremap <M-L>   <C-w>L

if has('mac')
  nnoremap <D-h>   <C-w>h
  nnoremap <D-j>   <C-w>j
  nnoremap <D-k>   <C-w>k
  nnoremap <D-l>   <C-w>l
  nnoremap <D-H>   <C-w>H
  nnoremap <D-J>   <C-w>J
  nnoremap <D-K>   <C-w>K
  nnoremap <D-L>   <C-w>L
endif

" Search the word nearest to the cursor in new window.
nnoremap <C-w>*  <C-w>s*
nnoremap <C-w>#  <C-w>s#

" command mode
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
cnoremap <C-a> <Home>
cnoremap <expr> <C-d> (getcmdpos()==strlen(getcmdline())+1 ? "\<C-d>" : "\<Del>")
cnoremap <C-e> <END>
cnoremap <C-h> <BS>
cnoremap <C-u> <C-e><C-u>

" open the command-line window from command-line mode
cnoremap <C-v> <C-f>a

" insert the line under the cursor
cnoremap <expr> <C-r><C-l>   matchstr(getline("."), '[^ \t:][^\r\n]*')

" easy to type in ASCII keyboard
cnoremap <C-r>' <C-r>"

" auto escape in command-line mode
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

" expand directory of active file
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" insert substitute command
nnoremap gs  :<C-u>%s///g<Left><Left><Left>
vnoremap gs  :s///g<Left><Left><Left>
nnoremap gS  :<C-u>%s///gc<Left><Left><Left>
vnoremap gS  :s///gc<Left><Left><Left>

" for vimdiff
nnoremap dp dp:<C-u>diffupdate<CR>]czz
nnoremap do do:<C-u>diffupdate<CR>]czz
vnoremap <Leader>dp :diffput<CR>:<C-u>diffupdate<CR>zz
vnoremap <Leader>do :diffget<CR>:<C-u>diffupdate<CR>zz
nnoremap du :<C-u>diffupdate<CR>
augroup diffsetting
  autocmd!
  autocmd InsertLeave * if &diff | diffupdate | echo 'diffupdated' | endif
augroup END

" insert mode
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <M-b> <S-Left>
inoremap <M-f> <S-Right>
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-h> <BS>
inoremap <C-d> <Del>
"inoremap <C-k> <C-o>C
"inoremap <C-y> <C-o>p
" undoable C-w,C-u
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

inoremap <S-Enter> <C-o>O

" stop the highlighting
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap <silent> <C-c><C-c> :<C-u>nohlsearch<CR>
nnoremap <silent> <C-[><C-[> :<C-u>nohlsearch<CR>
nnoremap <silent> <C-@><C-@> :<C-u>nohlsearch<CR>

" n is always search forwward and N is always search backward
nnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
nnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'
vnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
vnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'
onoremap <expr> n <SID>search_forward_p() ? 'n' : 'N'
onoremap <expr> N <SID>search_forward_p() ? 'N' : 'n'

function! s:search_forward_p()
  return exists('v:searchforward') ? v:searchforward : 1
endfunction

" type H to move top of screen and type L to move bottom of screen if scrolloff set
if &scrolloff > 0
  nnoremap <expr> H 'H' . &scrolloff . 'kzvzz'
  nnoremap <expr> L 'L' . &scrolloff . 'jzvzz'
endif

" change virtualedit
nnoremap <Space>va  :<C-u>setlocal virtualedit=all<CR>:setlocal virtualedit?<CR>
nnoremap <Space>vb  :<C-u>setlocal virtualedit=block<CR>:setlocal virtualedit?<CR>
nnoremap <Space>vv  :<C-u>let &virtualedit=(&ve == "block" ? "all" : "block")<CR>:setlocal virtualedit?<CR>

" swap gf and gF
noremap gf gF
noremap gF gf

" tab mode
nnoremap [tabmode]   <Nop>
nmap     t           [tabmode]

nnoremap [tabmode]t  :<C-u>tabnew<CR>
nnoremap [tabmode]d  :<C-u>tabclose<CR>

nnoremap <silent> <C-p> gT
nnoremap <silent> <C-n> gt

" tag jump
nnoremap [tagjump]    <Nop>
nmap     <Space>t     [tagjump]

nnoremap [tagjump]t   <C-]>
nnoremap [tagjump]j   :<C-u>tag<CR>
nnoremap [tagjump]k   :<C-u>pop<CR>
nnoremap [tagjump]l   :<C-u>tags<CR>

"--------------------
" Function: Open tag under cursor in new tab
" Source:   http://stackoverflow.com/questions/563616/vimctags-tips-and-tricks
"--------------------
nnoremap [tagjump]n   :<C-u>tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" filetype
nnoremap [filetype]    <Nop>
nmap     <Leader>t     [filetype]

nnoremap [filetype]p   :<C-u>set filetype=perl<CR>
nnoremap [filetype]v   :<C-u>set filetype=vim<CR>
nnoremap [filetype]c   :<C-u>set filetype=c<CR>
nnoremap [filetype]o   :<C-u>set filetype=objc<CR>
nnoremap [filetype]j   :<C-u>set filetype=java<CR>
nnoremap [filetype]s   :<C-u>set filetype=shell<CR>
nnoremap [filetype]r   :<C-u>set filetype=ruby<CR>
nnoremap [filetype]a   :<C-u>set filetype=javascript<CR>
nnoremap [filetype]h   :<C-u>set filetype=html<CR>
nnoremap [filetype]x   :<C-u>set filetype=xml<CR>
nnoremap [filetype]d   :<C-u>set filetype=diff<CR>
nnoremap [filetype]l   :<C-u>set filetype=scala<CR>
nnoremap [filetype]g   :<C-u>set filetype=go<CR>

command! -nargs=1 -complete=filetype FileType execute "set filetype=".<q-args>

" change expandtab booster
nnoremap t2 :<C-U>setlocal expandtab shiftwidth=2 tabstop=2<CR>
nnoremap t4 :<C-U>setlocal noexpandtab shiftwidth=4 tabstop=4<CR>
nnoremap <Space>t2 :<C-U>setlocal expandtab shiftwidth=2 tabstop=2 nolist<CR>
nnoremap <Space>t4 :<C-U>setlocal noexpandtab shiftwidth=4 tabstop=4 nolist<CR>

" Switch off diff mode
function! s:DiffOff()
  diffoff!
  set nowrap
endfunction

command! DiffOff call s:DiffOff()

" Open with Google Chrome
function! s:GoogleChrome(...)
  if has('mac')
    let l:cmd = "silent !open -a Google\\ Chrome "
  elseif has('win32')
    let l:cmd = "silent !start google\\ chrome "
  else
    return
  endif
  if a:0 == 0
    execute l:cmd . "%"
  else
    execute l:cmd . a:1
  endif
endfunction

command! -nargs=? GoogleChrome call s:GoogleChrome(<f-args>)

" replace search word to unnamed register
nnoremap <silent> <Space>rs :<C-u>execute '%substitute//' . escape(getreg(), '/\') . '/g'<CR>

" If unite-quickfix is bundled use unite-quickfix, otherwise use built-in quickfix window
function s:OpenQuickFix()
  if s:bundled('unite.vim') && s:bundled('unite-quickfix')
    Unite -no-quit -direction=botright quickfix
  else
    copen
  endif
endfunction

" grep
function! s:Grep(pattern, target)
  execute 'grep ' . a:pattern . ' ' . a:target
  call s:OpenQuickFix()
endfunction

command! -nargs=+ Grep call s:Grep(<f-args>)

command! -nargs=0 EchoSynName echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

" execute command (inner %s replace last selected text)
function! ExecuteWithSelectedText(command)
  if a:command !~? '%s'
    return
  endif

  let reg = '"'
  let [save_reg, save_type] = [getreg(reg), getregtype(reg)]
  normal! gvy
  let selectedText = @"
  call setreg(reg, save_reg, save_type)
  if selectedText == ''
    return
  endif

  execute printf(a:command, selectedText)
endfunction
" }}}

command -nargs=? -range=% ExtractMatches <line1>,<line2>call s:extract_matches(<f-args>)

function! s:extract_matches(...) range
  let s:pattern = get(a:000, 0, @/)

  let s:result = filter(getline(a:firstline, a:lastline), 'v:val =~# s:pattern')

  new
  setlocal buftype=nofile
  call setline(1, s:result)
endfunction

" for quickfix windows
augroup MyQuickFix
  autocmd!
  autocmd FileType qf  nnoremap <buffer> p  <CR>zz<C-w>p
  autocmd FileType qf  nnoremap <silent> <buffer> dd  :call <SID>del_quickfix_entry()<CR>
  autocmd FileType qf  vnoremap <silent> <buffer> d   :call <SID>del_quickfix_entry()<CR>
  autocmd FileType qf  nnoremap <silent> <buffer> u   :<C-u>call <SID>undo_quickfix_entry()<CR>
  autocmd QuickFixCmdPost *  cwindow
augroup END

function! s:undo_quickfix_entry()
  let history = get(w:, 'qf_history', [])
  if !empty(history)
    call setqflist(remove(history, -1), 'r')
  endif
endfunction

function! s:del_quickfix_entry() range
  let qf = getqflist()
  let history = get(w:, 'qf_history', [])
  call add(history, copy(qf))
  let w:qf_history = history
  unlet! qf[a:firstline - 1 : a:lastline - 1]
  call setqflist(qf, 'r')
  execute a:firstline
endfunction

" }}}

"---------------------------------------------------------------------------
" Command {{{2
command! Utf8 e ++enc=utf-8
command! Euc e ++enc=euc-jp
command! Sjis e ++enc=cp932
command! Jis e ++enc=iso-2022-jp
command! WUtf8 w ++enc=utf-8 | e
command! WEuc w ++enc=euc-jp | e
command! WSjis w ++enc=cp932 | e
command! WJis w ++enc=iso-2022-jp | e
" }}}

"---------------------------------------------------------------------------
" filetype {{{2

augroup commonfiletype
  autocmd!
  autocmd FileType * setlocal fo-=t fo-=c fo-=r fo-=o fo-=v fo+=l
  autocmd FileType * setlocal textwidth=0
  autocmd SourceCmd .vimrc setlocal fo-=t fo-=c fo-=r fo-=o fo-=v fo+=l
augroup END
augroup vimlang
  autocmd!
  autocmd FileType vim setlocal expandtab tabstop=2 shiftwidth=2 list
  autocmd FileType vim let g:vim_indent_cont = 2
augroup END
augroup makefile
  autocmd!
  autocmd FileType make setlocal noexpandtab list
augroup END
augroup clang
  autocmd!
  autocmd FileType c setlocal expandtab tabstop=2 shiftwidth=2 list
augroup END
augroup rubylang
  autocmd!
  autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 list
augroup END
augroup perllang
  autocmd!
  autocmd BufRead,BufNewFile *.psgi setfiletype perl
  autocmd BufRead,BufNewFile *.t    setfiletype perl
  autocmd FileType perl setlocal expandtab tabstop=4 shiftwidth=4 list
  " jump to perl function
  autocmd FileType perl noremap <silent><buffer> ]]  m':<c-u>call search('^\s*sub\>', "W")<CR>
  autocmd FileType perl noremap <silent><buffer> [[  m':<c-u>call search('^\s*sub\>', "bW")<CR>
  autocmd FileType perl compiler perl
  "autocmd BufWritePost *.pl,*.pm silent make
augroup END
augroup htmlfile
  autocmd!
  autocmd FileType html,xhtml setlocal expandtab tabstop=2 shiftwidth=2 list
augroup END
augroup xmlfile
  autocmd!
  autocmd FileType xml setlocal expandtab tabstop=2 shiftwidth=2 list
augroup END
augroup jslang
  autocmd!
  autocmd FileType javascript setlocal expandtab tabstop=2 shiftwidth=2 list
augroup END
augroup iolang
  autocmd!
  autocmd BufRead,BufNewFile *.io setfiletype io
  autocmd FileType io setlocal expandtab tabstop=2 shiftwidth=2 list
augroup END
augroup scalalang
  autocmd!
  autocmd BufRead,BufNewFile *.scala setfiletype scala
  autocmd FileType scala setlocal expandtab tabstop=2 shiftwidth=2 list
augroup END
augroup zshlang
  autocmd!
  autocmd FileType zsh setlocal expandtab tabstop=2 shiftwidth=2 list
augroup END
augroup golang
  autocmd!
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 list
  autocmd FileType go :highlight goErr cterm=bold ctermfg=214
  autocmd FileType go :match goErr /\<err\>/
  autocmd FileType go nmap <buffer> <Space>i   <Plug>(go-info)
  " autocmd FileType go nmap <buffer> <C-h><C-h> <Plug>(go-doc)
  autocmd FileType go nmap <buffer> <leader>fb <Plug>(go-build)
  autocmd FileType go nmap <buffer> <leader>ft <Plug>(go-test)
  autocmd FileType go nmap <buffer> gd         <Plug>(go-def)
  autocmd FileType go nmap <buffer> <Leader>fl :GoLint<CR>
  autocmd FileType go nnoremap <silent> <buffer> [[ :<C-U>call <SID>searchsyn('\<\%(func\<Bar>type\)\>','goDeclaration','b','n')<CR>
  autocmd FileType go xnoremap <silent> <buffer> [[ :<C-U>call <SID>searchsyn('\<\%(func\<Bar>type\)\>','goDeclaration','b','v')<CR>
  autocmd FileType go nnoremap <silent> <buffer> ]] :<C-U>call <SID>searchsyn('\<\%(func\<Bar>type\)\>','goDeclaration','','n')<CR>
  autocmd FileType go xnoremap <silent> <buffer> ]] :<C-U>call <SID>searchsyn('\<\%(func\<Bar>type\)\>','goDeclaration','','v')<CR>
augroup END

function! s:searchsyn(pattern,syn,flags,mode)
  norm! m'
  if a:mode ==# 'v'
    norm! gv
  endif
  let i = 0
  let cnt = v:count ? v:count : 1
  while i < cnt
    let i = i + 1
    let line = line('.')
    let col  = col('.')
    let pos = search(a:pattern,'W'.a:flags)
    while pos != 0 && s:synname() !~# a:syn
      let pos = search(a:pattern,'W'.a:flags)
    endwhile
    if pos == 0
      call cursor(line,col)
      return
    endif
  endwhile
endfunction

function! s:synname()
  return synIDattr(synID(line('.'),col('.'),0),'name')
endfunction

" }}}

" }}}

"---------------------------------------------------------------------------
" plugins {{{1

"---------------------------------------------------------------------------
" for LeafCage/yankround.vim {{{2
if s:bundled('sideways.vim')
  nnoremap <silent> <C-h>          :<C-u>SidewaysJumpLeft<CR>
  nnoremap <silent> <C-l>          :<C-u>SidewaysJumpRight<CR>
  nnoremap <silent> <Leader><C-h>  :<C-u>SidewaysLeft<CR>
  nnoremap <silent> <Leader><C-l>  :<C-u>SidewaysRight<CR>
endif
" }}}

"---------------------------------------------------------------------------
" for LeafCage/yankround.vim {{{2
if s:bundled('yankround.vim')
  call submode#enter_with('yankround', 'n', 'r', '<Leader>p', '<Plug>(yankround-p)')
  call submode#enter_with('yankround', 'n', 'r', '<Leader>P', '<Plug>(yankround-P)')
  call submode#map('yankround', 'n', 'r', 'p', '<Plug>(yankround-prev)')
  call submode#map('yankround', 'n', 'r', 'n', '<Plug>(yankround-next)')
endif
" }}}

"---------------------------------------------------------------------------
" for Shougo/neocomplete {{{2
if s:bundled('neocomplete')
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  let g:neocomplete#auto_completion_start_length = 3
  let g:neocomplete#manual_completion_start_length = 3

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " for neco-look
  let g:neocomplete#text_mode_filetypes = {
    \ 'markdown' : 1,
    \ 'mkd' : 1,
    \ }

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
  "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.c = '\%(\.\|->\)\h\w*'
  let g:neocomplete#sources#omni#input_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.cs = '.*'
  let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'
  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  "let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

  " For smart TAB completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ neocomplete#start_manual_complete()
  function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"}}}
endif
" }}}

"---------------------------------------------------------------------------
" for Shougo/neosnippet {{{2
if s:bundled('neosnippet')
  call s:LetAndMkdir('g:neosnippet#snippets_directory', $DOTVIM.'/snippets')

  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
  xmap <C-l>     <Plug>(neosnippet_start_unite_snippet_target)

  smap <C-e>     <Plug>(neosnippet_jump)

  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
  set completeopt-=preview

  augroup snippetlang
    autocmd!
    autocmd FileType neosnippet setlocal noexpandtab tabstop=4 shiftwidth=4 list
    autocmd FileType neosnippet setlocal foldmethod=expr
    autocmd FileType neosnippet setlocal foldexpr=getline(v:lnum)=~'^snippet'?'>1':getline(v:lnum)=~'^#'?0:getline(v:lnum+1)=~'^snippet'?'<1':'='
    autocmd FileType neosnippet setlocal foldtext=FoldTextOfSnippet()
  augroup END

  " function for neosnippet fold
  function! FoldTextOfSnippet()
    let snippet = matchstr(getline(v:foldstart), '^snippet\s\+\zs\S.*')
    let abbrstr = ''

    " search abbr
    for i in range(1, 4)
      if getline(v:foldstart+i) !~ '^\w'
        break
      endif
      if getline(v:foldstart+i) =~ '^abbr'
        let abbrstr = matchstr(getline(v:foldstart+i), '^abbr\s\+\zs\S.*')
        break
      endif
    endfor

    return printf('%- 30s', snippet) . abbrstr
  endfunction

endif
" }}}

"---------------------------------------------------------------------------
" for Shougo/unite.vim {{{2
if s:bundled('unite.vim')
  nnoremap [unite]    <Nop>
  nmap     <Space>u [unite]

  nnoremap <silent> [unite]c   :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
  nnoremap <silent> [unite]b   :<C-u>Unite buffer<CR>
  nnoremap <silent> [unite]o   :<C-u>Unite outline<CR>
  nnoremap <silent> [unite]u   :<C-u>Unite file_mru<CR>
  nnoremap <silent> [unite]d   :<C-u>Unite directory_mru<CR>
  nnoremap <silent> [unite]k   :<C-u>Unite bookmark<CR>
  nnoremap <silent> [unite]s   :<C-u>Unite source<CR>
  nnoremap <silent> [unite]f   :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
  nnoremap <silent> [unite]g   :<C-u>call <SID>unite_grep_with_filetype()<CR>
  nnoremap <silent> [unite]h   :<C-u>Unite help<CR>
  nnoremap <silent> [unite];   :<C-u>Unite history/command<CR>
  nnoremap <silent> [unite]/   :<C-u>Unite history/search<CR>
  nnoremap <silent> [unite]y   :<C-u>Unite history/yank<CR>
  nnoremap <silent> [unite]a   :<C-u>UniteBookmarkAdd<CR>
  nnoremap <silent> [unite]n   :<C-u>Unite neobundle/install:!<CR>
  nnoremap <silent> [unite]e   :<C-u>Unite snippet<CR>
  nnoremap <silent> [unite]q   :<C-u>Unite quickfix<CR>
  nnoremap <silent> [unite]p   :<C-u>Unite ref/perldoc<CR>
  nnoremap <silent> [unite]m   :<C-u>Unite mapping<CR>
  nnoremap <silent> [unite]l   :<C-u>Unite colorscheme -auto-preview<CR>
  nnoremap <silent> [unite]r   :<C-u>UniteResume<CR>

  let s:target_ft = {
    \ 'c': '**/*.[ch]',
    \ 'pl': '**/*.pl',
    \ 'rb': '**/*.rb',
    \ }
  function! s:unite_grep_with_filetype() "{{{
    try
      if get(s:target_ft, &ft, '') != ''
        let pattern = s:input('Pattern: ')
        let pattern = pattern=='' ? expand('<cword>') : pattern
        execute 'Unite grep:' . s:target_ft[&ft] . ' -input=' . pattern
      else
        execute 'Unite grep'
      endif
    catch /Canceled/
    endtry
  endfunction "}}}

  function! s:input(...) abort
    new
    cmap <buffer> <esc> __CANCELED__<cr>
    let ret = call('input', a:000)
    bw!
    redraw
    if ret =~ '__CANCELED__$'
      throw "Canceled"
    endif
    echom ret
    return ret
  endfunction

  autocmd FileType unite call s:unite_my_settings()
  function! s:unite_my_settings() "{{{
    nmap <buffer> <ESC>  <Plug>(unite_exit)
    nmap <buffer> <C-c>  <Plug>(unite_exit)
    imap <buffer> jk     <Plug>(unite_insert_leave)

    nmap <buffer> <Space>           <Nop>
    nmap <buffer> <Leader><Leader>  <Plug>(unite_toggle_mark_current_candidate)
    imap <buffer> <Leader><Leader>  <Plug>(unite_toggle_mark_current_candidate)
    vmap <buffer> <Leader><Leader>  <Plug>(unite_toggle_mark_selected_candidates)

    " <C-l>: manual neocomplete completion.
    inoremap <buffer> <C-l>  <C-x><C-u><C-p><Down>

    " action key mapping
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')

    call unite#custom_default_action('directory', 'tabvimfiler')
    call unite#custom_default_action('directory_mru', 'tabvimfiler')

  endfunction "}}}

  let g:neomru#file_mru_limit = 200
  let g:unite_cursor_line_highlight = 'TabLineSel'
  let g:unite_abbr_highlight = 'TabLine'
  let g:unite_winheight = 15
  let g:neomru#time_format = "%m/%d %H:%M "

  " For optimize.
  let g:neomru#filename_format = ''

  " For history/yank
  let g:unite_source_history_yank_enable = 1
  let g:unite_source_history_yank_limit = 100
  let g:unite_source_history_yank_file = $DOTVIM.'/history_yank'

  if has('win32')
    if executable(g:my_win32_grep_path)
      let g:unite_source_grep_command = g:my_win32_grep_path
      let g:unite_source_grep_recursive_opt = '-R'
      let g:unite_source_grep_default_opts = '-n --enc utf-8,cp932,euc-jp'
    endif
  elseif has('unix')
    if executable('ag')
      let g:unite_source_grep_command = 'ag'
      let g:unite_source_grep_recursive_opt = ''
      let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden --ignore-dir=.git'
    endif
  endif
  let g:unite_source_grep_max_candidates = 200

endif
" }}}

"---------------------------------------------------------------------------
" for Shougo/vimfiler {{{2
if s:bundled('vimfiler')
  nnoremap [vimfiler]  <Nop>
  nmap     <Space>f  [vimfiler]

  nnoremap <silent> [vimfiler]f   :<C-u>VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
  nnoremap <silent> [vimfiler]d   :<C-u>VimFilerTab -double -no-quit<CR>
  nnoremap <silent> [vimfiler]b   :<C-u>VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit -auto-cd $VIMBUNDLE<CR>

  let g:vimfiler_as_default_explorer = 1
  let g:vimfiler_enable_auto_cd = 1

  " Use trashbox.
  " Windows only and require latest vimproc.
  if has('win32')
    let g:unite_kind_file_use_trashbox = 1
  endif

  call s:LetAndMkdir('g:vimfiler_data_directory', $DOTVIM.'/.vimfiler')

  if has('mac')
    " Like Textmate icons.
    let g:vimfiler_tree_leaf_icon = ' '
    let g:vimfiler_tree_opened_icon = '-'
    let g:vimfiler_tree_closed_icon = '+'
    let g:vimfiler_file_icon = '-'
    let g:vimfiler_marked_file_icon = '*'
  else
    let g:vimfiler_tree_leaf_icon = ' '
    let g:vimfiler_tree_opened_icon = '-'
    let g:vimfiler_tree_closed_icon = '+'
    let g:vimfiler_file_icon = '-'
    let g:vimfiler_marked_file_icon = '*'
  endif

  autocmd FileType vimfiler call s:vimfiler_my_settings()
  function! s:vimfiler_my_settings() "{{{
    if has('gui')
      nnoremap <silent><buffer><expr> E  vimfiler#do_action('tabdrop')
    else
      nnoremap <silent><buffer><expr> E  vimfiler#do_action('tabopen')
    endif
    nnoremap <silent><buffer><expr> s  vimfiler#do_action('right')
    nnoremap <silent><buffer><expr> f  vimfiler#do_action('diff')

    nmap <buffer> <Space>           <Nop>
    nmap <buffer> <Leader><Leader>  <Plug>(vimfiler_toggle_mark_current_line)
    vmap <buffer> <Leader><Leader>  <Plug>(vimfiler_toggle_mark_selected_lines)

  endfunction "}}}

endif
" }}}

"---------------------------------------------------------------------------
" for airblade/vim-rooter {{{2
if s:bundled('vim-rooter')
  let g:rooter_use_lcd = 1
  let g:rooter_manual_only = 1
  let g:rooter_disable_map = 1

  augroup movecurrentdir
    autocmd!
    autocmd BufRead,BufEnter * call MoveRootDirOrCurrentFileDir()
  augroup END

  " Move project top directory with vim-rooter.
  " If can't, move current file's directory.
  function! MoveRootDirOrCurrentFileDir()
    let currentfile = expand("%:p")

    " Don't move if current file is an unnamed buffer
    if currentfile == ''
      return
    endif

    Rooter

    let cwd = getcwd()

    " Move current file's directory if could't move project top directory
    if (stridx(currentfile, cwd) != 0 ||
      \finddir('.git', cwd) == '') &&
      \isdirectory(expand('%:p:h'))
      lcd %:p:h
    endif
  endfunction
endif
" }}}

"---------------------------------------------------------------------------
" for basyura/J6uil.vim {{{2
"if s:bundled('J6uil.vim')
  augroup my_j6uil
    autocmd!
    autocmd CursorHold * call s:MyJ6uil_update()
  augroup END

  function! s:MyJ6uil_update()
    if &filetype == 'J6uil'
      let s:j6uil_user_color_list = [
        \ 'Red',
        \ 'Green',
        \ 'Blue',
        \ 'Cyan',
        \ 'Magenta',
        \ 'Yellow',
        \ 'Gray',
        \ 'Black',
        \ ]

      let w:j6uil_users = []
      call s:MyJ6uil_update_users()
      call s:MyJ6uil_colorise_user()
    endif
  endfunction

  function! s:MyJ6uil_colorise_user()
    let w:j6uil_last_highlight = 0
    let i = w:j6uil_last_highlight
    let color_len = len(s:j6uil_user_color_list)

    while i < len(w:j6uil_users)
      execute 'highlight MyJ6uilUser' . i . ' ' . 'guifg=' .
        \ s:j6uil_user_color_list[i % color_len]
        \ ' ctermfg=' .
        \ s:j6uil_user_color_list[i % color_len]
      call matchadd('MyJ6UilUser' . i, '\<'.w:j6uil_users[i].'\>')
      let i += 1
    endwhile
    let w:j6uil_last_highlight = i
  endfunction

  function! s:MyJ6uil_update_users()
    let w:j6uil_last_line = 0
    let i = w:j6uil_last_line

    while (i < line('$'))
      let line = getline(i)

      let user = matchstr(line, '^\(-- \)\@!\S\+')
      if user != '' &&
        \index(w:j6uil_users, user) == -1
        call add(w:j6uil_users, user)
      endif
      let i += 1
    endwhile

    let w:j6uil_last_line = line('$')
  endfunction

"endif
" }}}

"---------------------------------------------------------------------------
" for ctrlpvim/ctrlp.vim {{{2
if s:bundled('ctrlp.vim')
  nmap <Leader>z <plug>(ctrlp)
endif
" }}}

"---------------------------------------------------------------------------
" for fatih/vim-go {{{2
let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
" }}}

"---------------------------------------------------------------------------
" for gregsexton/gitv {{{2
if s:bundled('gitv')
  let g:Gitv_OpenHorizontal = 1
  let g:Gitv_DoNotMapCtrlKey = 1
  let g:Gitv_TruncateCommitSubjects = 1

  set lazyredraw

  nnoremap [Git]v :Gitv --all<CR>
  vnoremap [Git]v :Gitv --all<CR>
  nnoremap [Git]V :Gitv! --all<CR>
  autocmd FileType gitv call s:my_gitv_settings()
  function! s:my_gitv_settings()
    setlocal iskeyword+=/,-,.
    nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>
  endfunction

endif
" }}}

"---------------------------------------------------------------------------
" for haya14busa/vim-asterisk {{{2
if s:bundled('vim-asterisk')
  map *  <Plug>(asterisk-z*)
  map #  <Plug>(asterisk-z#)
  map g* <Plug>(asterisk-gz*)
  map g# <Plug>(asterisk-gz#)
  map <Space>/  <Plug>(asterisk-z*)
  map <Space>?  <Plug>(asterisk-z#)
  map g<Space>/ <Plug>(asterisk-gz*)
  map g<Space>? <Plug>(asterisk-gz#)
endif
" }}}

"---------------------------------------------------------------------------
" for haya14busa/incsearch.vim {{{2
if s:bundled('incsearch.vim')
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
endif
" }}}

"---------------------------------------------------------------------------
" for jpalardy/vim-slime {{{2
let g:slime_target = 'tmux'
let g:slime_paste_file = tempname()
" }}}

"---------------------------------------------------------------------------
" for junegunn/vim-easy-align {{{2
if s:bundled('vim-easy-align')
  let g:easy_align_delimiters = {
    \ ':' : {
    \   'pattern' : ':',
    \   'left_margin' : 1,
    \   'right_margin' : 1,
    \   'stick_to_left' : 0,
    \ },
    \ }

  nmap <Leader>aa <Plug>(EasyAlign)
  xmap <Leader>aa <Plug>(EasyAlign)

  nnoremap <Leader>as :<C-u>EasyAlign \<CR>
  xnoremap <Leader>as :     EasyAlign \<CR>
  nnoremap <Leader>as :<C-u>EasyAlign \<CR>
  xnoremap <Leader>as :     EasyAlign \<CR>
  nnoremap <Leader>a= :<C-u>EasyAlign =<CR>
  xnoremap <Leader>a= :     EasyAlign =<CR>
  nnoremap <Leader>ae :<C-u>EasyAlign =<CR>
  xnoremap <Leader>ae :     EasyAlign =<CR>
  nnoremap <Leader>a> :<C-u>EasyAlign =><CR>
  xnoremap <Leader>a> :     EasyAlign =><CR>
  nnoremap <Leader>ah :<C-u>EasyAlign =><CR>
  xnoremap <Leader>ah :     EasyAlign =><CR>
  nnoremap <Leader>a, :<C-u>EasyAlign ,<CR>
  xnoremap <Leader>a, :     EasyAlign ,<CR>
  nnoremap <Leader>a: :<C-u>EasyAlign :<CR>
  xnoremap <Leader>a: :     EasyAlign :<CR>
  nnoremap <Leader>ac :<C-u>EasyAlign :<CR>
  xnoremap <Leader>ac :     EasyAlign :<CR>
endif
" }}}

"---------------------------------------------------------------------------
" for justinmk/vim-sneak {{{2
if s:bundled('vim-sneak')
  nmap <Leader>s <Plug>Sneak_s
  nmap <Leader>S <Plug>Sneak_S
endif
" }}}

"---------------------------------------------------------------------------
" for kana/vim-altr {{{2
if s:bundled('vim-altr')
  call altr#remove_all()
  call altr#define('plugin/%/*.vim',
    \              'autoload/%/*.vim')
  call altr#define('plugin/%.vim',
    \              'autoload/%.vim')

  call altr#define('%.rb',
    \              'spec/%_spec.rb')
  call altr#define('app/models/%.rb',
    \              'spec/models/%_spec.rb',
    \              'spec/factories/%.rb')
  call altr#define('app/controllers/%.rb',
    \              'spec/controllers/%_spec.rb')
  call altr#define('app/helpers/%.rb',
    \              'spec/helpers/%_spec.rb')
  call altr#define('spec/routing/%_spec.rb',
    \              'config/routes.rb')
  call altr#define('%.c',
    \              '%.h')

  nmap <Leader>m   <Plug>(altr-forward)
endif
" }}}

"---------------------------------------------------------------------------
" for kana/vim-submode {{{2
if s:bundled('vim-submode')
  let g:submode_keyseqs_to_leave = ['<Esc>']
  let g:submode_timeoutlen = 1000000
  let g:submode_keep_leaving_key = 1

  call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
  call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
  call submode#map('undo/redo', 'n', '', '-', 'g-')
  call submode#map('undo/redo', 'n', '', '+', 'g+')

  call submode#enter_with('window-size', 'n', '', '<C-w>+', '<C-w>+')
  call submode#enter_with('window-size', 'n', '', '<C-w>-', '<C-w>-')
  call submode#enter_with('window-size', 'n', '', '<C-w><', '<C-w><')
  call submode#enter_with('window-size', 'n', '', '<C-w>=', '<C-w>=')
  call submode#enter_with('window-size', 'n', '', '<C-w>>', '<C-w>>')
  call submode#map('window-size', 'n', '', '+', '<C-w>+')
  call submode#map('window-size', 'n', '', '-', '<C-w>-')
  call submode#map('window-size', 'n', '', '<', '<C-w><')
  call submode#map('window-size', 'n', '', '=', '<C-w>=')
  call submode#map('window-size', 'n', '', '>', '<C-w>>')

  call submode#enter_with('buffer-mode', 'n', '', '<Space>bh', ':<C-u>bprevious<CR>')
  call submode#enter_with('buffer-mode', 'n', '', '<Space>bl', ':<C-u>bnext<CR>')
  call submode#map('buffer-mode', 'n', '', 'h', ':<C-u>bprevious<CR>')
  call submode#map('buffer-mode', 'n', '', 'l', ':<C-u>bnext<CR>')
  call submode#map('buffer-mode', 'n', '', 'd', ':<C-u>bwipeout<CR>')
  call submode#map('buffer-mode', 'n', '', 'D', ':<C-u>bwipeout!<CR>')

  call submode#enter_with('tab-mode', 'n', '', 'tl', 'gt')
  call submode#enter_with('tab-mode', 'n', '', 'th', 'gT')
  call submode#enter_with('tab-mode', 'n', '', 't<Space>h', ':<C-u>tabfirst<CR>')
  call submode#enter_with('tab-mode', 'n', '', 't<Space>l', ':<C-u>tablast<CR>')
  call submode#enter_with('tab-mode', 'n', '', 'tL', ':<C-u>tabmove +1<CR>')
  call submode#enter_with('tab-mode', 'n', '', 'tH', ':<C-u>tabmove -1<CR>')
  call submode#map('tab-mode', 'n', '', 'l', 'gt')
  call submode#map('tab-mode', 'n', '', 'h', 'gT')
  call submode#map('tab-mode', 'n', '', '<Space>h', ':<C-u>tabfirst<CR>')
  call submode#map('tab-mode', 'n', '', '<Space>l', ':<C-u>tablast<CR>')
  call submode#map('tab-mode', 'n', '', 'L', ':<C-u>tabmove +1<CR>')
  call submode#map('tab-mode', 'n', '', 'H', ':<C-u>tabmove -1<CR>')
  call submode#map('tab-mode', 'n', '', 't', ':<C-u>tabnew<CR>')
  call submode#map('tab-mode', 'n', '', 'd', ':<C-u>tabclose<CR>')

  call submode#enter_with('ex-move', 'nv', '', '<Space><Space>', '<Nop>')
  call submode#leave_with('ex-move', 'nv', '', '<Space>')
  call submode#map('ex-move', 'nv', '', 'j', '<C-f>zz')
  call submode#map('ex-move', 'nv', '', 'k', '<C-b>zz')
  call submode#map('ex-move', 'nv', '', 'n', '5jzz')
  call submode#map('ex-move', 'nv', '', 'm', '5kzz')
  call submode#map('ex-move', 'nv', '', 'l', '}zz')
  call submode#map('ex-move', 'nv', '', 'h', '{zz')

  call submode#enter_with('diff', 'n', '', '<Leader>d', '<Nop>')
  call submode#map('diff', 'n', '', 'j', ']czz')
  call submode#map('diff', 'n', '', 'k', '[czz')
  call submode#map('diff', 'n', '', 'o', 'do')
  call submode#map('diff', 'n', '', 'p', 'dp')
  call submode#map('diff', 'n', '', 'u', 'do]czz')
  call submode#map('diff', 'n', '', 'i', 'dp]czz')

  call submode#enter_with('quickfix', 'n', '', '<Leader>q', '<Nop>')
  call submode#map('quickfix', 'n', '', 'j', ':cnext<CR>')
  call submode#map('quickfix', 'n', '', 'k', ':cprevious<CR>')
  call submode#map('quickfix', 'n', '', 'g', ':cfirst<CR>')
  call submode#map('quickfix', 'n', '', 'G', ':clast<CR>')

endif
" }}}

"---------------------------------------------------------------------------
" for kana/vim-operator-replace {{{2
if s:bundled('vim-operator-user') && s:bundled('vim-operator-replace')
  map s <Plug>(operator-replace)
  map S <Plug>(operator-replace)$
  " operator-replace from clipboard
  map <Space>s "*<Plug>(operator-replace)
  map <Space>S "*<Plug>(operator-replace)$
endif
" }}}

"---------------------------------------------------------------------------
" for kana/vim-smartchr {{{2
if s:bundled('vim-smartchr')
  augroup haskelllang
    autocmd!
    autocmd FileType haskell inoremap <buffer> <expr> -  smartchr#loop('-', '->', '--')
  augroup END
endif
" }}}

"---------------------------------------------------------------------------
" for kana/vim-smarttill {{{2
if s:bundled('vim-smarttill')
  omap q  <Plug>(smarttill-t)
  omap Q  <Plug>(smarttill-T)
endif
" }}}

"---------------------------------------------------------------------------
" for kana/vim-smartword {{{2
if s:bundled('vim-smartword')
  nmap w  <Plug>(smartword-w)
  vmap w  <Plug>(smartword-w)
  map  b  <Plug>(smartword-b)
  map  e  <Plug>(smartword-e)

  if s:bundled('vim-submode')
    call submode#enter_with('ge-mode', 'nv', 'r', 'ge', '<Plug>(smartword-ge)')
    call submode#map('ge-mode', 'nv', 'r', 'e', '<Plug>(smartword-ge)')
  else
    nmap ge <Plug>(smartword-ge)
    vmap ge <Plug>(smartword-ge)
  endif
  omap ge <Plug>(smartword-ge)
endif
" }}}

"---------------------------------------------------------------------------
" for mattn/zencoding-vim {{{2
let g:user_emmet_leader_key = '<c-y>'
" }}}

"---------------------------------------------------------------------------
" for mhinz/vim-startify {{{2
if s:bundled('vim-startify')
  let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']
endif
" }}}

"---------------------------------------------------------------------------
" for mhinz/vim-signify {{{2
if s:bundled('vim-signify')
  let g:signify_disable_by_default = 1
  if s:bundled('vim-submode')
    call submode#enter_with('vim-signify', 'n', 'r', '<Leader>gj', '<Plug>(signify-next-hunk)zz')
    call submode#enter_with('vim-signify', 'n', 'r', '<Leader>gk', '<Plug>(signify-prev-hunk)zz')
    call submode#map('vim-signify', 'n', 'r', 'j', '<Plug>(signify-next-hunk)zz')
    call submode#map('vim-signify', 'n', 'r', 'k', '<Plug>(signify-prev-hunk)zz')
  else
    nmap <Leader>gj <Plug>(signify-next-hunk)zz
    nmap <Leader>gk <Plug>(signify-prev-hunk)zz
  endif
  nmap <Leader>gh <Plug>(signify-toggle-highlight)
  nmap <Leader>gt <Plug>(signify-toggle)
endif
" }}}

"---------------------------------------------------------------------------
" for ntpeters/vim-better-whitespace {{{2
if s:bundled('vim-better-whitespace')
  let g:better_whitespace_filetypes_blacklist = [
    \ 'diff',
    \ 'gitcommit',
    \ 'unite',
    \ 'vimfiler',
    \ 'qf',
    \ 'help',
    \ ]
endif
" }}}

"---------------------------------------------------------------------------
" for rhysd/conflict-marker.vim {{{2
if s:bundled('conflict-marker.vim')
  let g:conflict_marker_enable_mappings = 0
  if s:bundled('vim-submode')
    call submode#enter_with('conflict', 'n', 'r', '<Leader>l', '<Nop>')
    call submode#map('conflict', 'n', 'r', 'j', '<Plug>(conflict-marker-next-hunk)zz')
    call submode#map('conflict', 'n', 'r', 'k', '<Plug>(conflict-marker-prev-hunk)zz')
    call submode#map('conflict', 'n', 'r', 'l', '<Plug>(conflict-marker-themselves)<Plug>(conflict-marker-next-hunk)zz')
    call submode#map('conflict', 'n', 'r', 'h', '<Plug>(conflict-marker-ourselves)<Plug>(conflict-marker-next-hunk)zz')
    call submode#map('conflict', 'n', 'r', 't', '<Plug>(conflict-marker-themselves)')
    call submode#map('conflict', 'n', 'r', 'o', '<Plug>(conflict-marker-ourselves)')
    call submode#map('conflict', 'n', 'r', 'b', '<Plug>(conflict-marker-both)')
    call submode#map('conflict', 'n', 'r', 'n', '<Plug>(conflict-marker-none)')
  else
    nmap <Leader>lj  <Plug>(conflict-marker-next-hunk)zz
    nmap <Leader>lk  <Plug>(conflict-marker-prev-hunk)zz
    nmap <Leader>lt  <Plug>(conflict-marker-themselves)
    nmap <Leader>lo  <Plug>(conflict-marker-ourselves)
    nmap <Leader>lb  <Plug>(conflict-marker-both)
    nmap <Leader>ln  <Plug>(conflict-marker-none)
  endif
endif
" }}}

"---------------------------------------------------------------------------
" for rhysd/vim-operator-surround {{{2
if s:bundled('vim-operator-surround')
  map <silent><Leader>sa <Plug>(operator-surround-append)
  map <silent><Leader>sd <Plug>(operator-surround-delete)
  map <silent><Leader>sr <Plug>(operator-surround-replace)
endif
" }}}

"---------------------------------------------------------------------------
" for t9md/vim-surround_custom_mapping {{{2
let g:surround_custom_mapping = {}
let g:surround_custom_mapping._ = {
  \ 's': " \r ",
  \ }
let g:surround_custom_mapping.perl = {
  \ 'Q': "q(\r)",
  \ 'D': "qq(\r)",
  \ 'o': "qw(\r)",
  \ }
let g:surround_custom_mapping.ruby = {
  \ '-':  "<% \r %>",
  \ '=':  "<%= \r %>",
  \ '9':  "(\r)",
  \ '5':  "%(\r)",
  \ '%':  "%(\r)",
  \ 'w':  "%w(\r)",
  \ '#':  "#{\r}",
  \ '3':  "#{\r}",
  \ 'e':  "begin \r end",
  \ 'E':  "<<EOS \r EOS",
  \ 'i':  "if \1if\1 \r end",
  \ 'u':  "unless \1unless\1 \r end",
  \ 'c':  "class \1class\1 \r end",
  \ 'm':  "module \1module\1 \r end",
  \ 'd':  "def \1def\1\2args\r..*\r(&)\2 \r end",
  \ 'p':  "\1method\1 do \2args\r..*\r|&| \2\r end",
  \ 'P':  "\1method\1 {\2args\r..*\r|&|\2 \r }",
  \ }
let g:surround_custom_mapping.javascript = {
  \ 'f':  "function(){ \r }"
  \ }
let g:surround_custom_mapping.vim= {
  \'f':  "function! \r endfunction"
  \ }
let g:surround_custom_mapping.snippet= {
  \'p':  "${\1num\1:\r}"
  \ }
" }}}

"---------------------------------------------------------------------------
" for scrooloose/syntastic {{{2
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_mode_map = {
  \ 'mode'             : 'passive',
  \ 'active_filetypes' : ['go'],
  \ }
let g:syntastic_go_checkers = ['go', 'golint']
" }}}

"---------------------------------------------------------------------------
" for terryma/vim-expand-region {{{2
if s:bundled('vim-expand-region')
  let g:expand_region_text_objects = {
    \ 'iW'  : 0,
    \ 'i]'  : 1,
    \ 'ib'  : 1,
    \ 'iB'  : 1,
    \ 'il'  : 0,
    \ 'ii'  : 0,
    \ 'ai'  : 0,
    \ 'ip'  : 0,
    \ }
  if s:bundled('vim-submode')
    call submode#enter_with('expand-region', 'nv', 'r', '<Leader>e', '<Plug>(expand_region_expand)')
    call submode#map('expand-region', 'nv', 'r', 'e', '<Plug>(expand_region_expand)')
    call submode#map('expand-region', 'nv', 'r', 's', '<Plug>(expand_region_shrink)')
  endif
endif
" }}}

"---------------------------------------------------------------------------
" for thinca/vim-ambicmd {{{2
if s:bundled('vim-ambicmd')
  cnoremap <expr> <Space>   ambicmd#expand("\<Space>")
  cnoremap <expr> <S-Space> ambicmd#expand("\<Space>")
  cnoremap <expr> <CR>      (getcmdtype() =~ '[/?]' ? "\<CR>zv" : ambicmd#expand("\<CR>"))

  function! AmbicmdMyCustomRule(cmd)
    return [
    \   '\c^' . a:cmd . '$',
    \   '\c^' . a:cmd,
    \   '\C^' . substitute(toupper(a:cmd), '.', '\0\\l*', 'g') . '$',
    \   '\C' . substitute(toupper(a:cmd), '.', '\0\\l*', 'g'),
    \   '\c' . a:cmd,
    \   '.*' . substitute(a:cmd, '.', '\0.*', 'g'),
    \   '\C^' . substitute(a:cmd, '^.', '\u\0', 'g') . '$',
    \   '\C^' . substitute(a:cmd, '^.', '\u\0', 'g'),
    \ ]
  endfunction
  let g:ambicmd#build_rule = 'AmbicmdMyCustomRule'
endif
" }}}

"---------------------------------------------------------------------------
" for thinca/vim-poslist {{{2
if s:bundled('vim-poslist')
  let g:poslist_histsize = 500

  map <C-o> <Plug>(poslist-prev-line)
  map <C-i> <Plug>(poslist-next-line)
  map <Leader><C-o> <Plug>(poslist-prev-buf)
  map <Leader><C-i> <Plug>(poslist-next-buf)
endif
" }}}

"---------------------------------------------------------------------------
" for thinca/vim-quickrun {{{2
if s:bundled('vim-quickrun')
  let g:quickrun_config = {}
  let g:quickrun_config._ = {
    \ 'runner' : 'vimproc',
    \ 'outputter/buffer/split' : 'botright 10sp',
    \ 'runmode' : 'async:vimproc'
    \ }

  let g:quickrun_config.markdown = {
    \ 'type'      : 'markdown/pandoc',
    \ 'outputter' : 'browser',
    \ 'cmdopt'    : '-s'
    \ }

  nnoremap <silent> <Leader>r  :<C-u>QuickRun -mode n<CR>
  vnoremap <silent> <Leader>r  :<C-u>QuickRun -mode v<CR>
  nnoremap <Leader>R           :<C-u>QuickRun -args ""<Left>
endif
" }}}

"---------------------------------------------------------------------------
" for thinca/vim-ref {{{2
if s:bundled('vim-ref')
  let g:ref_source_webdict_sites = {
    \   'default': 'alc',
    \
    \   'alc': {
    \       'url': 'http://eow.alc.co.jp/%s',
    \       'keyword_encoding': 'utf-8',
    \       'cache': '1',
    \   },
    \   'wikipedia': {
    \       'url': 'http://ja.wikipedia.org/wiki/%s',
    \   },
    \ }
  function! g:ref_source_webdict_sites.alc.filter(output)
    return join(split(a:output, "\n")[38 :], "\n")
  endfunction
  function! g:ref_source_webdict_sites.wikipedia.filter(output)
    return join(split(a:output, "\n")[6 :], "\n")
  endfunction

  nnoremap <Leader>wa :<C-u>Ref webdict alc <C-r><C-w><CR>
  vnoremap <Leader>wa :<C-u>call ExecuteWithSelectedText('Ref webdict alc %s')<CR>
  nnoremap <Leader>wA :<C-u>Ref webdict alc<Space>
  nnoremap <Leader>ww :<C-u>Ref webdict wikipedia <C-r><C-w><CR>
  vnoremap <Leader>ww :<C-u>call ExecuteWithSelectedText('Ref webdict wikipedia %s')<CR>
  nnoremap <Leader>wW :<C-u>Ref webdict wikipedia<Space>
endif
" }}}

"---------------------------------------------------------------------------
" for tpope/vim-commentary {{{2
if s:bundled('vim-commentary')
  xmap <Leader>c   <Plug>Commentary
  nmap <Leader>c   <Plug>Commentary
  nmap <Leader>cc  <Plug>CommentaryLine
  nmap <Leader>cu  <Plug>CommentaryUndo
endif
" }}}

"---------------------------------------------------------------------------
" for tpope/vim-fugitive {{{2
if s:bundled('vim-fugitive')
  nnoremap [Git]     <Nop>
  nmap     <Space>g  [Git]

  nnoremap [Git]d :<C-u>Gdiff<CR>
  nnoremap [Git]s :<C-u>Gstatus<CR>
  nnoremap [Git]a :<C-u>Gwrite<CR>
  nnoremap [Git]A :<C-u>Gwrite <cfile><CR>
  nnoremap [Git]c :<C-u>Gcommit -v<CR>
  nnoremap [Git]C :<C-u>Gcommit --amend<CR>
  nnoremap [Git]b :<C-u>Gblame<CR>
  nnoremap [Git]p :<C-u>Git push<Space>
endif
" }}}

"---------------------------------------------------------------------------
" for tsukkee/lingr-vim {{{2
let g:lingr_vim_user = 'deris0126'
" }}}

"---------------------------------------------------------------------------
" for tyru/open-browser.vim {{{2
if s:bundled('open-browser.vim')
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)

  map gz <Plug>(operator-open-neobundlepath)

  call operator#user#define('open-neobundlepath', 'OpenNeoBundlePath')
  function! OpenNeoBundlePath(motion_wise)
    if line("'[") != line("']")
      return
    endif
    let start = col("'[") - 1
    let end = col("']")
    let sel = strpart(getline('.'), start, end - start)
    let sel = substitute(sel, '^\%(github\|gh\|git@github\.com\):\(.\+\)', 'https://github.com/\1', '')
    let sel = substitute(sel, '^\%(bitbucket\|bb\):\(.\+\)', 'https://bitbucket.org/\1', '')
    let sel = substitute(sel, '^gist:\(.\+\)', 'https://gist.github.com/\1', '')
    let sel = substitute(sel, '^git://', 'https://', '')
    if sel =~ '^https\?://'
      call openbrowser#open(sel)
    elseif sel =~ '/'
      call openbrowser#open('https://github.com/'.sel)
    else
      call openbrowser#open('https://github.com/vim-scripts/'.sel)
    endif
  endfunction
endif
" }}}

"---------------------------------------------------------------------------
" for tyru/operator-html-escape.vim {{{2
if s:bundled('operator-user') && s:bundled('operator-html-escape.vim')
  nmap <Leader>he  <Plug>(operator-html-escape)
  nmap <Leader>hu  <Plug>(operator-html-unescape)
endif
" }}}

"---------------------------------------------------------------------------
" for tyru/operator-star.vim {{{2
if s:bundled('operator-user') && s:bundled('operator-star.vim')
  nmap <Leader>*  <Plug>(operator-*)
  nmap <Leader>g* <Plug>(operator-g*)
  nmap <Leader>#  <Plug>(operator-#)
  nmap <Leader>g# <Plug>(operator-g#)
endif
" }}}

"---------------------------------------------------------------------------
" for xolox/vim-easytags {{{2
if has('win32')
  let g:easytags_cmd = ''
endif
" }}}

"---------------------------------------------------------------------------
" for will133/vim-dirdiff {{{2
if s:bundled('vim-dirdiff')
  let g:DirDiffEnableMappings = 0
endif
" }}}

"---------------------------------------------------------------------------
" for deris/columnjump {{{2
if s:bundled('columnjump')
  nmap <c-k> <Plug>(columnjump-backward)
  nmap <c-j> <Plug>(columnjump-forward)
endif
" }}}

"---------------------------------------------------------------------------
" for deris/vim-cmdline-switch {{{2
if s:bundled('vim-cmdline-switch')
  cmap <C-j>  <Plug>(cmdline-switch)
endif
" }}}

"---------------------------------------------------------------------------
" for deris/vim-fitcolumn {{{2
if s:bundled('vim-fitcolumn')
  let g:fitcolumn_no_default_key_mappings = 1
  inoremap <expr> <C-j><C-k>  fitcolumn#fitabovecolumn({
    \ 'insertchar': ' ',
    \ })
  inoremap <expr> <C-j><C-j>  fitcolumn#fitbelowcolumn({
    \ 'insertchar': ' ',
    \ })
  imap <C-j><C-h>  <Plug>(fitcolumn-abovecolumn)
  imap <C-j><C-l>  <Plug>(fitcolumn-belowcolumn)
endif
" }}}

"---------------------------------------------------------------------------
" for deris/vim-shot-f {{{2
if s:bundled('vim-shot-f')
  let g:shot_f_no_default_key_mappings = 1
  nmap <expr> f  col('.')+1 != col('$') ? "\<Plug>(shot-f-f)" : "\<Plug>(shot-f-F)"
  nmap <expr> F  col('.')   != 1        ? "\<Plug>(shot-f-F)" : "\<Plug>(shot-f-f)"
  xmap <expr> f  col('.')+1 != col('$') ? "\<Plug>(shot-f-f)" : "\<Plug>(shot-f-F)"
  xmap <expr> F  col('.')   != 1        ? "\<Plug>(shot-f-F)" : "\<Plug>(shot-f-f)"
  omap <expr> f  col('.')+1 != col('$') ? "\<Plug>(shot-f-f)" : "\<Plug>(shot-f-F)"
  omap <expr> F  col('.')   != 1        ? "\<Plug>(shot-f-F)" : "\<Plug>(shot-f-f)"
  omap <expr> t  col('.')+1 != col('$') ? "\<Plug>(shot-f-t)" : "\<Plug>(shot-f-T)"
  omap <expr> T  col('.')   != 1        ? "\<Plug>(shot-f-T)" : "\<Plug>(shot-f-t)"
endif
" }}}

"---------------------------------------------------------------------------
" for deris/vim-rengbang {{{2
if s:bundled('vim-rengbang')
  " map <Leader>sn <Plug>(operator-rengbang)
endif
" }}}

"---------------------------------------------------------------------------
" for errormarker.vim {{{2
let errormarker_disablemappings = 1
" }}}

"---------------------------------------------------------------------------
" for vim-textobj-function {{{2
if s:bundled('vim-textobj-user') && s:bundled('vim-textobj-function')
  let g:textobj_function_no_default_key_mappings = 1
  omap iF <Plug>(textobj-function-i)
  omap aF <Plug>(textobj-function-a)
  vmap iF <Plug>(textobj-function-i)
  vmap aF <Plug>(textobj-function-a)
endif
" }}}

" }}}

"---------------------------------------------------------------------------
" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
" }}}

