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

"---------------------------------------------------------------------------
" Vundle {{{2
set nocompatible
filetype off
set rtp+=$DOTVIM/bundle/vundle/
call vundle#rc('$DOTVIM/bundle')
Bundle 'gmarik/vundle'

" original repos on github
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
"Bundle 'chrisbra/SudoEdit.vim'
"Bundle 'h1mesuke/vim-alignta'
"Bundle 'h1mesuke/vim-benchmark'
"Bundle 'h1mesuke/textobj-wiw'
Bundle 'h1mesuke/unite-outline'
"Bundle 'fholgado/minibufexpl.vim'
"Bundle 'fuenor/vim-statusline' "手動で配置の必要あり
"Bundle 'kana/arpeggio'
"Bundle 'kana/vim-grex'
"Bundle 'kana/vim-metarw'
Bundle 'kana/vim-operator-user'
Bundle 'kana/vim-operator-replace'
Bundle 'kana/vim-smartword'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-indent'
Bundle 'kana/vim-textobj-jabraces'
"Bundle 'kana/vim-textobj-lastpat'
"Bundle 'kana/vim-textobj-syntax'
Bundle 'kien/ctrlp.vim'
"Bundle 'vexxor/kwbd.vim'
Bundle 'mattn/learn-vimscript'
"Bundle 'mattn/webapi-vim'
Bundle 'mattn/zencoding-vim'
"Bundle 'motemen/git-vim'
"Bundle 'motemen/hatena-vim'
"Bundle 'msanders/cocoa.vim'
"Bundle 'msanders/snipmate.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'rphillips/vim-zoomwin'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/syntastic'
Bundle 'sgur/textobj-parameter'
"Bundle 'sgur/unite-everything'
Bundle 't9md/vim-quickhl'
"Bundle 't9md/vim-textmanip'
"Bundle 't9md/vim-underlinetag'
"Bundle 't9md/vim-unite-ack'
"Bundle 'taku-o/vim-toggle'
Bundle 'thinca/vim-ambicmd'
Bundle 'thinca/vim-fontzoom'
Bundle 'thinca/vim-poslist'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-scouter'
Bundle 'thinca/vim-textobj-comment'
Bundle 'thinca/vim-textobj-between'
Bundle 'thinca/vim-visualstar'
"Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-markdown'
"Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-unimpaired'
Bundle 'tsukkee/unite-help'
Bundle 'tsukkee/unite-tag'
"Bundle 'tyru/caw.vim'
Bundle 'tyru/current-func-info.vim'
"Bundle 'tyru/operator-camelize.vim'
Bundle 'tyru/open-browser.vim'
"Bundle 'tyru/operator-html-escape.vim'
Bundle 'tyru/operator-star.vim'
Bundle 'tyru/restart.vim'
"Bundle 'tyru/vim-altercmd'
"Bundle 'ujihisa/unite-colorscheme'
"Bundle 'ujihisa/unite-locate'
"Bundle 'xolox/vim-easytags'
Bundle 'deris/columnjump'
Bundle 'deris/parajump'

" vim-scripts repos
"Bundle 'Align'
"Bundle 'CD.vim'
"Bundle 'Conque-Shell'
Bundle 'DrawIt'
"Bundle 'FuzzyFinder'
Bundle 'L9'
"Bundle 'Mark'
"Bundle 'QuickBuf'
Bundle 'Source-Explorer-srcexpl.vim'
"Bundle 'YankRing.vim' "あまり使わないのとkeymap設定で悪さをするので削除
"Bundle 'a.vim'
"Bundle 'bufexplorer.zip'
Bundle 'errormarker.vim'
Bundle 'grep.vim'
Bundle 'matchit.zip'
Bundle 'project.tar.gz'
"Bundle 'rails.vim'
"Bundle 'renamer.vim'
"Bundle 'smartchr'
"Bundle 'statusline.vim'
Bundle 'taglist.vim'
Bundle 'textobj-function'
Bundle 'trinity.vim'
"Bundle 'vcscommand.vim'
Bundle 'vimwiki'
"Bundle 'ZoomWin'

