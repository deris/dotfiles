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

  return stridx(&runtimepath, a:bundle) > -1
    \ && !empty(globpath($VIMBUNDLE.'/'.a:bundle, '*'))
endfunction

"---------------------------------------------------------------------------
" Vundle {{{2
set nocompatible
filetype off

if has('vim_starting')
  set rtp+=$VIMBUNDLE/vundle/
endif

if s:bundled('vundle')
  call vundle#rc($VIMBUNDLE)

  " original repos on github
  Bundle 'gmarik/vundle'
  "Bundle 'Lokaltog/vim-easymotion'
  Bundle 'Lokaltog/vim-powerline'
  "Bundle 'Shougo/neobundle.vim'
  Bundle 'Shougo/neocomplcache'
  Bundle 'Shougo/neocomplcache-snippets-complete'
  Bundle 'Shougo/unite.vim'
  Bundle 'Shougo/vimfiler'
  Bundle 'Shougo/vimproc'
  "Bundle 'Shougo/vimshell'
  "Bundle 'Townk/vim-autoclose'
  "Bundle 'benmills/vimux'
  Bundle 'bitc/vim-bad-whitespace'
  "Bundle 'chrisbra/SudoEdit.vim'
  "Bundle 'c9s/perlomni.vim'
  "Bundle 'derekwyatt/vim-scala'
  Bundle 'emonkak/vim-operator-comment'
  Bundle 'emonkak/vim-operator-sort'
  "Bundle 'godlygeek/tabular'
  Bundle 'h1mesuke/vim-alignta'
  "Bundle 'h1mesuke/vim-benchmark'
  "Bundle 'h1mesuke/textobj-wiw'
  Bundle 'h1mesuke/unite-outline'
  "Bundle 'hekyou/vim-rectinsert'
  "Bundle 'fholgado/minibufexpl.vim'
  "Bundle 'fuenor/vim-statusline' "手動で配置の必要あり
  "Bundle 'fuenor/qfixhowm'
  "Bundle 'jceb/vim-orgmode'
  "Bundle 'kana/vim-advice'
  "Bundle 'kana/vim-altr'
  "Bundle 'kana/vim-arpeggio'
  Bundle 'kana/vim-fakeclip'
  "Bundle 'kana/vim-gf-user'
  "Bundle 'kana/vim-grex'
  "Bundle 'kana/vim-metarw'
  Bundle 'kana/vim-narrow'
  Bundle 'kana/vim-operator-user'
  Bundle 'kana/vim-operator-replace'
  Bundle 'kana/vim-scratch'
  "Bundle 'kana/vim-smartinput'
  Bundle 'kana/vim-smartword'
  "Bundle 'kana/vim-submode'
  Bundle 'kana/vim-textobj-user'
  Bundle 'kana/vim-textobj-entire'
  Bundle 'kana/vim-textobj-function'
  Bundle 'kana/vim-textobj-indent'
  Bundle 'kana/vim-textobj-jabraces'
  Bundle 'kana/vim-textobj-lastpat'
  Bundle 'kana/vim-textobj-line'
  Bundle 'kana/vim-textobj-syntax'
  Bundle 'kana/vim-vspec'
  Bundle 'kien/ctrlp.vim'
  "Bundle 'vexxor/kwbd.vim'
  "Bundle 'majutsushi/tagbar'
  "Bundle 'mattn/asyncgrep-vim'
  "Bundle 'mattn/benchvimrc-vim'
  "Bundle 'mattn/gist-vim'
  Bundle 'mattn/learn-vimscript'
  "Bundle 'mattn/sonictemplate-vim'
  "Bundle 'mattn/vdbi-vim'
  Bundle 'mattn/vim-textobj-url'
  Bundle 'mattn/webapi-vim'
  Bundle 'mattn/zencoding-vim'
  "Bundle 'mileszs/ack.vim'
  "Bundle 'motemen/git-vim'
  "Bundle 'motemen/hatena-vim'
  "Bundle 'msanders/cocoa.vim'
  "Bundle 'msanders/snipmate.vim'
  Bundle 'nathanaelkane/vim-indent-guides'
  "Bundle 'othree/eregex.vim'
  "Bundle 'plasticboy/vim-markdown'
  "Bundle 'reinh/vim-makegreen'
  Bundle 'rphillips/vim-zoomwin'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'scrooloose/nerdtree'
  "Bundle 'scrooloose/syntastic'
  Bundle 'sgur/vim-textobj-parameter'
  "Bundle 'sgur/unite-everything'
  "Bundle 'sjl/clam.vim'
  Bundle 'sjl/gundo.vim'
  "Bundle 'sjl/splice.vim'
  "Bundle 'sjl/vitality.vim'
  Bundle 'skammer/vim-css-color'
  "Bundle 't9md/vim-quickhl'
  Bundle 't9md/vim-surround_custom_mapping'
  "Bundle 't9md/vim-textmanip'
  "Bundle 't9md/vim-underlinetag'
  "Bundle 't9md/vim-unite-ack'
  "Bundle 'taku-o/vim-toggle'
  "Bundle 'tejr/nextag'
  Bundle 'thinca/vim-ambicmd'
  Bundle 'thinca/vim-fontzoom'
  Bundle 'thinca/vim-openbuf'
  Bundle 'thinca/vim-poslist'
  "Bundle 'thinca/vim-qfreplace'
  Bundle 'thinca/vim-quickrun'
  Bundle 'thinca/vim-ref'
  Bundle 'thinca/vim-scouter'
  Bundle 'thinca/vim-singleton'
  Bundle 'thinca/vim-template'
  Bundle 'thinca/vim-textobj-comment'
  Bundle 'thinca/vim-textobj-between'
  Bundle 'thinca/vim-visualstar'
  "Bundle 'tpope/vim-eunuch'
  Bundle 'tpope/vim-fugitive'
  "Bundle 'tpope/vim-markdown'
  "Bundle 'tpope/vim-rails'
  Bundle 'tpope/vim-repeat'
  Bundle 'tpope/vim-surround'
  "Bundle 'tpope/vim-unimpaired'
  "Bundle 'tsukkee/unite-help'
  Bundle 'tsukkee/unite-tag'
  "Bundle 'tyru/caw.vim'
  "Bundle 'tyru/current-func-info.vim'
  "Bundle 'tyru/operator-camelize.vim'
  Bundle 'tyru/open-browser.vim'
  Bundle 'tyru/operator-html-escape.vim'
  Bundle 'tyru/operator-reverse.vim'
  Bundle 'tyru/operator-star.vim'
  Bundle 'tyru/restart.vim'
  "Bundle 'tyru/vim-altercmd'
  "Bundle 'ujihisa/shadow.vim'
  "Bundle 'ujihisa/unite-colorscheme'
  "Bundle 'ujihisa/unite-locate'
  Bundle 'vim-jp/vital.vim'
  Bundle 'vimtaku/vim-textobj-sigil'
  "Bundle 'vimtaku/vim-textobj-keyvalue'
  "Bundle 'xolox/vim-easytags'
  "Bundle 'xolox/vim-notes'
  Bundle 'xolox/vim-session'
  "Bundle 'ynkdir/vim-remote'
  "Bundle 'yuratomo/w3m.vim'
  Bundle 'deris/columnjump'
  Bundle 'deris/parajump'
  Bundle 'deris/vim-textobj-enclosedsyntax'

  " vim-scripts repos
  "Bundle 'Align'
  "Bundle 'CD.vim'
  "Bundle 'Conque-Shell'
  Bundle 'DirDiff.vim'
  Bundle 'DrawIt'
  "Bundle 'FuzzyFinder'
  "Bundle 'JSON.vim'
  Bundle 'L9'
  "Bundle 'Mark'
  "Bundle 'QuickBuf'
  "Bundle 'QFixHowm'
  Bundle 'Source-Explorer-srcexpl.vim'
  Bundle 'UnconditionalPaste'
  "Bundle 'YankRing.vim' "あまり使わないのとkeymap設定で悪さをするので削除
  "Bundle 'a.vim'
  "Bundle 'bufexplorer.zip'
  "Bundle 'closetag.vim'
  Bundle 'errormarker.vim'
  Bundle 'grep.vim'
  Bundle 'matchit.zip'
  Bundle 'perl-support.vim'
  Bundle 'project.tar.gz'
  "Bundle 'qtmplsel.vim'
  "Bundle 'rails.vim'
  Bundle 'renamer.vim'
  "Bundle 'smartchr'
  "Bundle 'statusline.vim'
  Bundle 'taglist.vim'
  Bundle 'trinity.vim'
  "Bundle 'vcscommand.vim'
  Bundle 'vimwiki'

  " color scheme
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'deris/molokai'
  Bundle 'deris/vim-wombat'
  Bundle 'jnurmine/Zenburn'
  Bundle 'newspaper.vim'

  " 日本語help
  Bundle 'vim-jp/vimdoc-ja'

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
syntax on
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
"自動整形の実行方法を決めるフラグ(tcは自動折り返し。oはコメント文字自動挿入)
set formatoptions-=tco
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

