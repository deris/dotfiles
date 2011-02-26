"---------------------------------------------------------------------------
" deris0126's .vimrc
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" メモ {{{
":help option-list
":help :map-commands
":help autocommands-events
":help feature-list
"
" 日本語vimdoc
" wget http://www.kaoriya.net/vimdoc_j/vimdoc_ja-snapshot.tar.bz2
"
" 使用前提
" ・.vim or vimfile 直下にswapディレクトリを作成しておく
" ・colorscheme のmolokai,wombatを入れておく
"
"}}}

"---------------------------------------------------------------------------
" 使っているプラグイン {{{
"
" pathogen.vim
"
" 以下を.vim/bundle配下で実行
" git clone https://github.com/vim-scripts/Align.git
" git clone https://github.com/vim-scripts/CRefVim.git
" git clone https://github.com/vim-scripts/FuzzyFinder.git
" git clone https://github.com/vim-scripts/L9.git
" git clone https://github.com/vim-scripts/QuickBuf.git
" git clone https://github.com/vim-scripts/The-NERD-Commenter.git
" git clone https://github.com/vim-scripts/The-NERD-tree.git
" git clone https://github.com/vim-scripts/YankRing.vim.git
" git clone https://github.com/vim-scripts/a.vim.git
" git clone https://github.com/msanders/cocoa.vim.git
" git clone https://github.com/motemen/git-vim.git
" git clone https://github.com/vim-scripts/grep.vim.git
" git clone https://github.com/vim-scripts/matchit.zip.git
" git clone https://github.com/Shougo/neocomplcache.git
" git clone https://github.com/tyru/operator-camelize.vim.git
" git clone https://github.com/vim-scripts/project.tar.gz.git
" git clone https://github.com/ujihisa/quickrun.git
" git clone https://github.com/vim-scripts/renamer.vim.git
" git clone https://github.com/vim-scripts/smartchr.git
" git clone https://github.com/msanders/snipmate.vim.git
" git clone https://github.com/vim-scripts/taglist.vim.git
" git clone https://github.com/vim-scripts/textobj-function.git
" git clone https://github.com/vim-scripts/textobj-user.git
" git clone https://github.com/vim-scripts/vcscommand.vim.git
" git clone https://github.com/kana/vim-operator-replace.git
" git clone https://github.com/kana/vim-operator-user.git
" git clone https://github.com/tpope/vim-pathogen.git
" git clone https://github.com/tpope/vim-rails.git
" git clone https://github.com/thinca/vim-ref.git
" git clone https://github.com/kana/vim-smartword.git
" git clone https://github.com/tpope/vim-surround.git
" git clone https://github.com/kana/vim-textobj-indent.git
" git clone https://github.com/kana/vim-textobj-lastpat.git
" git clone https://github.com/kana/vim-textobj-syntax.git
" git clone https://github.com/rphillips/vim-zoomwin.git
" git clone https://github.com/Shougo/vimproc.git
" git clone https://github.com/Shougo/vimshell.git
" git clone https://github.com/mattn/zencoding-vim.git
" }}}

"---------------------------------------------------------------------------
" basic settings {{{1

"---------------------------------------------------------------------------
"pathogen.vim {{{2

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt
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
" virtualedit
set virtualedit=block
" バックアップを無効
set nobackup
" バックアップファイルの生成ディレクトリ
"set backupdir=~/.vim/backup
" スワップを有効
set swapfile
" スワップファイルの生成ディレクトリ
if has('unix')
  set directory=$HOME/.vim/swap
elseif has('win32')
  set directory=$HOME/vimfiles/swap
endif

