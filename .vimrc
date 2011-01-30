":help option-list
":help :map-commands
":help autocommands-events
":help feature-list

" basic settings {{{1

"pathogen.vim {{{2

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt

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
let format_allow_over_tw = 1	" ぶら下り可能幅
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
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<
" 全角スペースを表示
highlight ZenkakuSpace guibg=white
match ZenkakuSpace /　/
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
set statusline=%t\ %y\ [%{&fenc}][%{&ff}]\ %m%r%w%h%=%l/%L\ %v\ %P
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup
" タグファイルの設定
set tags=../tags,../../tags, ../../../tags,../../../../tags,../../../../../tags,../../../../../../tags ../../../../../../../tags,../../../../../../../../tags
" autochdir
set autochdir
" grep ack
set grepprg=ack\ -a
" macの場合の設定
if has('mac')
  noremap ¥ \
  noremap \ ¥
  set encoding=utf-8
  set fileencoding=utf-8
  set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
endif

" key map:{{{2

" leaderを変更
let mapleader = ","
let maplocalleader = ","

" Escのショートカット
map  <Esc> <Nop>
map! <Esc> <Nop>
"noremap  <C-M> <CR>
noremap  <C-[> <C-c>
noremap! <C-[> <C-c>
noremap  <C-c> <C-[>
noremap! <C-c> <C-[>

" 汎用プレフィックス
noremap [General] <Nop>
nmap <Space> [General]

" jump
nnoremap [General]j <C-f>
nnoremap [General]k <C-b>
nnoremap <C-j> 5j
nnoremap <C-k> 5k
vnoremap <C-j> 5j
vnoremap <C-k> 5k
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" vimrc編集
nnoremap [General].   :<C-u>edit $MYVIMRC<cr>
nnoremap [General]s.  :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif<cr>
" helpショートカット
nnoremap <C-h>      :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><cr>
" 最後に変更されたテキストを選択する
nnoremap gc         `[v`]
vnoremap gc         :<C-u>normal gc<cr>
onoremap gc         :<C-u>normal gc<cr>
" クリップボードの内容を名前付きレジスタに逃がす
nnoremap [General]" :<C-u>let @y=@*<CR>
" 名前付きレジスタからペースト
nnoremap [General]p "yp
nnoremap [General]P "yP
" 名前付きレジスタにヤンク
nnoremap [General]y "yy
" 名前付きレジスタにヤンクして削除
nnoremap [General]d "yd

";と:を入れ替え
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" 英語配列だと使いやすいらしい
"noremap '  `
"noremap `  '

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

onoremap w  iw
onoremap W  iW

" exコマンド
nnoremap [General]w :<C-u>w<cr>
nnoremap [General]q :<C-u>q<cr>
nnoremap [General]m :<C-u>marks<cr>
nnoremap [General]g :<C-u>registers<cr>

" Use more logical mapping (see :h Y)
nnoremap Y y$

" command mode
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-A> <Home>
cnoremap <C-E> <END>
cnoremap <C-H> <BS>
" カーソル位置にかかわらず全部消す
cnoremap <C-u> <C-e><C-u>

inoremap <C-B> <Left>
inoremap <C-F> <Right>
inoremap <C-A> <C-o>^
inoremap <C-E> <C-o>$
"inoremap <C-H> <BS>
"inoremap <C-K> <C-o>C
" undoできるc-w,c-u
inoremap <C-W> <C-g>u<C-w>
inoremap <C-U> <C-g>u<C-u>

" ハイライトを消す
nmap <silent> gh  :<C-u>nohlsearch<cr>

" ブロックモード
nmap [General]va  :<C-u>setlocal virtualedit=all<cr>
nmap [General]vv  :<C-u>setlocal virtualedit=block<cr>

" ベリーマッチ（正規表現をエスケープしなくてよくなる）
nnoremap /   /\v

" tab
"nnoremap te :<C-u>tabedit<cr>
"nnoremap tc :<C-u>tabclose<cr>
"
"nnoremap <leader>tn :<C-u>tabnew<cr>
"nnoremap <leader>tc :<C-u>tabclose<cr>
"nnoremap <leader>tm :<C-u>tabmove<cr>
"nnoremap <leader>tl :<C-u>tabnext<cr>
"nnoremap <leader>th :<C-u>tabprevious<cr>

" tab page
nnoremap [Tab]   <Nop>
nmap     <C-t>   [Tab]
nnoremap <silent> [Tab]n  :<C-u>tabnew<cr>
nnoremap <silent> [Tab]c  :<C-u>tabclose<cr>
nnoremap <silent> [Tab]o  :<C-u>tabonly<cr>
nnoremap <silent> [Tab]m  :<C-u>tabmove<cr>
nnoremap <silent> [Tab]l  :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
nnoremap <silent> [Tab]h  gT

nnoremap <silent> gr :<C-u>tabprevious<cr>

" tag jump
nnoremap [Tag]    <Nop>
nmap     t        [Tag]
nnoremap [Tag]t   <C-]>          " 「飛ぶ」
nnoremap [Tag]j   :<C-u>tag<CR>  " 「進む」
nnoremap [Tag]k   :<C-u>pop<CR>  " 「戻る」
nnoremap [Tag]l   :<C-u>tags<CR> " 履歴一覧

"noremap <leader>sp :<C-u>vsplit <cr>
"
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $v e ~/.vim
cno $p e ~/Documents/perl/

" filetype {{{2

filetype plugin indent on
autocmd FileType make setlocal noexpandtab
autocmd FileType ruby set tabstop=2 shiftwidth=2

au BufEnter  *.rb let g:rails_level = 4
let g:rails_default_database = 'mysql'

let $PERL_DLL = "/opt/local/lib/perl5/5.10.1/darwin-multi-2level/CORE/libperl.a"
let $RUBY_DLL = "/opt/local/lib/libruby.dylib"

autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline


" other settings {{{1

" 新型戦闘力計測器 {{{2
" http://d.hatena.ne.jp/thinca/20091031/1257001194
function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)

" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker

