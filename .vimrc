"---------------------------------------------------------------------------
" deris0126's .vimrc
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" メモ {{{
":help option-list
":help :map-commands
":help autocommands-events
":help feature-list
":help usr_41
":help index
":help motion
":help visual
"
" 使用前提
" ・.vim or vimfile 直下にswap,backup,snippetsディレクトリを作成しておく
"
"}}}

"---------------------------------------------------------------------------
" basic settings {{{1

if has('unix')
  let $DOTVIM=expand('~/.vim')
else
  let $DOTVIM=expand('~/vimfiles')
endif

let $VIMBUNDLE=$DOTVIM.'/bundle'

" bundle/ 以下に配置されているか
function! s:bundled(bundle)
  if !isdirectory($VIMBUNDLE)
    return 0
  endif

  return !empty(globpath($VIMBUNDLE.'/'.a:bundle, '*'))
  "return stridx(&runtimepath, a:bundle) > -1
    "\ && !empty(globpath($VIMBUNDLE.'/'.a:bundle, '*'))
endfunction

"---------------------------------------------------------------------------
" Vundle {{{2
set nocompatible
filetype off

if has('vim_starting')
  set rtp+=$VIMBUNDLE/neobundle.vim/
endif

if s:bundled('neobundle.vim')
  call neobundle#rc($VIMBUNDLE)

  " original repos on github
  NeoBundle 'Shougo/neobundle.vim'
  "NeoBundle 'gmarik/vundle'
  "NeoBundle 'Lokaltog/vim-easymotion'
  NeoBundle 'Lokaltog/vim-powerline'
  NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'Shougo/neocomplcache-snippets-complete'
  NeoBundleLazy 'Shougo/unite.vim'
  NeoBundleLazy 'Shougo/vimfiler'
  NeoBundle 'Shougo/vimproc'
  "NeoBundle 'Shougo/vimshell'
  "NeoBundle 'Townk/vim-autoclose'
  NeoBundle 'airblade/vim-rooter'
  "NeoBundle 'benmills/vimux'
  NeoBundle 'bitc/vim-bad-whitespace'
  "NeoBundle 'bootleq/ShowMarks'
  "NeoBundle 'chrisbra/SudoEdit.vim'
  "NeoBundle 'c9s/perlomni.vim'
  "NeoBundle 'derekwyatt/vim-scala'
  NeoBundle 'emonkak/vim-operator-comment'
  NeoBundle 'emonkak/vim-operator-sort'
  "NeoBundle 'godlygeek/tabular'
  NeoBundleLazy 'h1mesuke/vim-alignta'
  "NeoBundle 'h1mesuke/vim-benchmark'
  "NeoBundle 'h1mesuke/textobj-wiw'
  NeoBundleLazy 'h1mesuke/unite-outline'
  "NeoBundle 'hekyou/vim-rectinsert'
  "NeoBundle 'houtsnip/vim-emacscommandline'
  "NeoBundle 'fholgado/minibufexpl.vim'
  "NeoBundle 'fuenor/vim-statusline' "手動で配置の必要あり
  "NeoBundle 'fuenor/qfixgrep'
  "NeoBundle 'fuenor/qfixhowm'
  "NeoBundle 'jceb/vim-orgmode'
  "NeoBundle 'jpalardy/vim-slime'
  "NeoBundle 'kana/vim-advice'
  "NeoBundle 'kana/vim-altr'
  "NeoBundle 'kana/vim-arpeggio'
  NeoBundle 'kana/vim-fakeclip'
  "NeoBundle 'kana/vim-gf-user'
  "NeoBundle 'kana/vim-grex'
  "NeoBundle 'kana/vim-metarw'
  "NeoBundle 'kana/vim-narrow'
  NeoBundle 'kana/vim-operator-user'
  NeoBundle 'kana/vim-operator-replace'
  NeoBundleLazy 'kana/vim-scratch'
  "NeoBundle 'kana/vim-smartinput'
  NeoBundle 'kana/vim-smartword'
  NeoBundle 'kana/vim-submode'
  NeoBundle 'kana/vim-textobj-user'
  NeoBundle 'kana/vim-textobj-entire'
  NeoBundle 'kana/vim-textobj-function'
  NeoBundle 'kana/vim-textobj-indent'
  NeoBundle 'kana/vim-textobj-jabraces'
  NeoBundle 'kana/vim-textobj-lastpat'
  NeoBundle 'kana/vim-textobj-line'
  NeoBundle 'kana/vim-textobj-syntax'
  NeoBundle 'kana/vim-vspec'
  NeoBundleLazy 'kien/ctrlp.vim'
  "NeoBundle 'vexxor/kwbd.vim'
  "NeoBundle 'majutsushi/tagbar'
  "NeoBundle 'mattn/asyncgrep-vim'
  "NeoBundle 'mattn/benchvimrc-vim'
  "NeoBundle 'mattn/excitetranslate-vim'
  "NeoBundle 'mattn/gist-vim'
  NeoBundle 'mattn/learn-vimscript'
  "NeoBundle 'mattn/sonictemplate-vim'
  "NeoBundle 'mattn/vdbi-vim'
  NeoBundle 'mattn/vim-textobj-url'
  NeoBundle 'mattn/webapi-vim'
  NeoBundleLazy 'mattn/zencoding-vim'
  "NeoBundle 'mileszs/ack.vim'
  NeoBundle 'motemen/git-vim'
  "NeoBundle 'motemen/hatena-vim'
  "NeoBundle 'msanders/cocoa.vim'
  "NeoBundle 'msanders/snipmate.vim'
  NeoBundle 'nathanaelkane/vim-indent-guides'
  NeoBundleLazy 'osyo-manga/unite-quickfix'
  "NeoBundle 'othree/eregex.vim'
  "NeoBundle 'plasticboy/vim-markdown'
  "NeoBundle 'reinh/vim-makegreen'
  NeoBundle 'rphillips/vim-zoomwin'
  NeoBundle 'scrooloose/nerdcommenter'
  NeoBundleLazy 'scrooloose/nerdtree'
  "NeoBundle 'scrooloose/syntastic'
  NeoBundle 'sgur/vim-textobj-parameter'
  "NeoBundle 'sgur/unite-everything'
  "NeoBundle 'sjl/clam.vim'
  NeoBundle 'sjl/gundo.vim'
  "NeoBundle 'sjl/splice.vim'
  "NeoBundle 'sjl/vitality.vim'
  NeoBundle 'skammer/vim-css-color'
  NeoBundleLazy 't9md/vim-quickhl'
  NeoBundle 't9md/vim-surround_custom_mapping'
  "NeoBundle 't9md/vim-textmanip'
  "NeoBundle 't9md/vim-underlinetag'
  NeoBundleLazy 't9md/vim-unite-ack'
  "NeoBundle 'taku-o/vim-toggle'
  "NeoBundle 'taku-o/vis-vim'
  "NeoBundle 'tejr/nextag'
  NeoBundle 'thinca/vim-ambicmd'
  NeoBundle 'thinca/vim-fontzoom'
  "NeoBundle 'thinca/vim-openbuf'
  NeoBundle 'thinca/vim-poslist'
  NeoBundle 'thinca/vim-qfreplace'
  NeoBundleLazy 'thinca/vim-quickrun'
  NeoBundle 'thinca/vim-ref'
  NeoBundle 'thinca/vim-scouter'
  NeoBundle 'thinca/vim-singleton'
  "NeoBundle 'thinca/vim-template'
  NeoBundle 'thinca/vim-textobj-comment'
  NeoBundle 'thinca/vim-textobj-between'
  NeoBundleLazy 'thinca/vim-unite-history'
  NeoBundle 'thinca/vim-visualstar'
  "NeoBundle 'tpope/vim-abolish'
  "NeoBundle 'tpope/vim-eunuch'
  "NeoBundle 'tpope/vim-fugitive'
  "NeoBundle 'tpope/vim-markdown'
  "NeoBundle 'tpope/vim-rails'
  NeoBundle 'tpope/vim-repeat'
  NeoBundle 'tpope/vim-surround'
  "NeoBundle 'tpope/vim-speeddating'
  "NeoBundle 'tpope/vim-unimpaired'
  NeoBundleLazy 'tsukkee/unite-help'
  NeoBundleLazy 'tsukkee/unite-tag'
  "NeoBundle 'tyru/caw.vim'
  "NeoBundle 'tyru/current-func-info.vim'
  "NeoBundle 'tyru/operator-camelize.vim'
  NeoBundleLazy 'tyru/open-browser.vim'
  NeoBundleLazy 'tyru/operator-html-escape.vim'
  NeoBundleLazy 'tyru/operator-reverse.vim'
  NeoBundleLazy 'tyru/operator-star.vim'
  NeoBundleLazy 'tyru/restart.vim'
  "NeoBundle 'tyru/vim-altercmd'
  "NeoBundle 'ujihisa/shadow.vim'
  "NeoBundle 'ujihisa/unite-colorscheme'
  "NeoBundle 'ujihisa/unite-locate'
  NeoBundle 'vim-jp/vital.vim'
  NeoBundleLazy 'vimtaku/vim-textobj-sigil'
  "NeoBundle 'vimtaku/vim-textobj-keyvalue'
  "NeoBundle 'xolox/vim-easytags'
  "NeoBundle 'xolox/vim-notes'
  NeoBundle 'xolox/vim-session'
  "NeoBundle 'ynkdir/vim-remote'
  "NeoBundle 'yuratomo/w3m.vim'
  NeoBundle 'deris/columnjump'
  NeoBundle 'deris/parajump'
  NeoBundle 'deris/vim-textobj-enclosedsyntax'
  "NeoBundle 'deris/vim-loadafterft'

  " vim-scripts repos
  "NeoBundle 'Align'
  "NeoBundle 'CD.vim'
  "NeoBundle 'Conque-Shell'
  "NeoBundle 'DirDiff.vim'
  "NeoBundle 'DrawIt'
  "NeoBundle 'FuzzyFinder'
  "NeoBundle 'JSON.vim'
  NeoBundle 'L9'
  "NeoBundle 'Mark'
  "NeoBundle 'QuickBuf'
  "NeoBundle 'QFixHowm'
  "NeoBundle 'Source-Explorer-srcexpl.vim'
  "NeoBundle 'Toggle'
  NeoBundleLazy 'UnconditionalPaste'
  "NeoBundle 'ViewOutput'
  "NeoBundle 'YankRing.vim' "あまり使わないのとkeymap設定で悪さをするので削除
  "NeoBundle 'a.vim'
  "NeoBundle 'bufexplorer.zip'
  "NeoBundle 'closetag.vim'
  NeoBundleLazy 'copypath.vim'
  "NeoBundle 'dbext.vim'
  "NeoBundle 'errormarker.vim'
  "NeoBundle 'grep.vim'
  NeoBundle 'matchit.zip'
  "NeoBundle 'monday'
  "NeoBundle 'perl-support.vim'
  NeoBundleLazy 'project.tar.gz'
  "NeoBundle 'qtmplsel.vim'
  "NeoBundle 'rails.vim'
  NeoBundleLazy 'renamer.vim'
  "NeoBundle 'smartchr'
  "NeoBundle 'statusline.vim'
  NeoBundleLazy 'taglist.vim'
  "NeoBundle 'toggle_words.vim'
  "NeoBundle 'trinity.vim'
  "NeoBundle 'vcscommand.vim'
  NeoBundleLazy 'vimwiki'

  " color scheme
  NeoBundleLazy 'altercation/vim-colors-solarized'
  NeoBundleLazy 'deris/molokai'
  NeoBundle 'deris/vim-wombat'
  NeoBundleLazy 'jnurmine/Zenburn'
  NeoBundleLazy 'newspaper.vim'

  " 日本語help
  NeoBundle 'vim-jp/vimdoc-ja'

endif

filetype plugin indent on

if s:bundled('vim-singleton')
  if has('clientserver')
    call singleton#enable()
  endif
endif
" }}}

"---------------------------------------------------------------------------
" オプションの設定:{{{2

" 文法の色付け
syntax enable

" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" インクリメンタルサーチ
set incsearch
" 検索結果をハイライトする
set hlsearch

"
" vi互換をOFFにする
"set nocompatible
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set nowrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" コマンドライン補完の動作を指定
set wildmode=longest,full
" コマンドライン補完時に無視
set wildignore=.git,.hg,.svn
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.so,*.out,*.class
set wildignore+=*.swp,*.swo,*.swn
set wildignore+=*.DS_Store
" 日本語整形スクリプト(by. 西岡拓洋さん)用の設定
let format_allow_over_tw = 1 " ぶら下り可能幅
"シフト移動幅
set shiftwidth=4
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" 入力されているテキストの最大幅。（0は無効）
set textwidth=0
"自動整形の実行方法を決めるフラグ(tcは自動折り返し。roはコメント文字自動挿入)
setlocal formatoptions=ql
" 行番号を表示
set number
" 相対行番号を表示
"set relativenumber
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<
" * での検索や text-object 等での選択時に - で切らない
"setlocal iskeyword& iskeyword+=-
" Explicitly tell vim that the terminal supports 256 colors
set t_Co=256
" C-a,C-xで8進数を増減しないようhexだけ設定する
set nrformats=hex

" 全角スペースを表示
scriptencoding utf-8

augroup hilightIdegraphicSpace
  autocmd!
  autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

if s:bundled('vim-wombat')
  colorscheme wombat
else
  colorscheme desert
endif

" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 画面上の行数
set lines=50
" タブを常に表示する
set showtabline=2
" statusline
" vim-powerlineを使用するためコメントアウト
"set statusline=%t\ %y\ [%{&fenc}][%{&ff}]\ %m%r%w%h%=%l/%L\ %v\ %P
" virtualedit
set virtualedit=block
" バックアップを作る
set backup
" バックアップファイルの生成ディレクトリ
set backupdir=$DOTVIM/backup
if !isdirectory(&backupdir)
  call mkdir(&backupdir, "p")
endif
" バックアップのスキップ
if has('unix')
  set backupskip=/tmp/*,/private/tmp/*
endif
" スワップを有効
set swapfile
" クリップボードにもコピー
"set clipboard+=unnamed
" スワップファイルの生成ディレクトリ
set directory=$DOTVIM/swap
if !isdirectory(&directory)
  call mkdir(&directory, "p")
endif
" Command Lineの履歴数
set history=1000
" 検索時、カーソルの上または下は最低でも以下指定の行が表示される
"set scrolloff=5
" 折り返された行の先頭に表示する文字列
let &showbreak = '+++ '
" 高速ターミナル接続を行う
set ttyfast
" Undo の永続化
if has('persistent_undo')
  set undodir=$DOTVIM/undo
  set undofile
  if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
  endif
endif

" set tags
"set autochdir
set tags=./tags,../tags,./*/tags,../../tags,../../../tags,../../../../tags

" 文字コードの自動判定
let &termencoding = &encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set fileformats=unix,dos,mac

" UTF-8の文字幅
if exists('&ambiwidth')
  set ambiwidth=double
endif

let g:my_win32_grep_path = 'C:/usr/local/bin/jvgrep.exe'

if has('win32')
  if executable(g:my_win32_grep_path)
    let &grepprg = g:my_win32_grep_path . ' -n8 --enc utf-8,cp932,euc-jp'
  endif
elseif has('mac')
  if executable('ack')
    set grepprg=ack\ -a\ $*\ /dev/null
  endif
endif

" vimdiff時のハイライト
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7

" macの場合の設定
if has('mac')
  noremap ¥ \
  noremap \ ¥

  if has('vim_starting')
    let $PATH=$HOME."/perl5/perlbrew/bin:".$HOME."/perl5/perlbrew/perls/perl-5.10.1/bin:".$HOME."/.cabal/bin:".$PATH
  endif
endif

" カーソルラインと行ラインを表示
augroup cursorsetting
  autocmd!
  autocmd BufWinEnter,WinEnter * setlocal cursorline
  autocmd BufWinEnter,WinEnter * setlocal cursorcolumn
  autocmd BufWinLeave,WinLeave * setlocal nocursorline
  autocmd BufWinLeave,WinLeave * setlocal nocursorcolumn
augroup END

" 自動的に現在編集中のファイルのカレントディレクトリに移動
augroup grlcd
  autocmd!
  autocmd BufRead,BufEnter * lcd %:p:h
augroup END

" 親ディレクトリが存在していなければ作成するかどうか確認
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

let plugin_cmdex_disable = 1

" }}}

"---------------------------------------------------------------------------
" key map:{{{2

" leaderを変更
let mapleader = ","
let maplocalleader = ","