" vimdiff時のハイライト
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7

" macの場合の設定
if has('mac')
  noremap ¥ \
  noremap \ ¥
  " grep ack
  set grepprg=ack\ -a

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
  autocmd BufEnter * lcd %:p:h
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

"noremap  <C-j> <Esc>
"noremap! <C-j> <Esc>

inoremap jj <Esc>
inoremap jk <Esc>

" jump
"nnoremap <Space>j 5j
"nnoremap <Space>k 5k
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" *,#での単語検索時、次に単語に移動しない
nnoremap * *<C-o>
nnoremap # #<C-o>

" Jump to matching pairs easily, with Tab
noremap <Tab> %

" vimrc編集
nnoremap <Space>.   :<C-u>tab drop $MYVIMRC<CR>
nnoremap <Space>g.  :<C-u>tab drop $MYGVIMRC<Enter>
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

";と:を入れ替え
nnoremap ; :
nnoremap q; q:
nnoremap : ;
nnoremap @; @:
nnoremap @: @;
nnoremap ,; @:
nnoremap ,. @:
vnoremap ; :
vnoremap q; q:
vnoremap : ;
vnoremap @; @:
vnoremap @: @;

" モーション時にwをiwとする（よく使うので）
onoremap w iw
onoremap W iW

" マッチするものがないパーレンまで移動
onoremap ) i)
onoremap ( a(
vnoremap ) i)
vnoremap ( a(

" よく使うものはtを省略できるようkeymap
onoremap ; t;
onoremap <Space> t<Space>

" ' と `を入れ替え
nnoremap '  `
nnoremap `  '

" text-objectを割り当て
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

" モーション時にqで記号まで飛ぶ
"onoremap q /["',.{}()[\]<>]<CR>:nohlsearch<CR>
onoremap <silent> q
  \      :<C-u>for i in range(v:count1)
  \ <Bar>   call search('.\&\(\k\<Bar>\_s\)\@!', 'W')
  \ <Bar> endfor<CR>

" exコマンド
nnoremap <Space>w :<C-u>w<CR>
nnoremap <Space>q :<C-u>q<CR>
nnoremap <Space>Q :<C-u>q!<CR>
nnoremap <S-Space>Q :<C-u>q!<CR>
"nnoremap <Space>m :<C-u>marks<CR>
"nnoremap <Space>g :<C-u>registers<CR>
"nnoremap <Space>b :<C-u>ls<CR>

" 仮想置換モード
nnoremap R gR

" 危険なので無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" <Space>数字で記号入力
noremap <Space>1 !
noremap <Space>2 @
noremap <Space>3 #
noremap <Space>4 $
noremap <Space>5 %
noremap <Space>6 ^
noremap <Space>7 &
noremap <Space>8 *
noremap <Space>9 (
noremap <Space>0 )

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
" <C-q>はUNIXのTerminalでバッティングするのでコメントアウト
"cnoremap <C-q> <C-f>a
cnoremap <C-v> <C-f>a

" カーソル下のlineを挿入
cnoremap <expr> <C-r><C-l>   getline(".")

" command modeでの自動エスケープ
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'
cnoremap <C-/>  /
cnoremap <C-?>  ?

" 置換の自動入力
"cnoremap <expr> s/ (getcmdtype()==':' ? "s///g<Left><Left><Left>" : "s/")
"cnoremap <expr> %s (getcmdtype()==':' ? "%s///g<Left><Left><Left>" : "%s")
" <C-s>はUNIXのTerminalでバッティングするのでコメントアウト
"cnoremap <expr> <C-s> (getcmdtype()==':' ? "%s///g<Left><Left><Left>" : "%s")
nnoremap <Space>S   :<C-u>%s///g<Left><Left><Left>
nnoremap <S-Space>S :<C-u>%s///g<Left><Left><Left>
vnoremap <Space>S   :s///g<Left><Left><Left>
vnoremap <S-Space>S :s///g<Left><Left><Left>

"nnoremap gs  :<C-u>%s///g<Left><Left><Left>

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
"inoremap ;        <Enter>
"inoremap <Enter>  ;

" 括弧など自動で閉じる
"inoremap {  {}<Left>
"inoremap [  []<Left>
"inoremap (  ()<Left>
"inoremap "  ""<Left>
"inoremap '  ''<Left>
"inoremap <  <><Left>

" ハイライトを消す
noremap <silent> <Esc><Esc> <Esc>:<C-u>nohlsearch<CR>
noremap <silent> <C-c><C-c> <Esc>:<C-u>nohlsearch<CR>
"nnoremap <silent> <Space>/ :<C-u>nohlsearch<CR>

" * はASCIIとJISでキー配置が異なるので共通で使えるkeymapを設定
nnoremap <silent> <Space>/  *N
nnoremap <silent> <Space>?  #N

"nnoremap <silent> <Space>na :<C-u>set number<CR>
"nnoremap <silent> <Space>nr :<C-u>set relativenumber<CR>

" 仮想編集の変更
nnoremap <Space>va  :<C-u>setlocal virtualedit=all<CR>
nnoremap <Space>vb  :<C-u>setlocal virtualedit=block<CR>
nnoremap <Space>vv  :let &virtualedit=(&ve == "all" ? "block" : "all")<CR>:setlocal virtualedit<CR>

" very magic（正規表現をエスケープしなくてよくなる）
noremap /   /\v
noremap ?   ?\v

" buffer
"nnoremap <C-p> :<C-u>bprevious<CR>
"nnoremap <C-n> :<C-u>bnext<CR>

" Tabでウィンドウ移動
"nnoremap <silent> <Tab>   <C-w>w
"nnoremap <silent> <S-Tab> <C-w>W

" カーソル下のウィンドウを編集（数字が付いていればその行へ）
noremap gf gF

" sはoperator-replaceに割り当てる
"nnoremap <C-s>  s
"nnoremap s      <C-s>

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

nnoremap <silent> gr :<C-u>tabprevious<CR>

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

" キーがバッティング
"nnoremap <Space>cm :<c-u>colorscheme molokai<CR>
"nnoremap <Space>cw :<c-u>colorscheme wombat<CR>

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

  nnoremap <silent> <Space>es :<C-u>NeoComplCacheEditSnippets 

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

  nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
  nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
  nnoremap <silent> [unite]r  :<C-u>Unite register<CR>
  nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
  nnoremap <silent> [unite]m  :<C-u>Unite file_mru<CR>
  nnoremap <silent> [unite]u  :<C-u>Unite file_mru<CR>
  nnoremap <silent> [unite]d  :<C-u>Unite directory_mru<CR>
  nnoremap <silent> [unite]f  :<C-u>Unite source<CR>

  " Start insert.
  "let g:unite_enable_start_insert = 1

  autocmd FileType unite call s:unite_my_settings()
  function! s:unite_my_settings()"{{{
    " Overwrite settings.

    nmap <buffer> <ESC>  <Plug>(unite_exit)
    nmap <buffer> <C-c>  <Plug>(unite_exit)
    imap <buffer> jj     <Plug>(unite_insert_leave)
    imap <buffer> jk     <Plug>(unite_insert_leave)
    "imap <buffer> <C-w>  <Plug>(unite_delete_backward_path)

    " <C-l>: manual neocomplcache completion.
    inoremap <buffer> <C-l>  <C-x><C-u><C-p><Down>
  endfunction"}}}

  let g:unite_source_file_mru_limit = 200
  let g:unite_cursor_line_highlight = 'TabLineSel'
  let g:unite_abbr_highlight = 'TabLine'

  " For optimize.
  let g:unite_source_file_mru_filename_format = ''

  " For unite-session.
  " Save session automatically.
  "let g:unite_source_session_enable_auto_save = 1
  " Load session automatically.
  "autocmd VimEnter * UniteSessionLoad

  " For ack.
  if executable('ack')
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
    let g:unite_source_grep_recursive_opt = ''
  endif
endif
" }}}

"---------------------------------------------------------------------------
" for Shougo/vimfiler {{{2
" File explorer like behavior.
if s:bundled('vimfiler')
  nnoremap [vimfiler]  <Nop>
  nmap     <Space>f  [vimfiler]

  nnoremap [vimfiler]  :<C-u>VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle<CR>

  let g:vimfiler_as_default_explorer = 1

  " Enable file operation commands.
  "let g:vimfiler_safe_mode_by_default = 0

  " Like Textmate icons.
  "let g:vimfiler_tree_leaf_icon = ' '
  "let g:vimfiler_tree_opened_icon = '▾'
  "let g:vimfiler_tree_closed_icon = '▸'
  "let g:vimfiler_file_icon = '-'
  "let g:vimfiler_marked_file_icon = '*'

  " Use trashbox.
  " Windows only and require latest vimproc.
  "let g:unite_kind_file_use_trashbox = 1

  let g:unite_kind_openable_lcd_command = 1
endif
" }}}

"---------------------------------------------------------------------------
" for h1mesuke/vim-alignta {{{2
if s:bundled('vim-alignta')
  nnoremap <Space>as :<C-u>Alignta =<CR>
  vnoremap <Space>as :Alignta =<CR>
  nnoremap <Space>ah :<C-u>Alignta =><CR>
  vnoremap <Space>ah :Alignta =><CR>

  "augroup perllang
    "autocmd filetype perl vnoremap <space>ah  :<c-u>alignctrl l-l<cr>gv:align =><cr>
  "augroup end
endif
" }}}

"---------------------------------------------------------------------------
" for kana/vim-operator-replace {{{2
if s:bundled('vim-operator-user') && s:bundled('vim-operator-replace')
  map s <Plug>(operator-replace)
  map S <Plug>(operator-replace)$
  " clipboardからoperator-replace
  map <Space>s "*<Plug>(operator-replace)
endif
" }}}

"---------------------------------------------------------------------------
" for kana/vim-scratch {{{2
if s:bundled('vim-scratch')
  function! ScratchToggle()
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

  command! -nargs=0 ScratchToggle call ScratchToggle()
  nnoremap <silent> <Leader><Tab> :<C-u>ScratchToggle<CR>
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

  nnoremap [ctrlp]b  :<C-u>CtrlPBuffer<CR>
  nnoremap [ctrlp]m  :<C-u>CtrlPMRUFiles<CR>
  nnoremap [ctrlp]u  :<C-u>CtrlPMRUFiles<CR>
  nnoremap [ctrlp]f  :<C-u>CtrlPCurFile<CR>
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
"let g:git_no_map_default = 1
"let g:git_command_edit = 'rightbelow vnew'

"nnoremap [Git]       <Nop>
"nmap     <Space>g  [Git]

"nnoremap [Git]d :<C-u>GitDiff --cached<CR>
"nnoremap [Git]D :<C-u>GitDiff<CR>
"nnoremap [Git]s :<C-u>GitStatus<CR>
"nnoremap [Git]l :<C-u>GitLog<CR>
"nnoremap [Git]L :<C-u>GitLog -u \| head -10000<CR>
"nnoremap [Git]a :<C-u>GitAdd<CR>
"nnoremap [Git]A :<C-u>GitAdd <cfile><CR>
"nnoremap [Git]c :<C-u>GitCommit<CR>
"nnoremap [Git]C :<C-u>GitCommit --amend<CR>
"nnoremap [Git]p :<C-u>Git push
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
if s:bundled('vim-surround_custom_mapping')
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
endif
" }}}

"---------------------------------------------------------------------------
" for scrooloose/nerdtree {{{2
if s:bundled('nerdtree')
  "nnoremap <Space>n :<C-u>NERDTreeToggle<CR>
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
  nmap gx <Plug>(openbrowser-smart-search)
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

  nnoremap <silent> <Space>r :QuickRun -mode n<CR>
  vnoremap <silent> <Space>r :QuickRun -mode v<CR>
  nnoremap <Space>R :QuickRun -args ""<Left>
  nnoremap <S-Space>R :QuickRun -args ""<Left>
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

  nnoremap <Space>eg :<c-u>Egrep<CR>
  nnoremap <Space>eb :<c-u>Bgrep<CR>
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
  "let Tlist_Use_Right_Window = 1            "右側でtaglistのウィンドーを表示
  "nnoremap <silent> <Space>l :<C-u>TlistToggle<CR>
endif
" }}}

"---------------------------------------------------------------------------
" for trinity.vim {{{2
if s:bundled('trinity.vim')
  nnoremap <silent> <Space>n :<C-u>TrinityToggleNERDTree<CR>
  nnoremap <silent> <Space>l :<C-u>TrinityToggleTagList<CR>
  " keymapを奪われるので、Source-Explorer-srcexpl.vimは使わない。

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