" set tags
set autochdir
set tags=./tags,../tags,./*/tags,../../tags,../../../tags,../../../../tags

" 文字コードの自動判定
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" macの場合の設定
if has('mac')
  noremap ¥ \
  noremap \ ¥
  " grep ack
  set grepprg=ack\ -a
endif
" }}}

"---------------------------------------------------------------------------
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

"クリップボードを使ったコピペ
"vnoremap <M-c> "+y
"inoremap <M-v> <C-r>+
"nnoremap <M-v> "+p

";と:を入れ替え
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" モーション時にwをiwとする（よく使うので）
onoremap <buffer> w iw
onoremap <buffer> W iW

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

" モーション時にqで記号まで飛ぶ
"onoremap q /["',.{}()[\]<>]<CR>:nohlsearch<CR>

" exコマンド
nnoremap [General]w :<C-u>w<cr>
nnoremap [General]q :<C-u>q<cr>
"nnoremap [General]m :<C-u>marks<cr>
"nnoremap [General]g :<C-u>registers<cr>

" 仮想置換モード
nnoremap R gR

" Use more logical mapping (see :h Y)
nnoremap Y y$

" command mode
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-A> <Home>
cnoremap <expr> <C-D> (getcmdpos()==strlen(getcmdline())+1 ? "\<C-d>" : "\<Del>")
cnoremap <C-E> <END>
cnoremap <C-H> <BS>
" カーソル位置にかかわらず全部消す
cnoremap <C-u> <C-e><C-u>

" insert mode
inoremap <C-B> <Left>
inoremap <C-F> <Right>
inoremap <C-A> <C-o>^
inoremap <C-E> <C-o>$
inoremap <C-H> <BS>
inoremap <C-D> <Del>
inoremap <C-K> <C-o>C
" undoできるc-w,c-u
inoremap <C-W> <C-g>u<C-w>
inoremap <C-U> <C-g>u<C-u>
inoremap <C-K> <C-o>D<Esc>

" 括弧など自動で閉じる
inoremap {  {}<Left>
inoremap [  []<Left>
inoremap (  ()<Left>
inoremap "  ""<Left>
inoremap '  ''<Left>
""inoremap <  <><Left>

" ハイライトを消す
nnoremap <silent> [General]h  :<C-u>nohlsearch<cr>

" 仮想編集の変更
nnoremap [General]va  :<C-u>setlocal virtualedit=all<cr>
nnoremap [General]vb  :<C-u>setlocal virtualedit=block<cr>
nnoremap [General]vv  :let &virtualedit=(&ve == "all" ? "block" : "all")<CR>:setlocal virtualedit<CR>

" ベリーマッチ（正規表現をエスケープしなくてよくなる）
nnoremap /   /\v

" Tabでウィンドウ移動
nnoremap <silent> <Tab> <C-w>w
nnoremap <silent> [General]<Tab> <C-w>W

" カーソル下のウィンドウを編集（数字が付いていればその行へ）
noremap gf gF

" tab page
nnoremap [TabPage]   <Nop>
nmap     <C-t>    [TabPage]
nnoremap <silent> [TabPage]n  :<C-u>tabnew<cr>
nnoremap <silent> [TabPage]c  :<C-u>tabclose<cr>
nnoremap <silent> [TabPage]o  :<C-u>tabonly<cr>
nnoremap <silent> [TabPage]m  :<C-u>tabmove<cr>
nnoremap <silent> [TabPage]l  :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
nnoremap <silent> [TabPage]h  gT

nnoremap <silent> gr :<C-u>tabprevious<cr>

" tag jump
nnoremap [TagJump]    <Nop>
nmap     t            [TagJump]
nnoremap [TagJump]t   <C-]>          " 「飛ぶ」
nnoremap [TagJump]j   :<C-u>tag<CR>  " 「進む」
nnoremap [TagJump]k   :<C-u>pop<CR>  " 「戻る」
nnoremap [TagJump]l   :<C-u>tags<CR> " 履歴一覧

"noremap <leader>sp :<C-u>vsplit <cr>

"nnoremap <sid>(command-line-enter) q:
"xnoremap <sid>(command-line-enter) q:
"nnoremap <sid>(command-line-norange) q:<C-u>

if has('win32')
  " Save the current buffer and execute the Tortoise SVN interface's diff program
  map <silent> <leader>td :w<CR>:silent !"C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:diff /path:"%" /notempfile /closeonend"<CR>
  " Save the current buffer and execute the Tortoise SVN interface's log
  map <silent> <leader>tl :w<CR>:silent !"C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:log /path:"%" /notempfile /closeonend"<CR>
  " Save the current buffer and execute the Tortoise SVN interface's revision graph
  map <silent> <leader>tr :w<CR>:silent !"C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:revisiongraph epath:"%" /notempfile /closeonend"<CR>
  " Save the current buffer and execute the Tortoise SVN interface's blame program
  map <silent> <leader>tb :call TortoiseBlame()<CR>
  function! TortoiseBlame()
    " Save the buffer
    silent execute(':w')
    " Now run Tortoise to get the blame dialog to display
    let filename = expand("%")
    let linenum = line(".")
    silent execute('!C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:blame /path:"' . filename . '" /line:' . linenum . ' /notempfile /closeonend')
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

" <space>ao move current buffer into a new tab.
nnoremap <silent> [General]ao :<C-u>call <SID>move_window_into_tab_page(0)<Cr>

nnoremap [General]cm :colorscheme molokai<cr>
nnoremap [General]cw :colorscheme wombat<cr>

" }}}

"---------------------------------------------------------------------------
" Command {{{2
"command! Utf8 e ++enc=utf-8
"command! Euc e ++enc=euc-jp
"command! Sjis e ++enc=cp932
"command! Jis e ++enc=iso-2022-jp
"command! WUtf8 w ++enc=utf-8 | e
"command! WEuc w ++enc=euc-jp | e
"command! WSjis w ++enc=cp932 | e
"command! WJis w ++enc=iso-2022-jp | e
" }}}

"---------------------------------------------------------------------------
" filetype {{{2

filetype plugin indent on
autocmd FileType make setlocal noexpandtab
autocmd FileType ruby set tabstop=2 shiftwidth=2

au BufEnter  *.rb let g:rails_level = 4
let g:rails_default_database = 'mysql'

if has('mac')
  let $PERL_DLL = "/opt/local/lib/perl5/5.10.1/darwin-multi-2level/CORE/libperl.a"
  let $RUBY_DLL = "/opt/local/lib/libruby.dylib"
endif

autocmd BufWinEnter,WinEnter * setlocal cursorline
autocmd BufWinEnter,WinEnter * setlocal cursorcolumn
autocmd BufWinLeave,WinLeave * setlocal nocursorline
autocmd BufWinLeave,WinLeave * setlocal nocursorcolumn
" }}}

" }}}

"---------------------------------------------------------------------------
" plugins {{{1

"---------------------------------------------------------------------------
" for perl-support.vim {{{2
"let g:Perl_GlobalTemplateFile = root_dir.'perl-support/templates/Templates'
"let g:Perl_LocalTemplateFile = $HOME.'/.vim/bundle/perl-support.vim/perl-support/templates/Templates'
"let g:Perl_CodeSnippets = root_dir.'perl-support/codesnippets/'
"let g:Perl_PerlModuleList = root_dir.'perl-support/modules/perl-modules.list'
"let g:Perl_PerlModuleListGenerator = root_dir.'perl-support/scripts/pmdesc3.pl'
" }}}

"---------------------------------------------------------------------------
" for neocomplcache {{{2
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

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
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"setlocal completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
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
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" }}}

"---------------------------------------------------------------------------
" for operator-replace {{{2
map <C-S> <Plug>(operator-replace)
" }}}

"---------------------------------------------------------------------------
" for smartword {{{2
map w  <Plug>(smartword-w)
map b  <Plug>(smartword-b)
map e  <Plug>(smartword-e)
map ge  <Plug>(smartword-ge)
" }}}

"---------------------------------------------------------------------------
" for yankring {{{2
"let g:yankring_replace_n_pkey = '<C-k>'
"let g:yankring_replace_n_nkey = '<C-j>'
" }}}

"---------------------------------------------------------------------------
" for fuzzyfinder {{{2
let g:fuf_modesDisable = []
let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
let g:fuf_mrufile_maxItem = 500
let g:fuf_mrucmd_maxItem = 500
let g:fuf_enumeratingLimit = 20
let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'

nnoremap gb :<C-u>FufBuffer<CR>
nnoremap [General]fb  :<C-u>FufBuffer<CR>
nnoremap [General]ff  :<C-u>FufFile<CR>
nnoremap [General]fd  :<C-u>FufDir<CR>
nnoremap [General]ft  :<C-u>FufTag<CR>
nnoremap [General]fm  :<C-u>FufMruFile<CR>
nnoremap [General]fc  :<C-u>FufMruCmd<CR>
" }}}

"---------------------------------------------------------------------------
" for Objective-C {{{2
if has('mac')
  " for tablist.vim Objective-C
  let tlist_objc_settings='objc;P:protocols;i:interfaces;I:implementations;M:instance methods;C:implementation methods;Z:protocol methods'
  " for a.vim Objective-C
  let g:alternateExtensions_h = "m,mm,c,cpp"
  let g:alternateExtensions_m = "h"
  let g:alternateExtensions_mm = "h,hpp"
  " for Objective-C gfでジャンプできるように
  autocmd FileType objc setlocal path=.;,/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.0.sdk/System/Library/Frameworks,/Developer/SDKs/MacOSX10.6.sdk/System/Library/Frameworks,,
  autocmd FileType objc setlocal include=^\s*#\s*import
  autocmd FileType objc setlocal includeexpr=substitute(v:fname,'\/','\.framework/Headers/','g')
  autocmd FileType objc setlocal makeprg=xcodebuild\ -activetarget\ -activeconfiguration
endif
" }}}

"---------------------------------------------------------------------------
" for taglist.vim {{{2
if has('mac')
  let Tlist_Ctags_Cmd = "/opt/local/bin/ctags"    "ctagsのパス 
endif
let Tlist_Show_One_File = 1               "現在編集中のソースのタグしか表示しない 
let Tlist_Exit_OnlyWindow = 1             "taglistのウィンドーが最後のウィンドーならばVimを閉じる 
"let Tlist_Use_Right_Window = 1            "右側でtaglistのウィンドーを表示 
nnoremap <silent> [General]l :<C-u>TlistToggle<cr>
" }}}

"---------------------------------------------------------------------------
" for smartchr.vim {{{2
"inoremap <expr> = smartchr#loop('=', ' = ', ' == ', ' === ')
"inoremap <expr> + smartchr#loop('+', ' + ', ' += ')
"inoremap <expr> - smartchr#loop('-', ' - ', ' -= ')
"inoremap <expr> ! smartchr#loop('!', ' != ')
" }}}

"---------------------------------------------------------------------------
" for vim-textobj-function {{{2
"noremap iF <Plug>(textobj-function-i)
"noremap aF <Plug>(textobj-function-a)
" }}}

"---------------------------------------------------------------------------
" for vcscommand.vim {{{2
let VCSCommandMapPrefix = '[General]s'
" }}}

"---------------------------------------------------------------------------
" for git-vim.vim {{{2
let g:git_no_map_default = 1
let g:git_command_edit = 'rightbelow vnew'
nnoremap [General]gd :<C-u>GitDiff --cached<Enter>
nnoremap [General]gD :<C-u>GitDiff<Enter>
nnoremap [General]gs :<C-u>GitStatus<Enter>
nnoremap [General]gl :<C-u>GitLog<Enter>
nnoremap [General]gL :<C-u>GitLog -u \| head -10000<Enter>
nnoremap [General]ga :<C-u>GitAdd<Enter>
nnoremap [General]gA :<C-u>GitAdd <cfile><Enter>
nnoremap [General]gc :<C-u>GitCommit<Enter>
nnoremap [General]gC :<C-u>GitCommit --amend<Enter>
nnoremap [General]gp :<C-u>Git push
" }}}

"---------------------------------------------------------------------------
" for zencoding.vim {{{2
let g:user_zen_expandabbr_key = '<c-y>'
" }}}

"---------------------------------------------------------------------------
" for surround.vim {{{2
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
" 'Q'を囲みとして扱う
"autocmd FileType perl let g:surround_81 = "q(\r)"
autocmd FileType perl let g:surround_{char2nr("Q")} = "q(\r)"
" 'D'を囲みとして扱う
"autocmd FileType perl let g:surround_68 = "qq(\r)"
autocmd FileType perl let g:surround_{char2nr("D")} = "qq(\r)"

" }}}

" }}}

"---------------------------------------------------------------------------
" other settings {{{1

"---------------------------------------------------------------------------
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
" }}}
" }}}

"---------------------------------------------------------------------------
" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
" }}}