" Escのkeymap
noremap  <C-[> <C-c>
noremap! <C-[> <C-c>
noremap  <C-c> <C-[>
noremap! <C-c> <C-[>
noremap  <C-@> <ESC>
noremap! <C-@> <ESC>

"inoremap jj <Esc>
inoremap jk <Esc>

" switch j,k and gj,gk
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap gj j
vnoremap gk k

" easy scroll
nnoremap <Space>j  <C-f>
nnoremap <Space>k  <C-b>

" *,#での単語検索時、次に単語に移動しない
"nnoremap * *N
"nnoremap # #N

" Jump to matching pairs easily, with Tab
noremap <Tab> %

" key map ^,$ to <Space>h,l. Because ^ and $ is difficult to type and damage little finger!!!
nnoremap <Space>h ^
nnoremap <Space>l $
vnoremap <Space>h ^
vnoremap <Space>l $

" vimrc編集
if has('gui_running')
  nnoremap <Space>.   :<C-u>execute 'tab drop ' . resolve($MYVIMRC)<CR>
  nnoremap <Space>g.  :<C-u>execute 'tab drop ' . resolve($MYGVIMRC)<CR>
else
  nnoremap <Space>.   :<C-u>execute 'tabe ' . resolve($MYVIMRC)<CR>
  nnoremap <Space>g.  :<C-u>execute 'tabe ' . resolve($MYGVIMRC)<CR>
endif
nnoremap <Space>s.  :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif<CR>
" helpショートカット
nnoremap <C-h>      :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>
" 最後に変更されたテキストを選択する
nnoremap gc         `[v`]
vnoremap gc         :<C-u>normal gc<CR>
onoremap gc         :<C-u>normal gc<CR>
" 最後に変更されたテキストに移動する
nnoremap gI `.

" Use more logical mapping (see :h Y)
nnoremap Y y$
" クリップボードからペースト
nnoremap <Space>p "*p
vnoremap <Space>p "*p
nnoremap <Space>P "*P
vnoremap <Space>P "*P
" クリップボードにヤンク
nnoremap <Space>y "*y
nnoremap <Space>Y "*y$
vnoremap <Space>y "*y
" クリップボードにヤンクして削除
nnoremap <Space>d "*d
nnoremap <Space>D "*d$
vnoremap <Space>d "*d
" クリップボードからソース貼り付け
nnoremap <Space>sp :<C-u>let b:save_paste=&paste<CR>:set paste<CR>"*p:let &paste=b:save_paste<CR>
nnoremap <Space>sP :<C-u>let b:save_paste=&paste<CR>:set paste<CR>"*P:let &paste=b:save_paste<CR>

" registerを汚さずに削除
nnoremap <Leader>d "_d
nnoremap <Leader>D "_d$
vnoremap <Leader>d "_d
nnoremap <Leader>x "_x

" 行挿入後インサートモードに入らない
nnoremap <Space>o o<Esc>k
nnoremap <Space>O O<Esc>
nnoremap <S-Space>O O<Esc>

" 連結時に空白を挿入したくないのでJとgJを入れ替え
nnoremap J  gJ
nnoremap gJ J
vnoremap J  gJ
vnoremap gJ J

" from ujihisa's vimrc
nnoremap <Space>I $i
"nnoremap <Space>C $C
nnoremap X ^x
"nnoremap cp Pjdd

";と:を入れ替え
nnoremap ; :
vnoremap ; :
nnoremap q; q:
vnoremap q; q:
nnoremap : ;
vnoremap : ;
nnoremap @; @:
vnoremap @; @:
nnoremap ,; @:
vnoremap ,; @:

" Don't use Ex mode, use Q for formatting
map Q gq

" map w to iw in motion. Because iw is commonly-used key and don't use w in motion.
onoremap w iw
onoremap W iW

" マッチするものがないパーレンまで移動
" tは癖で打ってしまうのでi,aに。。。
onoremap ) i)
onoremap ( a(
vnoremap ) i)
vnoremap ( a(

" よく使うものはtを省略できるようkeymap
onoremap ; t;
onoremap <Space> t<Space>

" text-objectを割り当て
onoremap aa  a>
vnoremap aa  a>
onoremap ia  i>
vnoremap ia  i>

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

"onoremap aq  a'
"vnoremap aq  a'
"onoremap iq  i'
"vnoremap iq  i'

" key mapping強制ギブス
onoremap a>  <Esc>
vnoremap a>  <Esc>
onoremap i>  <Esc>
vnoremap i>  <Esc>
onoremap a<  <Esc>
vnoremap a<  <Esc>
onoremap i<  <Esc>
vnoremap i<  <Esc>

onoremap a]  <Esc>
vnoremap a]  <Esc>
onoremap i]  <Esc>
vnoremap i]  <Esc>
onoremap a[  <Esc>
vnoremap a[  <Esc>
onoremap i[  <Esc>
vnoremap i[  <Esc>

onoremap a"  <Esc>
vnoremap a"  <Esc>
onoremap i"  <Esc>
vnoremap i"  <Esc>

" モーション時にqで記号まで飛ぶ
onoremap <silent> q
  \      :<C-u>for i in range(v:count1)
  \ <Bar>   call search('.\&\(\k\<Bar>\_s\)\@!', 'W')
  \ <Bar> endfor<CR>

" exコマンド
nnoremap <Space>w :<C-u>w<CR>
nnoremap <Space>q :<C-u>q<CR>
nnoremap <Space>Q :<C-u>q!<CR>
nnoremap <S-Space>Q :<C-u>q!<CR>

" 仮想置換モード
nnoremap R gR

" 危険なので無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" command mode
cnoremap <C-b> <Left>
"cnoremap <expr> <C-f> (getcmdpos()==strlen(getcmdline())+1 ? "\<C-f>" : "\<Right>")
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
cnoremap <C-a> <Home>
cnoremap <expr> <C-d> (getcmdpos()==strlen(getcmdline())+1 ? "\<C-d>" : "\<Del>")
cnoremap <C-e> <END>
cnoremap <C-h> <BS>
" カーソル位置にかかわらず全部消す
cnoremap <C-u> <C-e><C-u>

" コマンドラインモードでコマンドラインウィンドウを開く
cnoremap <C-v> <C-f>a

" カーソル下のlineを挿入
cnoremap <expr> <C-r><C-l>   matchstr(getline("."), '[^ \t:][^\r\n]*')

" command modeでの自動エスケープ
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'
cnoremap <C-/>  /
cnoremap <C-?>  ?

cnoremap <C-r>' <C-r>"

" 置換の自動入力
nnoremap gs  :<C-u>%s///g<Left><Left><Left>
vnoremap gs  :s///g<Left><Left><Left>

"nnoremap <Leader>ds :s/ *$//<CR>setlocal nohlsearch<CR>
"vnoremap <Leader>ds :s/ *$//<CR>setlocal nohlsearch<CR>
"nnoremap <Leader>dS :%s/ *$//<CR>setlocal nohlsearch<CR>

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
" undoできるc-w,c-u
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

inoremap <S-Enter> <C-o>O

" ハイライトを消す
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap <silent> <C-c><C-c> :<C-u>nohlsearch<CR>
nnoremap <silent> <C-[><C-[> :<C-u>nohlsearch<CR>
nnoremap <silent> <C-@><C-@> :<C-u>nohlsearch<CR>

" * はASCIIとJISでキー配置が異なるので共通で使えるkeymapを設定
"nnoremap <silent> <Space>/  *N
"nnoremap <silent> <Space>?  #N

" 検索移動時に折畳を開く
nnoremap n nzv
nnoremap N Nzv

nnoremap gg ggzv
nnoremap G  Gzv

" 仮想編集の変更
nnoremap <Space>va  :<C-u>setlocal virtualedit=all<CR>
nnoremap <Space>vb  :<C-u>setlocal virtualedit=block<CR>
nnoremap <Space>vv  :let &virtualedit=(&ve == "all" ? "block" : "all")<CR>:setlocal virtualedit<CR>

" very magic（正規表現をエスケープしなくてよくなる）
noremap /   /\v
noremap ?   ?\v

" buffer
nnoremap gh  :<C-u>bprevious<CR>
nnoremap gl  :<C-u>bnext<CR>

" カーソル下のウィンドウを編集（数字が付いていればその行へ）
noremap gf gF

" tab page
nnoremap [TabPage]   <Nop>
nmap     <C-t>    [TabPage]
nnoremap <silent> [TabPage]<C-t> :<C-u>tabnew<CR>
nnoremap <silent> [TabPage]n     :<C-u>tabnew<CR>
nnoremap <silent> [TabPage]<C-n> :<C-u>tabnew<CR>
nnoremap <silent> [TabPage]c     :<C-u>tabclose<CR>
nnoremap <silent> [TabPage]<C-c> :<C-u>tabclose<CR>
nnoremap <silent> [TabPage]w     :<C-u>tabclose<CR>
nnoremap <silent> [TabPage]<C-w> :<C-u>tabclose<CR>
nnoremap <silent> [TabPage]o     :<C-u>tabonly<CR>
nnoremap <silent> [TabPage]<C-o> :<C-u>tabonly<CR>
nnoremap <silent> [TabPage]m     :<C-u>tabmove<CR>
nnoremap <silent> [TabPage]<C-m> :<C-u>tabmove<CR>
nnoremap <silent> [TabPage]l     :<C-u>tablast<CR>
nnoremap <silent> [TabPage]<C-l> :<C-u>tablast<CR>
nnoremap <silent> [TabPage]h     :<C-u>tabfirst<CR>
nnoremap <silent> [TabPage]<C-h> :<C-u>tabfirst<CR>
nnoremap <silent> [TabPage]L     :<C-u>execute 'tabmove' tabpagenr() - 2<CR>
nnoremap <silent> [TabPage]H     :<C-u>execute 'tabmove' tabpagenr()<CR>

nnoremap <silent> <C-p> gT
nnoremap <silent> <C-n> gt

nnoremap <silent> gr gT

" tag jump
nnoremap [TagJump]    <Nop>
nmap     t            [TagJump]
nnoremap [TagJump]t   <C-]>          " 「飛ぶ」
nnoremap [TagJump]j   :<C-u>tag<CR>  " 「進む」
nnoremap [TagJump]k   :<C-u>pop<CR>  " 「戻る」
nnoremap [TagJump]l   :<C-u>tags<CR> " 履歴一覧
"--------------------
" Function: Open tag under cursor in new tab
" Source:   http://stackoverflow.com/questions/563616/vimctags-tips-and-tricks
"--------------------
nnoremap [TagJump]n   :<C-u>tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" filetype
"nnoremap [FileType]   <Nop>
"nmap     <Space>t     [FileType]
nnoremap <Space>tp  :<C-u>set filetype=perl<CR>
nnoremap <Space>tv  :<C-u>set filetype=vim<CR>
nnoremap <Space>tc  :<C-u>set filetype=c<CR>
nnoremap <Space>to  :<C-u>set filetype=objc<CR>
nnoremap <Space>tj  :<C-u>set filetype=java<CR>
nnoremap <Space>ts  :<C-u>set filetype=shell<CR>
nnoremap <Space>tr  :<C-u>set filetype=ruby<CR>
nnoremap <Space>ta  :<C-u>set filetype=javascript<CR>
nnoremap <Space>th  :<C-u>set filetype=html<CR>
nnoremap <Space>tx  :<C-u>set filetype=xml<CR>
nnoremap <Space>td  :<C-u>set filetype=diff<CR>

" cscope
"if has("cscope")
  "set cscopeprg=/usr/local/bin/cscope
  "set cscopetagorder=0
  "set cscopetag
  "set cscopepathcomp=3
  "set nocscopeverbose
  "cs add .cscope.out
  "set csverb

  ""
  "" cscope find
  ""
  "" 0 or s: Find this C symbol
  "" 1 or d: Find this definition
  "" 2 or g: Find functions called by this function
  "" 3 or c: Find functions calling this function
  "" 4 or t: Find assignments to
  "" 6 or e: Find this egrep pattern
  "" 7 or f: Find this file
  "" 8 or i: Find files #including this file
  ""
  "map ^Ks     :cs find 0 <C-R>=expand("<cword>")<CR><CR>
  "map ^Kd     :cs find 1 <C-R>=expand("<cword>")<CR><CR>
  "map ^Kg     :cs find 2 <C-R>=expand("<cword>")<CR><CR>
  "map ^Kc     :cs find 3 <C-R>=expand("<cword>")<CR><CR>
  "map ^Kt     :cs find 4 <C-R>=expand("<cword>")<CR><CR>
  "map ^Ke     :cs find 6 <C-R>=expand("<cword>")<CR><CR>
  "map ^Kf     :cs find 7 <C-R>=expand("<cfile>")<CR><CR>
  "map ^Ki     :cs find 8 <C-R>=expand("%")<CR><CR>
"endif


"noremap <Leader>sp :<C-u>vsplit <CR>

"nnoremap <sid>(command-line-enter) q:
"xnoremap <sid>(command-line-enter) q:
"nnoremap <sid>(command-line-norange) q:<C-u>

" Creating underline/overline headings for markup languages
" Inspired by http://sphinx.pocoo.org/rest.html#sections
"nnoremap <Leader>1 yyPVr=jyypVr=
"nnoremap <Leader>2 yyPVr*jyypVr*
"nnoremap <Leader>3 yypVr=
"nnoremap <Leader>4 yypVr-
"nnoremap <Leader>5 yypVr^
"nnoremap <Leader>6 yypVr"

" カーソル行前後にコメント入力
" TODO:一行じゃなくてvisual modeで選択した範囲をコメントで囲む
" TODO:現在ラインと同じ文字数ではなく特定の文字数(80文字とか)のコメントを入力
"nnoremap <Space>* yyPVr*^r/$r/jyypVr*^r/$r/
"nnoremap <Space># yyPVr#jyypVr#

if has('win32')
  " Save the current buffer and execute the Tortoise SVN interface's diff program
  "nnoremap <silent> <Leader>sd :<c-u>w<CR>:silent !C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:diff /path:"%" /notempfile /closeonend<CR>
  nnoremap <silent> <Leader>sd :<c-u>call <SID>TortoiseDiff()<CR>
  " Save the current buffer and execute the Tortoise SVN interface's log
  nnoremap <silent> <Leader>sl :<c-u>w<CR>:silent !C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:log /path:"%" /notempfile /closeonend<CR>
  " Save the current buffer and execute the Tortoise SVN interface's revision graph
  nnoremap <silent> <Leader>sr :<c-u>w<CR>:silent !C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:revisiongraph /path:"%" /notempfile /closeonend<CR>
  " Save the current buffer and execute the Tortoise SVN interface's blame program
  nnoremap <silent> <Leader>sb :<c-u>call <SID>TortoiseBlame()<CR>

  function! s:TortoiseDiff()
    silent execute(':w')
    let filename = shellescape(expand("%:p"))
    let cmdname = escape(shellescape('D:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe'), ' \')
    let cmdline = '! start "" ' . cmdname . ' /command:diff /path:' . filename . ' /notempfile /closeonend'
    silent execute(cmdline)
  endfunction

  function! s:TortoiseBlame()
    silent execute(':w')
    let filename = shellescape(expand("%:p"))
    let linenum = line(".")
    let cmdname = escape(shellescape('D:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe'), ' \')
    let cmdline = '! start "" ' . cmdname . ' /command:blame /path:' . filename . ' /line:' . linenum . '/notempfile /closeonend'
    silent execute(cmdline)
  endfunction
endif

" kana's useful tab function {{{
function! s:move_window_into_tab_page(target_tabpagenr)
  " Move the current window into a:target_tabpagenr.
  " If a:target_tabpagenr is 0, move into new tab page.
  if a:target_tabpagenr < 0  " ignore invalid number.
    return
  endif
  let original_tabnr = tabpagenr()
  let target_bufnr = bufnr('')
  let window_view = winsaveview()

  if a:target_tabpagenr == 0
    tabnew
    tabmove  " Move new tabpage at the last.
    execute target_bufnr 'buffer'
    let target_tabpagenr = tabpagenr()
  else
    execute a:target_tabpagenr 'tabnext'
    let target_tabpagenr = a:target_tabpagenr
    topleft new  " FIXME: be customizable?
    execute target_bufnr 'buffer'
  endif
  call winrestview(window_view)

  execute original_tabnr 'tabnext'
  if 1 < winnr('$')
    close
  else
    enew
  endif

  execute target_tabpagenr 'tabnext'
endfunction " }}}

" move current buffer into a new tab.
nnoremap <silent> <C-w><C-t> :<C-u>call <SID>move_window_into_tab_page(0)<CR>
nnoremap <silent> <C-w>t     :<C-u>call <SID>move_window_into_tab_page(0)<CR>

nnoremap t2 :<C-U>setlocal expandtab shiftwidth=2 tabstop=2<CR>
nnoremap t4 :<C-U>setlocal noexpandtab shiftwidth=4 tabstop=4<CR>
nnoremap <Space>t2 :<C-U>setlocal expandtab shiftwidth=2 tabstop=2 nolist<CR>
nnoremap <Space>t4 :<C-U>setlocal noexpandtab shiftwidth=4 tabstop=4 nolist<CR>

if has('win32')
  nnoremap <silent> <Leader>hg :<c-u>call <SID>HidemaruGrep()<CR>

  function! s:HidemaruGrep()
    " current word
    let l:word = expand("<cword>")
    " target file
    let l:targetfile  = getcwd() . '\*'
    " command line
    let l:cmd = 'C:\Progra~1\Hidemaru\Hidemaru.exe /gu,"' . l:targetfile . '",' . l:word
    " grep hidemaru
    silent execute('! start "" ' . l:cmd)
  endfunction
endif

" 差分モードを終了する
function! s:DiffOff()
  diffoff!
  set nowrap
endfunction

command! DiffOff call s:DiffOff()

function! s:GoogleChrome(...)
  if has('mac')
    let l:cmd = "silent !open -a Google\\ Chrome "
  elseif has('win32')
    let l:cmd = "silent !start google\\ chrome "
  endif
  if a:0 == 0
    execute l:cmd . "%"
  else
    execute l:cmd . a:1
  endif
endfunction

command! -nargs=? GoogleChrome call s:GoogleChrome(<f-args>)

command! -nargs=1 -complete=filetype FileType execute "set filetype=".<q-args>

" 検索文字列をレジスタでグローバル置換
function! s:ReplaceGlobalSearchToRegister()
  let l:reg = getreg(v:register)
  let l:cmd = '%substitute//'
  let l:opt = '/g'
  execute l:cmd . l:reg . l:opt
endfunction

nnoremap <silent> <Space>rs :<C-u>call <SID>ReplaceGlobalSearchToRegister()<CR>

" from ujihisa's vimrc
command! -count=1 -nargs=0 GoToTheLine silent execute getpos('.')[1][:-len(v:count)-1] . v:count
nnoremap <silent> gl :GoToTheLine<Cr>

function! s:Grep(pattern, target)
  silent NeoBundleSource unite.vim unite-quickfix

  execute 'grep ' . a:pattern . ' ' . a:target
  Unite -no-quit -direction=botright quickfix
endfunction

command! -nargs=+ Grep call s:Grep(<f-args>)

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
  autocmd FileType * setlocal fo-=t fo-=c fo-=r fo-=o
  autocmd FileType * setlocal textwidth=0
  autocmd SourceCmd .vimrc setlocal fo-=t fo-=c fo-=r fo-=o
augroup END
augroup vimlang
  autocmd!
  autocmd FileType vim setlocal expandtab tabstop=2 shiftwidth=2 list
  autocmd FileType vim let g:vim_indent_cont = 2
augroup END
augroup snippetlang
  autocmd!
  autocmd FileType snippet setlocal noexpandtab tabstop=4 shiftwidth=4 list
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
  " perlの関数に飛ぶ
  autocmd filetype perl noremap <silent><buffer> ]]  m':<c-u>call search('^\s*sub\>', "W")<CR>
  autocmd filetype perl noremap <silent><buffer> [[  m':<c-u>call search('^\s*sub\>', "bW")<CR>
  autocmd FileType perl compiler perl
  "autocmd BufWritePost *.pl,*.pm silent make
augroup END
augroup htmlfile
  autocmd!
  autocmd FileType html setlocal expandtab tabstop=2 shiftwidth=2 list
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
  autocmd FileType scala setlocal expandtab tabstop=4 shiftwidth=4 list
augroup END
augroup zshlang
  autocmd!
  autocmd FileType zsh setlocal expandtab tabstop=2 shiftwidth=2 list
augroup END

"if has('mac')
"  let $PERL_DLL = "/opt/local/lib/perl5/5.10.1/darwin-multi-2level/CORE/libperl.a"
"  let $RUBY_DLL = "/opt/local/lib/libruby.dylib"
"endif


" Objective-C
if has('mac')
  " for tablist.vim Objective-C
  let tlist_objc_settings='objc;P:protocols;i:interfaces;I:implementations;M:instance methods;C:implementation methods;Z:protocol methods'
  " for a.vim Objective-C
  let g:alternateExtensions_h = "m,mm,c,cpp"
  let g:alternateExtensions_m = "h"
  let g:alternateExtensions_mm = "h,hpp"
  " for Objective-C gfでジャンプできるように
  augroup objclang
    autocmd!
    autocmd FileType objc setlocal path=.;,/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.0.sdk/System/Library/Frameworks,/Developer/SDKs/MacOSX10.6.sdk/System/Library/Frameworks,,
    autocmd FileType objc setlocal include=^\s*#\s*import
    autocmd FileType objc setlocal includeexpr=substitute(v:fname,'\/','\.framework/Headers/','g')
    autocmd FileType objc setlocal makeprg=xcodebuild\ -activetarget\ -activeconfiguration
  augroup END
endif

" }}}

" }}}

"---------------------------------------------------------------------------
" plugins {{{1

"runtime macros/editexisting.vim

"---------------------------------------------------------------------------
" for Lokaltog/vim-easymotion {{{2
if s:bundled('vim-easymotion')
  let g:EasyMotion_leader_key = ','
  let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  let g:EasyMotion_do_shade = 1
  hi EasyMotionTarget ctermbg=none ctermfg=green
  hi EasyMotionShade  ctermbg=none ctermfg=blue
endif
" }}}

"---------------------------------------------------------------------------
" for Shougo/neocomplcache {{{2
if s:bundled('neocomplcache')
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplcache.
  let g:neocomplcache_enable_at_startup = 1
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 1
  "" Use camel case completion.
  "let g:neocomplcache_enable_camel_case_completion = 1
  "" Use underbar completion.
  "let g:neocomplcache_enable_underbar_completion = 1
  "" Set minimum syntax keyword length.
  "let g:neocomplcache_min_syntax_length = 3
  "let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

  let g:neocomplcache_auto_completion_start_length = 3
  let g:neocomplcache_manual_completion_start_length = 3

  " Define dictionary.
  let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

  " Define keyword.
  if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'


  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  "inoremap <expr><C-e>  neocomplcache#cancel_popup()

  "imap <Tab>  <Plug>(neocomplcache_start_unite_snippet)
  "smap <Tab>  <Plug>(neocomplcache_start_unite_snippet)

  " AutoComplPop like behavior.
  "let g:neocomplcache_enable_auto_select = 1

  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplcache_enable_auto_select = 1
  "let g:neocomplcache_disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
  "inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
  "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
  let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  "let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif
" }}}

"---------------------------------------------------------------------------
" for Shougo/neocomplcache-snippets-complete {{{2
if s:bundled('neocomplcache-snippets-complete')
  let g:neocomplcache_snippets_dir = $DOTVIM.'/snippets'
  if !isdirectory(g:neocomplcache_snippets_dir)
    call mkdir(g:neocomplcache_snippets_dir, "p")
  endif

  " Plugin key-mappings.
  imap <C-k>     <Plug>(neocomplcache_snippets_expand)
  smap <C-k>     <Plug>(neocomplcache_snippets_expand)

  smap <C-e>     <Plug>(neocomplcache_snippets_force_jump)

  nnoremap <Space>es :<C-u>NeoComplCacheEditSnippets<Space>

  " SuperTab like snippets behavior.
  imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ?
    \ "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
endif
" }}}

"---------------------------------------------------------------------------
" for Shougo/unite.vim {{{2
" The prefix key.
if s:bundled('unite.vim')
  nnoremap [unite]    <Nop>
  nmap     <Space>u [unite]

  nnoremap <silent> [unite]c
    \ :<C-u>NeoBundleSource unite.vim<CR>
    \:<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
  nnoremap <silent> [unite]b
    \ :<C-u>NeoBundleSource unite.vim<CR>
    \:<C-u>Unite buffer<CR>
  nnoremap <silent> [unite]r
    \ :<C-u>NeoBundleSource unite.vim<CR>
    \:<C-u>Unite register<CR>
  nnoremap <silent> [unite]o
    \ :<C-u>silent! NeoBundleSource unite.vim unite-outline<CR>
    \:<C-u>Unite outline<CR>
  nnoremap <silent> [unite]u
    \ :<C-u>NeoBundleSource unite.vim<CR>
    \:<C-u>Unite file_mru<CR>
  nnoremap <silent> [unite]d
    \ :<C-u>NeoBundleSource unite.vim<CR>
    \:<C-u>Unite directory_mru<CR>
  nnoremap <silent> [unite]k
    \ :<C-u>NeoBundleSource unite.vim<CR>
    \:<C-u>Unite bookmark<CR>
  nnoremap <silent> [unite]s
    \ :<C-u>NeoBundleSource unite.vim<CR>
    \:<C-u>Unite source<CR>
  nnoremap <silent> [unite]f
    \ :<C-u>NeoBundleSource unite.vim<CR>
    \:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
  nnoremap <silent> [unite]g
    \ :<C-u>NeoBundleSource unite.vim<CR>
    \:<C-u>Unite grep<CR>
  nnoremap <silent> [unite]h
    \ :<C-u>silent! NeoBundleSource unite.vim unite-help<CR>
    \:<C-u>Unite help<CR>
  nnoremap <silent> [unite];
    \ :<C-u>silent! NeoBundleSource unite.vim vim-unite-history<CR>
    \:<C-u>Unite history/command<CR>
  nnoremap <silent> [unite]/
    \ :<C-u>silent! NeoBundleSource unite.vim vim-unite-history<CR>
    \:<C-u>Unite history/search<CR>
  nnoremap <silent> [unite]y
    \ :<C-u>NeoBundleSource unite.vim<CR>
    \:<C-u>Unite history/yank<CR>
  nnoremap <silent> [unite]a
    \ :<C-u>NeoBundleSource unite.vim<CR>
    \:<C-u>UniteBookmarkAdd<CR>
  nnoremap <silent> [unite]n
    \ :<C-u>silent! NeoBundleSource unite.vim neobundle.vim<CR>
    \:<C-u>Unite neobundle/install:!<CR>
  nnoremap <silent> [unite]e
    \ :<C-u>silent! NeoBundleSource unite.vim neocomplcache-snippets-complete<CR>
    \:<C-u>Unite snippet<CR>
  nnoremap <silent> [unite]q
    \ :<C-u>silent! NeoBundleSource unite.vim unite-quickfix<CR>
    \:<C-u>Unite quickfix<CR>
  nnoremap <silent> [unite]p
    \ :<C-u>silent! NeoBundleSource unite.vim vim-quickrun<CR>
    \:<C-u>Unite ref/perldoc<CR>

  " Start insert.
  "let g:unite_enable_start_insert = 1

  autocmd FileType unite call s:unite_my_settings()
  function! s:unite_my_settings()"{{{
    " Overwrite settings.

    nmap <buffer> <ESC>  <Plug>(unite_exit)
    nmap <buffer> <C-c>  <Plug>(unite_exit)
    "imap <buffer> jj     <Plug>(unite_insert_leave)
    imap <buffer> jk     <Plug>(unite_insert_leave)
    "imap <buffer> <C-w>  <Plug>(unite_delete_backward_path)

    " <C-l>: manual neocomplcache completion.
    inoremap <buffer> <C-l>  <C-x><C-u><C-p><Down>

    " action key mapping
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')

  endfunction"}}}

  let g:unite_source_file_mru_limit = 200
  let g:unite_cursor_line_highlight = 'TabLineSel'
  let g:unite_abbr_highlight = 'TabLine'
  let g:unite_winheight = 15
  let g:unite_source_file_mru_time_format = "%m/%d %H:%M "

  " For optimize.
  let g:unite_source_file_mru_filename_format = ''

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
  endif
  " For unite-session.
  " Save session automatically.
  "let g:unite_source_session_enable_auto_save = 1
  " Load session automatically.
  "autocmd VimEnter * UniteSessionLoad

endif
" }}}

"---------------------------------------------------------------------------
" for Shougo/vimfiler {{{2
" File explorer like behavior.
if s:bundled('vimfiler')
  nnoremap [vimfiler]  <Nop>
  nmap     <Space>f  [vimfiler]

  nnoremap <silent> [vimfiler]f
    \ :<C-u>NeoBundleSource unite.vim vimfiler<CR>
    \:<C-u>VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
  nnoremap <silent> [vimfiler]d
    \ :<C-u>NeoBundleSource unite.vim vimfiler<CR>
    \:<C-u>VimFilerTab -double<CR>

  let g:vimfiler_as_default_explorer = 1

  " Use trashbox.
  " Windows only and require latest vimproc.
  if has('win32')
    let g:unite_kind_file_use_trashbox = 1
  endif

  let g:vimfiler_data_directory = $DOTVIM . '/.vimfiler'
  if !isdirectory(g:vimfiler_data_directory)
    call mkdir(g:vimfiler_data_directory, "p")
  endif

  " Like Textmate icons.
  let g:vimfiler_tree_leaf_icon = ' '
  let g:vimfiler_tree_opened_icon = '-'
  let g:vimfiler_tree_closed_icon = '+'
  let g:vimfiler_file_icon = '-'
  let g:vimfiler_marked_file_icon = '*'

  autocmd FileType vimfiler call s:vimfiler_my_settings()
  function! s:vimfiler_my_settings()"{{{
    " Overwrite settings.
    if has('gui_running')
      nnoremap <buffer> E  :call vimfiler#mappings#do_action('tabdrop')<Cr>
    else
      nnoremap <buffer> E  :call vimfiler#mappings#do_action('tabopen')<Cr>
    endif
    nnoremap <buffer> s  :call vimfiler#mappings#do_action('left')<Cr>

  endfunction"}}}

endif
" }}}

"---------------------------------------------------------------------------
" for h1mesuke/vim-alignta {{{2
if s:bundled('vim-alignta')
  nnoremap <Space>as
    \ :<C-u>NeoBundleSource vim-alignta<CR>
    \:<C-u>Alignta =<CR>
  vnoremap <Space>as
    \ :<C-u>NeoBundleSource vim-alignta<CR>
    \gv
    \:Alignta =<CR>
  nnoremap <Space>ah
    \ :<C-u>NeoBundleSource vim-alignta<CR>
    \:<C-u>Alignta =><CR>
  vnoremap <Space>ah
    \ :<C-u>NeoBundleSource vim-alignta<CR>
    \gv
    \:Alignta =><CR>

  "augroup perllang
    "autocmd filetype perl vnoremap <space>ah  :<c-u>alignctrl l-l<cr>gv:align =><cr>
  "augroup end
endif
" }}}

"---------------------------------------------------------------------------
" for jpalardy/vim-slime {{{2
let g:slime_target = 'tmux'
let g:slime_paste_file = tempname()
" }}}

"---------------------------------------------------------------------------
" for kana/vim-submode {{{2
if s:bundled('vim-submode')
  "let g:submode_keyseqs_to_leave = ['<Esc>']
  "let g:submode_timeoutlen = 4000

  "call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
  "call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
  "call submode#leave_with('undo/redo', 'n', '', '<Esc>')
  "call submode#map('undo/redo', 'n', '', '-', 'g-')
  "call submode#map('undo/redo', 'n', '', '+', 'g+')

  "call submode#enter_with('window-mode', 'nv', '', '<C-w>')
  "call submode#leave_with('window-mode', 'nv', '', '<Esc>')
  "call submode#map('window-mode', 'nv', '', 'h', '<C-w>h')
  "call submode#map('window-mode', 'nv', '', 'j', '<C-w>j')
  "call submode#map('window-mode', 'nv', '', 'k', '<C-w>k')
  "call submode#map('window-mode', 'nv', '', 'l', '<C-w>l')
  "call submode#map('window-mode', 'nv', '', 'w', '<C-w>w')
  "call submode#map('window-mode', 'nv', '', 'v', '<C-w>v')
  "call submode#map('window-mode', 'nv', '', 's', '<C-w>s')
  "call submode#map('window-mode', 'nv', '', 'n', '<C-w>n')
  "call submode#map('window-mode', 'nv', '', 'q', '<C-w>q')
  "call submode#map('window-mode', 'nv', '', '+', '<C-w>+')
  "call submode#map('window-mode', 'nv', '', '-', '<C-w>-')
  "call submode#map('window-mode', 'nv', '', '<', '<C-w><')
  "call submode#map('window-mode', 'nv', '', '=', '<C-w>=')
  "call submode#map('window-mode', 'nv', '', '>', '<C-w>>')
  "call submode#map('window-mode', 'nv', '', 'H', '<C-w>H')
  "call submode#map('window-mode', 'nv', '', 'J', '<C-w>J')
  "call submode#map('window-mode', 'nv', '', 'K', '<C-w>K')
  "call submode#map('window-mode', 'nv', '', 'L', '<C-w>L')
  "call submode#map('window-mode', 'nv', '', 'P', '<C-w>P')
  "call submode#map('window-mode', 'nv', '', 'R', '<C-w>R')
  "call submode#map('window-mode', 'nv', '', 'S', '<C-w>S')
  "call submode#map('window-mode', 'nv', '', 'T', '<C-w>T')
  "call submode#map('window-mode', 'nv', '', 'W', '<C-w>W')

  "call submode#enter_with('tab-mode', 'nv', '', 'gt', 'gt')
  "call submode#enter_with('tab-mode', 'nv', '', 'gT', 'gT')
  "call submode#enter_with('tab-mode', 'nv', '', 'gr', 'gT')
  "call submode#leave_with('tab-mode', 'nv', '', '<Esc>')
  "call submode#map('tab-mode', 'nv', '', 't', 'gt')
  "call submode#map('tab-mode', 'nv', '', 'T', 'gT')
  "call submode#map('tab-mode', 'nv', '', 'r', 'gT')

  "call submode#enter_with('ex-move', 'nv', '', '<Space>j', '<PageDown>')
  "call submode#enter_with('ex-move', 'nv', '', '<Space>k', '<PageUp>')
  "call submode#leave_with('ex-move', 'nv', '', '<Esc>')
  "call submode#map('ex-move', 'nv', '', 'j', '<PageDown>')
  "call submode#map('ex-move', 'nv', '', 'k', '<PageUp>')
  "call submode#map('ex-move', 'nv', '', 'u', '<C-u>')
  "call submode#map('ex-move', 'nv', '', 'd', '<C-d>')
  "call submode#map('ex-move', 'nv', '', 'g', 'gg')
  "call submode#map('ex-move', 'nv', '', 'G', 'G')

endif
" }}}

"---------------------------------------------------------------------------
" for kana/vim-operator-replace {{{2
if s:bundled('vim-operator-user') && s:bundled('vim-operator-replace')
  map s <Plug>(operator-replace)
  map S <Plug>(operator-replace)$
  nmap ss V<Plug>(operator-replace)
  " clipboardからoperator-replace
  map <Space>s "*<Plug>(operator-replace)
  map <Space>S "*<Plug>(operator-replace)$
  nmap <Space>ss V"*<Plug>(operator-replace)
endif
" }}}

"---------------------------------------------------------------------------
" for kana/vim-scratch {{{2
if s:bundled('vim-scratch')
  function! s:ScratchToggle()
    silent! NeoBundleSource vim-scratch
    if exists("t:is_scratch_window")
      unlet t:is_scratch_window
      ScratchClose
      echo 'close'
    else
      let t:is_scratch_window = 1
      ScratchOpen
      echo 'open'
    endif
  endfunction

  command! -nargs=0 ScratchToggle call s:ScratchToggle()
  nnoremap <Leader><Leader> :<C-u>ScratchToggle<CR>
endif
" }}}

"---------------------------------------------------------------------------
" for kana/vim-smartword {{{2
if s:bundled('vim-smartword')
  nmap w  <Plug>(smartword-w)
  vmap w  <Plug>(smartword-w)
  map  b  <Plug>(smartword-b)
  map  e  <Plug>(smartword-e)
  map  ge <Plug>(smartword-ge)
endif
" }}}

"---------------------------------------------------------------------------
" for kien/ctrlp.vim {{{2
if s:bundled('ctrlp.vim')
  let g:ctrlp_map = ''
  let g:ctrlp_by_filename = 1
  let g:ctrlp_mruf_max = 200
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<c-h>', '<bs>'],
    \ 'PrtDelete()':          ['<del>'],
    \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
    \ 'PrtHistory(-1)':       ['<c-j>'],
    \ 'PrtHistory(1)':        ['<c-k>'],
    \ 'PrtCurLeft()':         ['<left>'],
    \ 'PrtCurRight()':        ['<right>'],
    \ }
  let g:ctrlp_reuse_window = 'netrw\|help\|quickfix\|NERD_tree_2\|__Tag_List__\|*Scratch*'

  nnoremap [ctrlp]  <Nop>
  nmap     <Space>c [ctrlp]

  nnoremap [ctrlp]b
    \ :<C-u>NeoBundleSource ctrlp.vim<CR>
    \:<C-u>CtrlPBuffer<CR>
  nnoremap [ctrlp]m
    \ :<C-u>NeoBundleSource ctrlp.vim<CR>
    \:<C-u>CtrlPMRUFiles<CR>
  nnoremap [ctrlp]u
    \ :<C-u>NeoBundleSource ctrlp.vim<CR>
    \:<C-u>CtrlPMRUFiles<CR>
  nnoremap [ctrlp]f
    \ :<C-u>NeoBundleSource ctrlp.vim<CR>
    \:<C-u>CtrlPCurFile<CR>
endif
" }}}

"---------------------------------------------------------------------------
" for mattn/zencoding-vim {{{2
if s:bundled('zencoding-vim')
  let g:user_zen_expandabbr_key = '<c-y>'
  let g:user_zen_settings = {
    \  'lang' : 'ja',
    \  'html' : {
    \    'filters' : 'html',
    \    'indentation' : '  '
    \  },
    \  'xhtml' : {
    \    'filters' : 'html',
    \    'indentation' : '  '
    \  },
    \  'perl' : {
    \    'indentation' : '    ',
    \    'aliases' : {
    \      'req' : "require '|'"
    \    },
    \    'snippets' : {
    \      'use' : "use strict\nuse warnings\n\n",
    \      'w' : "warn \"${cursor}\";",
    \    },
    \  },
    \  'css' : {
    \    'filters' : 'fc',
    \  },
    \  'javascript' : {
    \    'snippets' : {
    \      'jq' : "$(function() {\n\t${cursor}${child}\n});",
    \      'jq:each' : "$.each(arr, function(index, item)\n\t${child}\n});",
    \      'fn' : "(function() {\n\t${cursor}\n})();",
    \      'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
    \    },
    \  },
    \}
endif
" }}}

"---------------------------------------------------------------------------
" for motemen/git-vim {{{2
if s:bundled('git-vim')
  let g:git_no_map_default = 1
  let g:git_command_edit = 'leftabove new'
  let g:git_author_highlight = { 'deris0126': 'term=reverse cterm=bold ctermbg=12 gui=bold guibg=red' }
  let g:git_highlight_blame = 1
  let g:git_blame_width = 50

  nnoremap [Git]     <Nop>
  nmap     <Space>g  [Git]

  nnoremap [Git]d :<C-u>GitDiff<CR>
  nnoremap [Git]D :<C-u>GitDiff --cached<CR>
  nnoremap [Git]s :<C-u>GitStatus<CR>
  nnoremap [Git]l :<C-u>GitLog<CR>
  nnoremap [Git]L :<C-u>GitLog -u \| head -10000<CR>
  nnoremap [Git]a :<C-u>GitAdd<CR>
  nnoremap [Git]A :<C-u>GitAdd <cfile><CR>
  nnoremap [Git]c :<C-u>GitCommit<CR>
  nnoremap [Git]C :<C-u>GitCommit --amend<CR>
  nnoremap [Git]p :<C-u>Git push
  nnoremap [Git]r :<C-u>GitPullRebase<CR>
  nnoremap [Git]f :<C-u>GitCatFile %<CR>
  nnoremap [Git]v :<C-u>GitVimDiffMerge<CR>
  nnoremap [Git]b zR:<C-u>GitBlame<CR>
endif
" }}}

"---------------------------------------------------------------------------
" for nathanaelkane/vim-indent-guides {{{2
if s:bundled('vim-indent-guides')
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_guide_size = 1
endif
" }}}

"---------------------------------------------------------------------------
" for t9md/vim-quickhl {{{2
if s:bundled('vim-quickhl')
  nmap <Leader>hm <Plug>(quickhl-toggle)
  xmap <Leader>hm <Plug>(quickhl-toggle)
  nmap <Leader>hM <Plug>(quickhl-reset)
  xmap <Leader>hM <Plug>(quickhl-reset)
  nmap <Leader>hh <Plug>(quickhl-match)
  "let g:quickhl_keywords = [
  "    \ "keyword",
  "    \ ]
endif
" }}}

"---------------------------------------------------------------------------
" for t9md/vim-surround_custom_mapping {{{2
let g:surround_custom_mapping = {}
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
" for t9md/vim-unite-ack {{{2
if has('mac') && s:bundled('unite.vim') && s:bundled('vim-unite-ack')
    let g:unite_source_ack_command = 'ack --no-heading --no-color -a'
    let g:unite_source_ack_enable_highlight = 1
endif
" }}}

"---------------------------------------------------------------------------
" for scrooloose/nerdtree {{{2
if s:bundled('nerdtree')
  nnoremap <Space>n
    \ :<C-u>NeoBundleSource nerdtree<CR>
    \:<C-u>NERDTreeToggle<CR>
endif
" }}}

"---------------------------------------------------------------------------
" for thinca/vim-ambicmd {{{2
if s:bundled('vim-ambicmd')
  cnoremap <expr> <Space>   ambicmd#expand("\<Space>")
  cnoremap <expr> <S-Space> ambicmd#expand("\<Space>")
  cnoremap <expr> <CR>      ambicmd#expand("\<CR>")

  function! g:ambicmd_my_custom_rule(cmd)
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
  let g:ambicmd#build_rule = 'g:ambicmd_my_custom_rule'
endif
" }}}

"---------------------------------------------------------------------------
" for thinca/vim-quickrun {{{2
if s:bundled('vim-quickrun')
  let g:quickrun_config = {}
  let g:quickrun_config = { '*' : {'shebang' : '0' }}
  let g:quickrun_config._ = {'runmode': "async:remote:vimproc", 'split': 'below 10sp'}
  let g:quickrun_config._.runmode = 'async:vimproc'

  let g:quickrun_config['markdown'] = {
    \ 'type'      : 'markdown/pandoc',
    \ 'outputter' : 'browser',
    \ 'cmdopt'    : '-s'
    \ }

  let g:quickrun_config.io = {
    \   'command': 'io',
    \ }
  let g:quickrun_config.scala = {
    \   'command': 'scala',
    \ }

  nnoremap <silent> <Space>r
    \ :<C-u>NeoBundleSource vim-quickrun<CR>
    \:<C-u>QuickRun -mode n<CR>
  vnoremap <silent> <Space>r
    \ :<C-u>NeoBundleSource vim-quickrun<CR>
    \gv
    \:QuickRun -mode v<CR>
  nnoremap <Space>R
    \ :<C-u>NeoBundleSource vim-quickrun<CR>
    \:<C-u>QuickRun -args ""<Left>
  nnoremap <S-Space>R
    \ :<C-u>NeoBundleSource vim-quickrun<CR>
    \:<C-u>QuickRun -args ""<Left>
endif
" }}}

"---------------------------------------------------------------------------
" for thinca/vim-ref {{{2
if s:bundled('vim-ref')
  "nnoremap <silent> <Space>a :<C-u>call ref#jump('normal', 'alc')<CR>
  "vnoremap <silent> <Space>a :<C-u>call ref#jump('visual', 'alc')<CR>

  let g:ref_source_webdict_sites = {
    \   'goo': {
    \     'url': 'http://dictionary.goo.ne.jp/srch/all/%s/m0u/',
    \     'keyword_encoding': 'utf-8',
    \     'cache': 1,
    \   }
    \ }
  let g:ref_source_webdict_sites.default = 'goo'
endif
" }}}

"---------------------------------------------------------------------------
" for thinca/vim-visualstar {{{2
if s:bundled('vim-visualstar')
  map * <Plug>(visualstar-*)N
  map # <Plug>(visualstar-#)N
  map <Space>/ <Plug>(visualstar-*)N
  map <Space>? <Plug>(visualstar-#)N
endif
" }}}

"---------------------------------------------------------------------------
" for tpope/vim-fugitive {{{2
if s:bundled('vim-fugitive')
  nnoremap [Git]     <Nop>
  nmap     <Space>g  [Git]

  nnoremap [Git]d :<C-u>Gdiff --cached<CR>
  nnoremap [Git]D :<C-u>Gdiff<CR>
  nnoremap [Git]s :<C-u>Gstatus<CR>
  nnoremap [Git]l :<C-u>Glog<CR>
  nnoremap [Git]a :<C-u>Gwrite<CR>
  nnoremap [Git]A :<C-u>Gwrite <cfile><CR>
  nnoremap [Git]c :<C-u>Gcommit<CR>
  nnoremap [Git]C :<C-u>Git commit --amend<CR>
  nnoremap [Git]b :<C-u>Gblame<CR>
  nnoremap [Git]p :<C-u>Git push<Space>
endif
" }}}

"---------------------------------------------------------------------------
" for tyru/open-browser.vim {{{2
if s:bundled('open-browser.vim')
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
  nmap gx
    \ :<C-u>NeoBundleSource open-browser.vim<CR>
    \:<C-u>OpenBroserSmartSearch <C-r><C-w><CR>
  vmap gx <Plug>(openbrowser-smart-search)
endif
" }}}

"---------------------------------------------------------------------------
" for tyru/operator-html-escape.vim {{{2
if s:bundled('operator-user') && s:bundled('operator-html-escape.vim')
  nmap <Leader>h  <Plug>(operator-html-escape)
  nmap <Leader>u  <Plug>(operator-html-unescape)
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
if s:bundled('vim-easytags')
  if has('win32')
    let g:easytags_cmd = ''
  endif
endif
" }}}

"---------------------------------------------------------------------------
" for deris/columnjump {{{2
if s:bundled('columnjump')
  map <c-k> <Plug>(columnjump-backward)
  map <c-j> <Plug>(columnjump-forward)
endif
" }}}

"---------------------------------------------------------------------------
" for deris/parajump {{{2
if s:bundled('parajump')
  map { <Plug>(parajump-backward)
  map } <Plug>(parajump-forward)
endif
" }}}

"---------------------------------------------------------------------------
" for deris/vim-loadafterft {{{2
if s:bundled('vim-loadafterft')
  let g:execcmd_after_ftplugin = {
    \    '_': [
    \        'setlocal fo-=t fo-=c fo-=r fo-=o',
    \    ],
    \}
  let g:execcmd_after_indent = {
    \    '_': [
    \        'setlocal fo-=t fo-=c fo-=r fo-=o',
    \    ],
    \}
endif
" }}}

"---------------------------------------------------------------------------
" for FuzzyFinder {{{2
"let g:fuf_modesDisable     = []
"let g:fuf_mrufile_exclude  = '\v\.DS_Store|\.git|\.swp|\.svn'
"let g:fuf_mrufile_maxItem  = 500
"let g:fuf_mrucmd_maxItem   = 500
"let g:fuf_enumeratingLimit = 20
"let g:fuf_file_exclude     = '\v\.DS_Store|\.git|\.swp|\.svn'

"nnoremap [fuf]    <Nop>
"nmap     <Space>f [fuf]

"nnoremap [fuf]b  :<C-u>FufBuffer<CR>
"nnoremap [fuf]f  :<C-u>FufFile<CR>
"nnoremap [fuf]d  :<C-u>FufDir<CR>
"nnoremap [fuf]t  :<C-u>FufTag<CR>
"nnoremap [fuf]m  :<C-u>FufMruFile<CR>
"nnoremap [fuf]c  :<C-u>FufMruCmd<CR>
" }}}

"---------------------------------------------------------------------------
" for errormarker.vim {{{2
let errormarker_disablemappings = 1
" }}}

"---------------------------------------------------------------------------
" for grep.vim {{{2
if s:bundled('grep.vim')
  if has('win32')
    let Grep_Path             = 'C:\usr\local\bin\grep.exe'
    let Fgrep_Path            = 'C:\usr\local\bin\grep.exe -F'
    let Egrep_Path            = 'C:\usr\local\bin\grep.exe -E'
    let Grep_Find_Path        = 'C:\usr\local\bin\find.exe'
    let Grep_Xargs_Path       = 'C:\usr\local\bin\xargs.exe'
    let Grep_Shell_Quote_Char = '"'
  endif
  let Grep_Skip_Dirs = '.svn .git'
  let Grep_Skip_Files = '*.bak *~'
endif
" }}}

"---------------------------------------------------------------------------
" for smartchr {{{2
if s:bundled('smartchr')
  inoremap <expr> =  smartchr#loop('=', '==', ' = ', ' == ')
  inoremap <expr> +  smartchr#loop('+', '++', ' + ', ' += ')
  inoremap <expr> -  smartchr#loop('-', '--', ' - ', ' -= ')
  inoremap <expr> !  smartchr#loop('!', ' != ')
  inoremap <expr> .  smartchr#loop('.', ' . ')
  inoremap <expr> {  smartchr#loop('{}', '{')
  inoremap <expr> [  smartchr#loop('[]', '[')
  inoremap <expr> (  smartchr#loop('()', '(')
  inoremap <expr> "  smartchr#loop('""', '"')
  inoremap <expr> '  smartchr#loop("''", "'")
  inoremap <expr> `  smartchr#loop('``', '`')

  " This is enabled while user inputs Ex commands, not search
  " patterns, etc.
  cnoremap <expr> \  smartchr#loop('~/', '\', {'ctype': ':'})
endif
" }}}

"---------------------------------------------------------------------------
" for taglist.vim {{{2
if s:bundled('taglist.vim')
  if has('mac')
    let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"    "ctagsのパス
  elseif has('win32')
    let Tlist_Ctags_Cmd = "c:/usr/local/bin/ctags.exe"    "ctagsのパス
  endif
  "let Tlist_Show_One_File = 1               "現在編集中のソースのタグしか表示しない
  let Tlist_Exit_OnlyWindow = 1             "taglistのウィンドーが最後のウィンドーならばVimを閉じる
  let Tlist_Use_Right_Window = 1            "右側でtaglistのウィンドーを表示
  nnoremap <silent> <C-l>
    \ :<C-u>NeoBundleSource taglist.vim<CR>
    \:<C-u>TlistToggle<CR>
endif
" }}}

"---------------------------------------------------------------------------
" for vim-textobj-function {{{2
if s:bundled('vim-textobj-user') && s:bundled('vim-textobj-function')
  omap iF <Plug>(textobj-function-i)
  omap aF <Plug>(textobj-function-a)
  vmap iF <Plug>(textobj-function-i)
  vmap aF <Plug>(textobj-function-a)
endif
" }}}

"---------------------------------------------------------------------------
" for vcscommand.vim {{{2
if s:bundled('vcscommand.vim')
"let VCSCommandMapPrefix = '<Space>s'
endif
" }}}


" }}}

"---------------------------------------------------------------------------
" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
" }}}