" color scheme
Bundle 'cschlueter/vim-wombat'
Bundle 'tomasr/molokai'
Bundle 'jnurmine/Zenburn'
Bundle 'newspaper.vim'

" 日本語help
Bundle 'vim-jp/vimdoc-ja'


filetype plugin indent on

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
set nocompatible
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
" テキスト挿入中の自動折り返しを日本語に対応させる
"set formatoptions+=mM
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
"自動整形の実行方法を決めるフラグ(tcは自動折り返し）
set formatoptions-=tc
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

" 全角スペースを表示
scriptencoding utf-8

augroup hilightIdegraphicSpace
  autocmd!
  autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

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
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
colorscheme desert " (Windows用gvim使用時はgvimrcを編集すること)
" 画面上の行数
set lines=50
" タブを常に表示する
set showtabline=2
" statusline
" vim-powerlineを使用するためコメントアウト
"set statusline=%t\ %y\ [%{&fenc}][%{&ff}]\ %m%r%w%h%=%l/%L\ %v\ %P
" virtualedit
set virtualedit=block
" バックアップを無効
set nobackup
" バックアップファイルの生成ディレクトリ
set backupdir=$DOTVIM/backup
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

" set tags
"set autochdir
set tags=./tags,../tags,./*/tags,../../tags,../../../tags,../../../../tags

" 文字コードの自動判定
let &termencoding = &encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" macの場合の設定
if has('mac')
  noremap ¥ \
  noremap \ ¥
  " grep ack
  set grepprg=ack\ -a

  if has('vim_starting')
    let $PATH=$HOME."/perl5/perlbrew/bin:".$HOME."/perl5/perlbrew/perls/perl-5.10.1/bin:".$PATH
  end
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

let plugin_cmdex_disable = 1

" }}}

"---------------------------------------------------------------------------
" key map:{{{2

" leaderを変更
let mapleader = ","
let maplocalleader = ","

" 汎用プレフィックス
noremap [General] <Nop>
nmap <Space> [General]

" Escのkeymap
noremap  <C-[> <C-c>
noremap! <C-[> <C-c>
noremap  <C-c> <C-[>
noremap! <C-c> <C-[>

"noremap  <C-j> <Esc>
"noremap! <C-j> <Esc>

inoremap jj <Esc>
"inoremap jk <Esc>

" jump
"nnoremap [General]j 5j
"nnoremap [General]k 5k
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" *,#での単語検索時、次に単語に移動しない
nnoremap * *N
nnoremap # #N

" Jump to matching pairs easily, with Tab
noremap <Tab> %

" vimrc編集
nnoremap [General].   :<C-u>edit $MYVIMRC<CR>
nnoremap [General]s.  :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif<CR>
" helpショートカット
nnoremap <C-h>      :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>
" 最後に変更されたテキストを選択する
"nnoremap gc         `[v`]
"vnoremap gc         :<C-u>normal gc<CR>
"onoremap gc         :<C-u>normal gc<CR>

" Delete the content of the current line (not the line itself).
nnoremap dl ^d$
nnoremap cl ^c$

" Use more logical mapping (see :h Y)
nnoremap Y y$
" クリップボードからペースト
nnoremap [General]p "*p
vnoremap [General]p "*p
nnoremap [General]P "*P
vnoremap [General]P "*P
" クリップボードにヤンク
nnoremap [General]y "*y
nnoremap [General]Y "*y$
vnoremap [General]y "*y
" クリップボードにヤンクして削除
nnoremap [General]d "*d
nnoremap [General]D "*d$
vnoremap [General]d "*d
" クリップボードからソース貼り付け
nnoremap [General]sp :<C-u>let b:save_paste=&paste<CR>:set paste<CR>"*p:let &paste=b:save_paste<CR>
nnoremap [General]sP :<C-u>let b:save_paste=&paste<CR>:set paste<CR>"*P:let &paste=b:save_paste<CR>

" registerを汚さずに削除
nnoremap <Leader>d "_d
nnoremap <Leader>D "_d$
vnoremap <Leader>d "_d

" 行挿入後インサートモードに入らない
nnoremap [General]o o<Esc>
nnoremap [General]O O<Esc>

";と:を入れ替え
nnoremap ; :
nnoremap q; q:a
nnoremap : ;
vnoremap ; :
vnoremap q; q:a
vnoremap : ;

" モーション時にwをiwとする（よく使うので）
onoremap w iw
onoremap W iW

" マッチするものがないパーレンまで移動
onoremap ) ])
onoremap ( [(
vnoremap ) ])
vnoremap ( [(

" よく使うものはtを省略できるようkeymap
onoremap ; t;
onoremap <Space> t<Space>

" ^,$を入力しやすくするkeymap
noremap 7 ^
noremap 9 $

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

onoremap aq  a'
vnoremap aq  a'
onoremap iq  i'
vnoremap iq  i'

" モーション時にqで記号まで飛ぶ
onoremap q /["',.{}()[\]<>]<CR>:nohlsearch<CR>

" exコマンド
nnoremap [General]w :<C-u>w<CR>
nnoremap [General]q :<C-u>q<CR>
"nnoremap [General]m :<C-u>marks<CR>
"nnoremap [General]g :<C-u>registers<CR>

" 仮想置換モード
nnoremap R gR

" 危険なので無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" command mode
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <expr> <C-D> (getcmdpos()==strlen(getcmdline())+1 ? "\<C-d>" : "\<Del>")
cnoremap <C-e> <END>
cnoremap <C-h> <BS>
" カーソル位置にかかわらず全部消す
cnoremap <C-u> <C-e><C-u>

" コマンドラインモードでコマンドラインウィンドウを開く
cnoremap <C-q> <C-f>a

" 置換の自動入力
cnoremap <expr> s/ (getcmdtype()==':' ? "s///g<Left><Left><Left>" : "s/")
cnoremap <expr> %s (getcmdtype()==':' ? "%s///g<Left><Left><Left>" : "%s")
cnoremap <expr> <C-s> (getcmdtype()==':' ? "%s///g<Left><Left><Left>" : "%s")

" insert mode
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-k> <C-o>C
inoremap <C-y> <C-o>p
" undoできるc-w,c-u
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>
inoremap <C-k> <C-o>D<Esc>

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
"nnoremap <silent> [General]/ :<C-u>nohlsearch<CR>

" * はASCIIとJISでキー位置が異なるので共通で使えるkeymapを設定
nnoremap <silent> [General]/  *N
nnoremap <silent> [General]?  #N

"nnoremap <silent> [General]na :<C-u>set number<CR>
"nnoremap <silent> [General]nr :<C-u>set relativenumber<CR>

" 仮想編集の変更
nnoremap [General]va  :<C-u>setlocal virtualedit=all<CR>
nnoremap [General]vb  :<C-u>setlocal virtualedit=block<CR>
nnoremap [General]vv  :let &virtualedit=(&ve == "all" ? "block" : "all")<CR>:setlocal virtualedit<CR>

" very magic（正規表現をエスケープしなくてよくなる）
noremap /   /\v
noremap ?   ?\v

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

"nnoremap <silent> <S-H> gT
"nnoremap <silent> <S-L> gt
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

"noremap <leader>sp :<C-u>vsplit <CR>

"nnoremap <sid>(command-line-enter) q:
"xnoremap <sid>(command-line-enter) q:
"nnoremap <sid>(command-line-norange) q:<C-u>

" Creating underline/overline headings for markup languages
" Inspired by http://sphinx.pocoo.org/rest.html#sections
"nnoremap <leader>1 yyPVr=jyypVr=
"nnoremap <leader>2 yyPVr*jyypVr*
"nnoremap <leader>3 yypVr=
"nnoremap <leader>4 yypVr-
"nnoremap <leader>5 yypVr^
"nnoremap <leader>6 yypVr"

" カーソル行前後にコメント入力
" TODO:一行じゃなくてvisual modeで選択した範囲をコメントで囲む
" TODO:現在ラインと同じ文字数ではなく特定の文字数(80文字とか)のコメントを入力
"nnoremap [General]* yyPVr*^r/$r/jyypVr*^r/$r/
"nnoremap [General]# yyPVr#jyypVr#

if has('win32')
  " Save the current buffer and execute the Tortoise SVN interface's diff program
  "nnoremap <silent> <leader>sd :<c-u>w<CR>:silent !C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:diff /path:"%" /notempfile /closeonend<CR>
  nnoremap <silent> <leader>sd :<c-u>call <SID>TortoiseDiff()<CR>
  " Save the current buffer and execute the Tortoise SVN interface's log
  nnoremap <silent> <leader>sl :<c-u>w<CR>:silent !C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:log /path:"%" /notempfile /closeonend<CR>
  " Save the current buffer and execute the Tortoise SVN interface's revision graph
  nnoremap <silent> <leader>sr :<c-u>w<CR>:silent !C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:revisiongraph /path:"%" /notempfile /closeonend<CR>
  " Save the current buffer and execute the Tortoise SVN interface's blame program
  nnoremap <silent> <leader>sb :<c-u>call <SID>TortoiseBlame()<CR>

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
"nnoremap [General]cm :<c-u>colorscheme molokai<CR>
"nnoremap [General]cw :<c-u>colorscheme wombat<CR>

nnoremap t2 :<C-U>setlocal expandtab shiftwidth=2 tabstop=2<CR>
nnoremap t4 :<C-U>setlocal noexpandtab shiftwidth=4 tabstop=4<CR>
nnoremap [General]t2 :<C-U>setlocal expandtab shiftwidth=2 tabstop=2 nolist<CR>
nnoremap [General]t4 :<C-U>setlocal noexpandtab shiftwidth=4 tabstop=4 nolist<CR>

if has('win32')
  nnoremap <silent> <leader>hg :<c-u>call <SID>HidemaruGrep()<CR>

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

filetype plugin indent on

augroup vimlang
  autocmd!
  autocmd FileType vim setlocal expandtab tabstop=2 shiftwidth=2 list
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
  autocmd FileType xml  setlocal expandtab tabstop=2 shiftwidth=2 list
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
let g:EasyMotion_leader_key = ','
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:EasyMotion_do_shade = 1
hi EasyMotionTarget ctermbg=none ctermfg=green
hi EasyMotionShade  ctermbg=none ctermfg=blue
" }}}

"---------------------------------------------------------------------------
" for Shougo/neocomplcache {{{2
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

let g:neocomplcache_snippets_dir = $DOTVIM.'/snippets'


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
" }}}

"---------------------------------------------------------------------------
" for Shougo/unite.vim {{{2
" The prefix key.
nnoremap [unite]    <Nop>
nmap     [General]u [unite]

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]m  :<C-u>Unite file_mru<CR>
nnoremap [unite]f  :<C-u>Unite source<CR>

" Start insert.
"let g:unite_enable_start_insert = 1

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  nmap <buffer> <ESC>  <Plug>(unite_exit)
  nmap <buffer> <C-c>  <Plug>(unite_exit)
  imap <buffer> jj     <Plug>(unite_insert_leave)
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

" }}}

"---------------------------------------------------------------------------
" for Shougo/vimfiler {{{2
" File explorer like behavior.
nnoremap [vimfiler]  <Nop>
nmap     [General]f  [vimfiler]

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

" }}}

"---------------------------------------------------------------------------
" for kana/vim-operator-replace {{{2
map s <Plug>(operator-replace)
" clipboardからoperator-replace
map [General]s "*<Plug>(operator-replace)
" }}}

"---------------------------------------------------------------------------
" for kana/vim-smartword {{{2
nmap w  <Plug>(smartword-w)
vmap w  <Plug>(smartword-w)
map  b  <Plug>(smartword-b)
map  e  <Plug>(smartword-e)
map  ge <Plug>(smartword-ge)
" }}}

"---------------------------------------------------------------------------
" for kien/ctrlp.vim {{{2
let g:ctrlp_map = ''
let g:ctrlp_by_filename = 1
let g:ctrlp_mruf_max = 250
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

nnoremap [ctrlp]  <Nop>
nmap     <Space>c [ctrlp]

nnoremap [ctrlp]b  :<C-u>CtrlPBuffer<CR>
nnoremap [ctrlp]m  :<C-u>CtrlPMRUFiles<CR>
nnoremap [ctrlp]f  :<C-u>CtrlPCurFile<CR>

" }}}

"---------------------------------------------------------------------------
" for mattn/zencoding-vim {{{2
let g:user_zen_expandabbr_key = '<c-y>'
" }}}

"---------------------------------------------------------------------------
" for motemen/git-vim {{{2
let g:git_no_map_default = 1
let g:git_command_edit = 'rightbelow vnew'

nnoremap [Git]       <Nop>
nmap     <Space>g  [Git]

nnoremap [Git]d :<C-u>GitDiff --cached<CR>
nnoremap [Git]D :<C-u>GitDiff<CR>
nnoremap [Git]s :<C-u>GitStatus<CR>
nnoremap [Git]l :<C-u>GitLog<CR>
nnoremap [Git]L :<C-u>GitLog -u \| head -10000<CR>
nnoremap [Git]a :<C-u>GitAdd<CR>
nnoremap [Git]A :<C-u>GitAdd <cfile><CR>
nnoremap [Git]c :<C-u>GitCommit<CR>
nnoremap [Git]C :<C-u>GitCommit --amend<CR>
nnoremap [Git]p :<C-u>Git push
" }}}

"---------------------------------------------------------------------------
" for nathanaelkane/vim-indent-guides {{{2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
" }}}

"---------------------------------------------------------------------------
" for t9md/vim-quickhl {{{2
nmap <Space>m <Plug>(quickhl-toggle)
xmap <Space>m <Plug>(quickhl-toggle)
nmap <Space>M <Plug>(quickhl-reset)
xmap <Space>M <Plug>(quickhl-reset)
nmap <Space>h <Plug>(quickhl-match)
"let g:quickhl_keywords = [
"    \ "keyword",
"    \ ]
" }}}

"---------------------------------------------------------------------------
" for scrooloose/nerdtree {{{2
"nnoremap [General]n :<C-u>NERDTreeToggle<CR>
" }}}

"---------------------------------------------------------------------------
" for thinca/vim-ref {{{2
nnoremap <silent> [General]a :<C-u>call ref#jump('normal', 'alc')<CR>
vnoremap <silent> [General]a :<C-u>call ref#jump('visual', 'alc')<CR>
" }}}

"---------------------------------------------------------------------------
" for thinca/vim-visualstar {{{2
map * <Plug>(visualstar-*)N
map # <Plug>(visualstar-#)N
" }}}

"---------------------------------------------------------------------------
" for tpope/vim-surround {{{2
" 'a'を>として扱う
"let g:surround_97  = "<\r>"
let g:surround_{char2nr("a")}  = "<\r>"
" 'r'を]として扱う
"let g:surround_114 = "[\r]"
let g:surround_{char2nr("r")}  = "[\r]"
" 'd'を"として扱う
"let g:surround_100 = '"\r"'
let g:surround_{char2nr("d")}  = '"\r"'
" 'q'を'として扱う
"let g:surround_113 = "'\r'"
let g:surround_{char2nr("q")}  = "'\r'"

" perl の演算子囲み
augroup perllang
    " 'Q'を囲みとして扱う
    autocmd FileType perl let g:surround_{char2nr("Q")} = "q(\r)"
    " 'D'を囲みとして扱う
    autocmd FileType perl let g:surround_{char2nr("D")} = "qq(\r)"
augroup END

" }}}

"---------------------------------------------------------------------------
" for tyru/operator-star.vim {{{2
nmap <leader>*  <Plug>(operator-*)
nmap <leader>g* <Plug>(operator-g*)
nmap <leader>#  <Plug>(operator-#)
nmap <leader>g# <Plug>(operator-g#)
" }}}

"---------------------------------------------------------------------------
" for thinca/vim-quickrun {{{2
let g:quickrun_config = {}
let g:quickrun_config = { '*' : {'shebang' : '0' }}
let g:quickrun_config._ = {'runmode': "async:remote:vimproc", 'split': 'below'}
let g:quickrun_config._.runmode = 'async:vimproc'

let g:quickrun_config['markdown'] = {
\ 'type': 'markdown/pandoc',
\ 'outputter': 'browser',
\ 'cmdopt': '-s'
\ }

let g:quickrun_config.io = {
\   'command': 'io',
\ }
" }}}

"---------------------------------------------------------------------------
" for xolox/vim-easytags {{{2
if has('win32')
  let g:easytags_cmd = ''
endif
" }}}

"---------------------------------------------------------------------------
" for deris/columnjump {{{2
map <c-k> <Plug>(columnjump-backward)
map <c-j> <Plug>(columnjump-forward)
" }}}

"---------------------------------------------------------------------------
" for deris/parajump {{{2
map { <Plug>(parajump-backward)
map } <Plug>(parajump-forward)
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
" for YankRing.vim {{{2
"let g:yankring_replace_n_pkey = '<C-k>'
"let g:yankring_replace_n_nkey = '<C-j>'
" }}}

"---------------------------------------------------------------------------
" for errormarker.vim {{{2
let errormarker_disablemappings = 1
" }}}

"---------------------------------------------------------------------------
" for grep.vim {{{2
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

nnoremap [General]eg :<c-u>Egrep<CR>
nnoremap [General]eb :<c-u>Bgrep<CR>

augroup perllang
  autocmd FileType perl vnoremap <Space>ah  :<c-u>AlignCtrl l-l<CR>gv:Align =><CR>
augroup END
" }}}

"---------------------------------------------------------------------------
" for smartchr {{{2
"inoremap <expr> =  smartchr#loop('=', '==', ' = ', ' == ')
"inoremap <expr> +  smartchr#loop('+', '++', ' + ', ' += ')
"inoremap <expr> -  smartchr#loop('-', '--', ' - ', ' -= ')
"inoremap <expr> !  smartchr#loop('!', ' != ')
"inoremap <expr> .  smartchr#loop('.', ' . ')
"inoremap <expr> {  smartchr#loop('{}', '{')
"inoremap <expr> [  smartchr#loop('[]', '[')
"inoremap <expr> (  smartchr#loop('()', '(')
"inoremap <expr> "  smartchr#loop('""', '"')
"inoremap <expr> '  smartchr#loop("''", "'")
"inoremap <expr> `  smartchr#loop('``', '`')

" This is enabled while user inputs Ex commands, not search
" patterns, etc.
"cnoremap <expr> \  smartchr#loop('~/', '\', {'ctype': ':'})
" }}}

"---------------------------------------------------------------------------
" for taglist.vim {{{2
if has('mac')
  let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"    "ctagsのパス
elseif has('win32')
  let Tlist_Ctags_Cmd = "c:/usr/local/bin/ctags.exe"    "ctagsのパス
endif
"let Tlist_Show_One_File = 1               "現在編集中のソースのタグしか表示しない 
let Tlist_Exit_OnlyWindow = 1             "taglistのウィンドーが最後のウィンドーならばVimを閉じる 
"let Tlist_Use_Right_Window = 1            "右側でtaglistのウィンドーを表示 
"nnoremap <silent> [General]l :<C-u>TlistToggle<CR>
" }}}

"---------------------------------------------------------------------------
" for trinity.vim {{{2
nnoremap <silent> [General]n :<C-u>TrinityToggleNERDTree<CR>
nnoremap <silent> [General]l :<C-u>TrinityToggleTagList<CR>
" keymapを奪われるので、Source-Explorer-srcexpl.vimは使わない。

" }}}

"---------------------------------------------------------------------------
" for vim-textobj-function {{{2
omap iF <Plug>(textobj-function-i)
omap aF <Plug>(textobj-function-a)
vmap iF <Plug>(textobj-function-i)
vmap aF <Plug>(textobj-function-a)
" }}}

"---------------------------------------------------------------------------
" for vcscommand.vim {{{2
"let VCSCommandMapPrefix = '[General]s'
" }}}


" }}}

"---------------------------------------------------------------------------
" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
" }}}

