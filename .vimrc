"---------------------------------------------------------------------------
"        __             _       _                 _
"   ____/ /___   _____ (_)_____( )  _   __ (_)____ ___   _____ _____
"  / __  // _ \ / ___// // ___/|/  | | / // // __ `__ \ / ___// ___/
" / /_/ //  __// /   / /(__  )     | |/ // // / / / / // /   / /__
" \__,_/ \___//_/   /_//____/      |___//_//_/ /_/ /_//_/    \___/
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

if has('win32')
  let $DOTVIM=expand('~/vimfiles')
else
  let $DOTVIM=expand('~/.vim')
endif

let $VIMBUNDLE=$DOTVIM.expand('/bundle')

function! s:bundled(bundle)
  let plugs = get(g:, 'plugs', {})
  return has_key(plugs, a:bundle) ? isdirectory(plugs[a:bundle].dir) : 0
endfunction

"---------------------------------------------------------------------------
" Plug {{{2
call plug#begin($VIMBUNDLE)

" original repos on github
Plug 'AndrewRadev/linediff.vim'
Plug 'Keithbsmiley/swift.vim'
Plug 'DeaR/vim-tabpagebuffer-misc'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/tabpagebuffer.vim'
Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-rooter'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'chrisbra/Recover.vim'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'fatih/vim-go'
Plug 'glidenote/memolist.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-metarepeat'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'junegunn/fzf', { 'do' :  './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-after-object'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-dirvish'
Plug 'justmao945/vim-clang'
Plug 'kana/vim-altr'
Plug 'kana/vim-niceblock'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-smarttill'
Plug 'kana/vim-smartword'
Plug 'kana/vim-submode'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'koron/vim-gosrc'
Plug 'koturn/vim-replica'
Plug 'lambdalisue/pinkyless.vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/ctrlp-everything'
Plug 'mattn/ctrlp-filer'
Plug 'mattn/ctrlp-register'
Plug 'mattn/gist-vim'
Plug 'mattn/learn-vimscript'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'nelstrom/vim-markdown-folding'
Plug 'nixprime/cpsm'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ompugao/ctrlp-locate'
Plug 'rhysd/committia.vim'
Plug 'rhysd/conflict-marker.vim'
Plug 'rhysd/vim-grammarous'
Plug 'rhysd/vim-clang-format'
Plug 'rhysd/vim-operator-surround'
Plug 'rhysd/vim-textobj-word-column'
Plug 'rphillips/vim-zoomwin'
Plug 'scrooloose/syntastic'
Plug 'sgur/ctrlp-extensions.vim'
Plug 'sgur/vim-textobj-parameter'
Plug 'sjl/gundo.vim'
Plug 'supermomonga/thingspast.vim'
Plug 't9md/vim-surround_custom_mapping'
Plug 'tacahiroy/ctrlp-funky'
Plug 'thinca/vim-ambicmd'
Plug 'thinca/vim-fontzoom'
Plug 'thinca/vim-poslist'
Plug 'thinca/vim-qfreplace'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-scouter'
Plug 'thinca/vim-singleton'
Plug 'thinca/vim-textobj-comment'
Plug 'thinca/vim-themis'
Plug 'thinca/vim-zenspace'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tyru/capture.vim'
Plug 'tyru/eskk.vim'
Plug 'tyru/nextfile.vim'
Plug 'tyru/open-browser.vim'
Plug 'vim-jp/vital.vim'
Plug 'vim-ruby/vim-ruby', { 'for' : 'ruby' }
Plug 'vimtaku/hl_matchit.vim'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'deris/columnjump'
Plug 'deris/vim-fitcolumn'
Plug 'deris/parajump'
Plug 'deris/vim-cmdline-switch'
Plug 'deris/vim-diffbuf'
Plug 'deris/vim-dirdiff', 'dev'
Plug 'deris/vim-pasta'
Plug 'deris/vim-operator-insert'
Plug 'deris/vim-rengbang'
Plug 'deris/vim-shot-f'
Plug 'deris/vim-textobj-enclosedsyntax'
Plug 'deris/vim-multi-replace'

" vim-scripts repos
Plug 'vim-scripts/HybridText'
Plug 'vim-scripts/UnconditionalPaste'
Plug 'vim-scripts/matchit.zip'

" color scheme
Plug 'deris/molokai'
Plug 'deris/vim-wombat'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/newspaper.vim'
Plug 'w0ng/vim-hybrid'

" Japanese help
Plug 'vim-jp/vimdoc-ja'

call plug#end()
" }}}

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
set nonumber
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

call s:LetAndMkdir('&backupdir', $DOTVIM.expand('/backup'))
set swapfile
call s:LetAndMkdir('&directory', $DOTVIM.expand('/swap'))
set history=2000
let &showbreak = '+++ '
set ttyfast
if has('persistent_undo')
  set undofile
  call s:LetAndMkdir('&undodir', $DOTVIM.expand('/undo'))
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

let g:my_rg_path = ''
let g:my_ag_path = ''
let g:my_jvgrep_path = ''
let g:my_fd_path = ''
if has('win32')
  let g:my_rg_path = 'C:\usr\local\bin\rg.exe'
  let g:my_ag_path = 'C:\usr\local\bin\ag.exe'
  let g:my_jvgrep_path = 'C:\usr\local\bin\jvgrep.exe'
  let g:my_fd_path = 'C:\usr\local\bin\fd.exe'
elseif has('unix')
  let g:my_rg_path = 'rg'
  let g:my_ag_path = 'ag'
  let g:my_jvgrep_path = 'jvgrep'
  let g:my_fd_path = 'fd'
endif

if executable(g:my_ag_path)
  let &grepprg = g:my_ag_path . ' --vimgrep -S --hidden'
  set grepformat=%f:%l:%c:%m
elseif executable(g:my_rg_path)
  let &grepprg = g:my_rg_path . ' --vimgrep -S --no-heading --hidden'
  set grepformat=%f:%l:%c:%m
elseif executable(g:my_jvgrep_path)
  let &grepprg = g:my_jvgrep_path . ' --no-color -nr8 --enc utf-8,cp932,euc-jp'
endif

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
  autocmd BufRead,BufEnter * if isdirectory(expand('%:p:h')) | lcd %:p:h | endif
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

" }}}

"---------------------------------------------------------------------------
" custom keymaps and commands {{{2

" my mappable key list
" nmap <Space>a
" nmap <Space>i
" nmap <Space>j
" nmap <Space>k
" nmap <Space>m
" nmap <Space>r
" nmap <Space>z
" nmap ,a
" nmap ,e
" nmap ,f
" nmap ,h
" nmap ,i
" nmap ,k
" nmap ,n
" nmap ,o
" nmap ,p
" nmap ,u
" nmap ,v
" nmap ,x
" nmap ,y
" nmap ,z

let mapleader = ","
let maplocalleader = ","

nnoremap \  ,

if has('mac')
  noremap ¥ \
  noremap \ ¥
endif

" Esc
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

" edit vimrc
if has('gui')
  nnoremap <silent> <Space>.   :<C-u>execute 'tab drop ' . escape(resolve($MYVIMRC), ' ')<CR>
else
  nnoremap <silent> <Space>.   :<C-u>execute 'tabe ' . escape(resolve($MYVIMRC), ' ')<CR>
endif

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
nnoremap <silent> <S-Space>O :<C-u>for i in range(1, v:count1) \| call append(line('.')-1, '') \| endfor \| silent! call repeat#set("<S-Space>O"), v:count1)<CR>

" swap ; and :
nnoremap ; :
vnoremap ; :
nnoremap q; q:
vnoremap q; q:
nnoremap : ;
vnoremap : ;

" repeat last command-line
nnoremap <Space>; @:

" repeats the last command on every line
vnoremap .  :normal .<CR>

function! s:dot_repeat(bang)
  for i in range(v:count1)
    execute "normal".a:bang." ."
  endfor
endfunction

command! -nargs=0 -bang DotRepeat call s:dot_repeat("<bang>")

" repeats the last command v:count1 time
nnoremap <Leader>.  :<C-u>DotRepeat<CR>

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

" use <C-q> instead of @
nnoremap <C-q> @
nnoremap <C-q><C-q> @@

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
nnoremap <Space>q :<C-u>q<CR>
nnoremap <Space>Q :<C-u>q!<CR>
nnoremap <S-Space>Q :<C-u>q!<CR>
nnoremap <Space>bd :<C-u>bwipeout<CR>
nnoremap <Space>bD :<C-u>bwipeout!<CR>
nnoremap <Space>bb :<C-u>buffer #<CR>

" virtual replace mode
nnoremap R gR

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

" insert substitute command
nnoremap gs  :<C-u>%s///g<Left><Left><Left>
vnoremap gs  :s///g<Left><Left><Left>
nnoremap gS  :<C-u>%s///gc<Left><Left><Left>
vnoremap gS  :s///gc<Left><Left><Left>

" insert grep/vimgrep command
nnoremap gr         :<C-u>grep 
nnoremap <Space>gr  :<C-u>vimgrep // **<Left><Left><Left><Left>

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
nnoremap <silent> <C-[><C-[> :<C-u>nohlsearch<CR>

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

nnoremap <Space>,  :<C-u>MyHome<CR>

command! -nargs=0 MyHome call s:home()
function! s:home()
  let memo = '~/memo.md'
  if has('gui')
    execute 'tab drop ' . memo
  else
    execute 'tabe ' . memo
  endif
endfunction

nnoremap [tabmode]t  :<C-u>MyMemoNew<CR>
nnoremap [tabmode]n  :<C-u>tab %<CR>
nnoremap [tabmode]d  :<C-u>tabclose<CR>

call s:LetAndMkdir('g:my_memo_save_dir', $DOTVIM.expand('/memo'))
command! -nargs=? MyMemoNew call s:create_memo(<f-args>)
command! -nargs=1 MyMemoGrep call s:grep_memo(<q-args>)

function! s:create_memo(...)
  if a:0 == 0
    let ext = get(g:, 'my_memo_default_ext', '.txt')
  else
    if a:1 !~ '^\.\?\w\+$'
      echohl WarningMsg
      echom '[error]' . a:1 . 'is must be word.'
      echohl None
    endif
    let ext = (a:1 =~ '^\.' ? '' : '.') . a:1
  endif

  execute printf('tabe %s/%s%s', g:my_memo_save_dir, strftime('%Y-%m-%d_%H%M%S'), ext)
endfunction

function! s:grep_memo(pat)
  execute printf('vimgrep %s %s/*', a:pat, g:my_memo_save_dir)
endfunction

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
nnoremap [tagjump]s   :<C-u>split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap [tagjump]v   :<C-u>vsplit<CR>:exec("tag ".expand("<cword>"))<CR>

" filetype
nnoremap [filetype]    <Nop>
nmap     <Leader>t     [filetype]

nnoremap [filetype]p   :<C-u>set filetype=perl<CR>
nnoremap [filetype]v   :<C-u>set filetype=vim<CR>
nnoremap [filetype]c   :<C-u>set filetype=c<CR>
nnoremap [filetype]s   :<C-u>set filetype=shell<CR>
nnoremap [filetype]r   :<C-u>set filetype=ruby<CR>
nnoremap [filetype]j   :<C-u>set filetype=javascript<CR>
nnoremap [filetype]h   :<C-u>set filetype=html<CR>
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

function! s:DiffClose()
  DiffOff
  windo bwipeout!
endfunction

command! DiffClose call s:DiffClose()

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


function! MyPrintNumber(motion_wise)
  let spos = getpos("'[")
  let epos = getpos("']")

  if (spos[1] != epos[1]) || (spos[2] > epos[2])
    return
  endif

  let line = getline(spos[1])
  let target = line[spos[2]-1 : epos[2]-1]
  echo printf("BIN: %b\n" .
    \         "DEC: %d\n" .
    \         "HEX: 0x%X\n", target, target, target)
endfunction

call operator#user#define('my-print-num', 'MyPrintNumber')

nmap <Space>u  <Plug>(operator-my-print-num)

command! -nargs=? -range=% ExtractMatches <line1>,<line2>call s:extract_matches(<f-args>)

function! s:extract_matches(...) range
  let s:pattern = get(a:000, 0, @/)

  let s:result_line = filter(getline(a:firstline, a:lastline), 'v:val =~# s:pattern')

  new
  setlocal buftype=nofile
  call setline(1, s:result_line)
endfunction

command! -nargs=? -range=% ExtractMatchWords call s:extract_match_words(<line1>, <line2>, <q-args>)

let g:extract_match_word_with_word = 1
let g:extract_match_word_with_sort = 1
let g:extract_match_word_line_num = 10

function! s:extract_match_words(fline, lline, pattern) range
  let s:result_word = {}

  let save_pos = getcurpos()

  if a:fline == a:lline
    let [firstline, lastline] = [1, line('$')]
  else
    let [firstline, lastline] = [a:fline, a:lline]
  endif

  let pattern = a:pattern
  if g:extract_match_word_with_word != 0
    let pattern = '\<\w*' . a:pattern . '\m\w*\>'
  endif

  silent! execute printf('%s,%ss/%s/\=s:save_match(s:result_word)/gn', firstline, lastline, pattern)
  call setpos('.', save_pos)

  if empty(s:result_word)
    echo 'no match found'
  else
    let result = []
    if g:extract_match_word_with_sort != 0
      let result = sort(keys(s:result_word))
    endif
    new
    setlocal buftype=nofile
    setlocal noswapfile
    call setline(1, result)
    execute 'resize ' . g:extract_match_word_line_num
  endif

endfunction

function! s:save_match(result_word)
  let a:result_word[submatch(0)] = get(a:result_word, submatch(0), 0) + 1
  return ''
endfunction

" for quickfix windows
augroup MyQuickFix
  autocmd!
  autocmd FileType qf  nnoremap <silent> <buffer> o   :<C-u>call <SID>tabopen_quickfix_entry()<CR>
  autocmd FileType qf  nnoremap <silent> <buffer> dd  :call <SID>del_quickfix_entry()<CR>
  autocmd FileType qf  vnoremap <silent> <buffer> d   :call <SID>del_quickfix_entry()<CR>
  autocmd FileType qf  nnoremap <silent> <buffer> u   :<C-u>call <SID>undo_quickfix_entry()<CR>
  autocmd QuickFixCmdPost *  cwindow
augroup END

function! s:tabopen_quickfix_entry()
  let qf = getqflist()
  if empty(qf)
    return
  endif

  let index = line('.') - 1
  tabe
  execute printf('buffer +%d %d', qf[index].lnum, qf[index].bufnr)
endfunction

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

function! QFSortWithText(func)
  if &ft != 'qf'
    return
  endif

  call s:sort_quickfix_entry(a:func)
endfunction

function! s:sort_quickfix_entry(func)
  let qf = getqflist()
  let history = get(w:, 'qf_history', [])
  call add(history, copy(qf))
  let w:qf_history = history
  let qf = sort(qf, {arg1, arg2 ->a:func(arg1.text, arg2.text)})
  call setqflist(qf, 'r')
endfunction

" https://github.com/google/codesearch
let g:codesearch_bin_path = '~/go/bin'

function! s:codesearch_search(pattern)
  let csearch = g:codesearch_bin_path . '/csearch'
  if !executable(csearch)
    echohl WarningMsg
    echom printf('[error] %s is not executable', csearch)
    echohl None
    return
  endif

  let s:save_grepprg = &grepprg
  let s:save_grepformat = &grepformat

  let &grepprg = csearch . ' -i -n'
  set grepformat=%f:%l:%m

  try
    execute 'silent grep! ' . a:pattern
  finally
    let &grepprg = s:save_grepprg
    let &grepformat = s:save_grepformat
  endtry
endfunction

function! s:codesearch_index(dir)
  let cindex = g:codesearch_bin_path . '/cindex'
  if !executable(cindex)
    echohl WarningMsg
    echom printf('[error] %s is not executable', cindex)
    echohl None
    return
  endif

  if !isdirectory(a:dir)
    throw printf('error: %s is not directory', a:dir)
  endif

  execute printf('%s %s', cindex, a:dir)
endfunction

command! -nargs=1 CSSearch call s:codesearch_search(<q-args>)
command! -nargs=1 CSIndex  call s:codesearch_index(<q-args>)

" popup definition or local declaration
let g:popup_before_additional_line = 0
let g:popup_after_additional_line  = 2
let g:popup_no_blank_line          = 1

function! s:popup_definition()
  call s:move_and_popup(function('s:tag'), function('s:pop'))
endfunction

function! s:tag()
  execute "normal! \<C-]>"
endfunction

function! s:pop()
  execute "normal! \<C-t>"
endfunction

command! -nargs=0 PopupDefinition silent! call s:popup_definition()

nnoremap <C-g>  :<C-u>PopupDefinition<CR>

function! s:popup_local_declaration()
  call s:move_and_popup(function('s:go_local_decl'), function('s:go_back'))
endfunction

function! s:go_local_decl()
  execute "normal! gd"
endfunction

function! s:go_back()
  execute "normal! \<C-o>"
endfunction

command! -nargs=0 PopupLocalDeclaration silent! call s:popup_local_declaration()

nnoremap <C-l>  :<C-u>PopupLocalDeclaration<CR>

function! s:move_and_popup(move_func, post_func)
  if !exists('*popup_create')
    echohl WarningMsg
    echom printf('[error] popup_create is not supported')
    echohl None
    return
  endif

  let has_jumped = 0
  let save_view = {}
  try
    let bpos = getcurpos()
    let save_view = winsaveview()
    call a:move_func()
    let apos = getcurpos()
    if bpos == apos
      return
    endif
    let has_jumped = 1
    let strs = s:get_around_lines(g:popup_before_additional_line, g:popup_after_additional_line, g:popup_no_blank_line)
    call map(strs, {key, val -> substitute(val, "\t", repeat(' ', &tabstop), 'g')})
    call a:post_func()
    call winrestview(save_view)
    let has_jumped = 0
    call popup_create(strs, {
      \ 'line': 'cursor',
      \ 'col': 'cursor',
      \ 'pos': 'topleft',
      \ 'wrap': 0,
      \ 'border': [1, 1, 1, 1],
      \ 'moved': 'any',
      \ })
  finally
    if has_jumped == 1
      call a:post_func()
      call winrestview(save_view)
    else
      let apos = getcurpos()
      if bpos != apos
        call a:post_func()
        call winrestview(save_view)
      endif
    endif
  endtry
endfunction

function! s:get_around_lines(before_count, after_count, no_blank_line)
  let cur_lnum = line('.')
  let before_lnum = max([1, cur_lnum - a:before_count])
  let after_lnum  = min([line('$'), cur_lnum + a:after_count])
  if a:no_blank_line == 1
    if a:before_count > 0 && cur_lnum != 1
      let lnum = cur_lnum - 1
      while lnum >= before_lnum
        let str = getline(lnum)
        if str =~ '^\s*$'
          let lnum += 1
          break
        endif
        let lnum -= 1
      endwhile
      let before_lnum = (lnum >= before_lnum ? lnum : before_lnum)
    endif
    if a:after_count > 0 && cur_lnum != line('$')
      let lnum = cur_lnum + 1
      while lnum <= after_lnum
        let str = getline(lnum)
        if str =~ '^\s*$'
          let lnum -= 1
          break
        endif
        let lnum += 1
      endwhile
      let after_lnum = (lnum <= after_lnum ? lnum : after_lnum)
    endif
  endif
  return getline(before_lnum, after_lnum)
endfunction

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
  while i < v:count1
    let i = i + 1
    let save_pos = getcurpos()
    let pos = search(a:pattern,'W'.a:flags)
    while pos != 0 && s:synname() !~# a:syn
      let pos = search(a:pattern,'W'.a:flags)
    endwhile
    if pos == 0
      call setpos('.', save_pos)
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
" for Shougo/neocomplete {{{2
if s:bundled('neocomplete')
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
  call s:LetAndMkdir('g:neosnippet#snippets_directory', $DOTVIM.expand('/snippets'))

  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

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
" for airblade/vim-rooter {{{2
if s:bundled('vim-rooter')
  let g:rooter_cd_cmd="lcd"
  let g:rooter_manual_only = 1
  let g:rooter_disable_map = 1
endif
" }}}

"---------------------------------------------------------------------------
" for airblade/vim-gitgutter {{{2
if s:bundled('vim-gitgutter')
  let g:gitgutter_map_keys = 0
  if s:bundled('vim-submode')
    call submode#enter_with('gitgutter', 'n', 'r', '<Leader>gk', '<Plug>GitGutterPrevHunk')
    call submode#enter_with('gitgutter', 'n', 'r', '<Leader>gj', '<Plug>GitGutterNextHunk')
    call submode#map('gitgutter', 'n', 'r', 'k', '<Plug>GitGutterPrevHunk')
    call submode#map('gitgutter', 'n', 'r', 'j', '<Plug>GitGutterNextHunk')
  else
    nmap <Leader>gp <Plug>GitGutterPreviewHunk
    nmap <Leader>gs <Plug>GitGutterStageHunk
    nmap <Leader>gu <Plug>GitGutterUndoHunk

    nmap <Leader>gk <Plug>GitGutterPrevHunk
    nmap <Leader>gj <Plug>GitGutterNextHunk
  endif
  nmap <Leader>gh :<C-u>GitGutterSignsToggle<CR>
  nmap <Leader>gt :<C-u>GitGutterToggle<CR>
endif
" }}}

"---------------------------------------------------------------------------
" for ctrlpvim/ctrlp.vim {{{2
if s:bundled('ctrlp.vim')
  let g:ctrlp_map         = ''
  let g:ctrlp_mruf_max    = 2000
  if has('win32')
    if exists('$TMP')
      let g:ctrlp_mruf_exclude = escape($TMP, ' \').'\\.*'
    endif
  elseif has('unix')
    let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*'
    if exists('$TMPDIR')
      let g:ctrlp_mruf_exclude .= '\|'.resolve(expand('$TMPDIR')).'/.*'
    endif
  endif

  nnoremap <Space>jj  :<C-u>CtrlPMRU<CR>
  nnoremap <Space>jf  :<C-u>CtrlPCurFile<CR>
  nnoremap <Space>jb  :<C-u>CtrlPBuffer<CR>
  nnoremap <Space>jd  :<C-u>CtrlPBookmarkDir<CR>

  if executable(g:my_fd_path)
    let g:ctrlp_user_command = g:my_fd_path . ' --type f --color=never "" %s'
    let g:ctrlp_user_caching = 0
  elseif executable(g:my_rg_path)
    let g:ctrlp_user_command = g:my_rg_path . ' %s --files --hidden --color never'
    let g:ctrlp_user_caching = 0
  elseif executable(g:my_ag_path)
    let g:ctrlp_user_command = g:my_ag_path . ' %s -l --hidden --nocolor -g ""'
    let g:ctrlp_user_caching = 0
  elseif executable(g:my_jvgrep_path)
    let g:ctrlp_user_command = 'cd %s && ' . g:my_jvgrep_path . ' --no-color -l -R "" .'
    let g:ctrlp_user_caching = 0
  endif

  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("q")': ['<c-q>'],
    \ }

  let g:ctrlp_open_func = {
    \ 'bookmarked dirs' : 'OpenCtrlPBookmarkedDirs',
    \ }
  function! OpenCtrlPBookmarkedDirs(action, line)
    if a:action =~ '^[tq]$'
      let dirname = matchstr(a:line, '^.*\ze\t')
      if !isdirectory(dirname)
        return
      endif

      call ctrlp#exit()

      if a:action == 't'
        tabe
      else  " a:action == 'q'
        rightbelow vnew
      endif
      execute printf('lcd %s', dirname)
    else
      call call('ctrlp#bookmarkdir#accept', [a:action, a:line])
    endif
  endfunction
endif
" }}}

"---------------------------------------------------------------------------
" for easymotion/vim-easymotion {{{2
if s:bundled('vim-easymotion')
  let g:EasyMotion_do_mapping = 0

  map <Leader>w <Plug>(easymotion-w)
  map <Leader>b <Plug>(easymotion-b)
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
" for Julian/vim-textobj-variable-segment {{{2
if s:bundled('vim-textobj-variable-segment')
  let g:textobj_variable_no_default_key_mappings = 1
  omap iy <Plug>(textobj-variable-i)
  omap ay <Plug>(textobj-variable-a)
  vmap iy <Plug>(textobj-variable-i)
  vmap ay <Plug>(textobj-variable-a)
endif
" }}}

"---------------------------------------------------------------------------
" for junegunn/vim-after-object {{{2
if s:bundled('vim-after-object')
  augroup vim-after-object
    autocmd!
    autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
  augroup END
endif
"}}}

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

  nmap <Space>ea <Plug>(EasyAlign)
  xmap <Space>ea <Plug>(EasyAlign)
  nmap <Space>el <Plug>(LiveEasyAlign)
  xmap <Space>el <Plug>(LiveEasyAlign)

  xnoremap <Space>es :EasyAlign \<CR>
  xnoremap <Space>e= :EasyAlign =<CR>
  xnoremap <Space>ee :EasyAlign =<CR>
  xnoremap <Space>e> :EasyAlign =><CR>
  xnoremap <Space>eh :EasyAlign =><CR>
  xnoremap <Space>e, :EasyAlign ,<CR>
  xnoremap <Space>e: :EasyAlign :<CR>
  xnoremap <Space>ec :EasyAlign :<CR>
endif
" }}}

"---------------------------------------------------------------------------
" for justinmk/vim-dirvish {{{2
if s:bundled('vim-dirvish')
  nnoremap <Space>f :<C-U>Dirvish<CR>

  " Dirvish上で renameできるよう以下設定
  let s:dirvish_rename_started_list = []

  function! s:start_rename_mode()
    echom 'start rename'
    " reload the Dirvish buffer
    Dirvish %

    let s:dirvish_rename_started_list = getbufline('%', 1, '$')
    let s:dirvish_save_conceallevel = &conceallevel
    if has('conceal')
      setlocal conceallevel=0
    endif
  endfunction

  function! s:stop_rename_mode()
    if empty(s:dirvish_rename_started_list)
      return
    endif

    " conceallevelを元に戻しておく
    if has('conceal')
      let &conceallevel = s:dirvish_save_conceallevel
    endif
    " 途中で関数を抜けたときに残らないようにローカル変数にコピーして空に
    let startedlist = s:dirvish_rename_started_list
    let s:dirvish_rename_started_list = []

    let endlist = getbufline('%', 1, '$')

    if endlist == startedlist
      echom 'no rename'
      return
    endif

    " reload the Dirvish buffer
    Dirvish %

    let reallist = getbufline('%', 1, '$')

    if reallist != startedlist
      echom 'no rename because some files have changed background'
      return
    endif

    if len(endlist) != len(reallist)
      echom 'no rename because file count have changed'
      return
    endif

    for i in range(len(endlist))
      if endlist[i] != reallist[i]
        echom 'rename' reallist[i] 'to' endlist[i]
        call rename(reallist[i], endlist[i])
      endif
    endfor
    echom 'end rename'

    " reload the Dirvish buffer
    Dirvish %
  endfunction

  augroup my_dirvish_events
    autocmd!
    " Rename mode
    autocmd FileType dirvish  nnoremap <silent><buffer> <Space>R :<C-u>call <SID>start_rename_mode()<CR>
    autocmd FileType dirvish  nnoremap <silent><buffer> <Space>r :<C-u>call <SID>stop_rename_mode()<CR>
    autocmd FileType dirvish  nmap <silent><buffer> h <Plug>(dirvish_up)
    autocmd FileType dirvish  nmap <silent><buffer> l <CR>
  augroup END
endif
" }}}

"---------------------------------------------------------------------------
" for justmao945/vim-clang {{{2
if s:bundled('vim-clang')
  let g:clang_auto = 0

  let g:clang_c_completeopt   = 'menuone'
  let g:clang_cpp_completeopt = 'menuone'

  let g:clang_c_options = '-std=c89'
  let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
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
  call submode#map('ex-move', 'nv', '', 's', '/')
  call submode#map('ex-move', 'nv', '', 'a', '*')
  call submode#map('ex-move', 'nv', '', 'b', 'N')
  call submode#map('ex-move', 'nv', '', 'f', 'n')

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
if s:bundled('vim-operator-replace')
  map s <Plug>(operator-replace)
  map S <Plug>(operator-replace)$
  " operator-replace from clipboard
  map <Space>s "*<Plug>(operator-replace)
  map <Space>S "*<Plug>(operator-replace)$
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
" for lambdalisue/pinkyless.vim {{{2
let g:pinkyless_capslock_trigger = ";<Tab>"
" }}}

"---------------------------------------------------------------------------
" for mattn/zencoding-vim {{{2
let g:user_emmet_leader_key = '<c-y>'
" }}}

"---------------------------------------------------------------------------
" for mhinz/vim-startify {{{2
if s:bundled('vim-startify')
  let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']
  if has('win32')
    let g:startify_skiplist = [
      \ escape($TMP, ' \'),
      \ escape($VIMBUNDLE, ' \').'\\.*\\doc',
      \ ]
  elseif has('unix')
    let g:startify_skiplist = [
      \ $TMPDIR,
      \ $VIMBUNDLE.'/.*/doc',
      \ ]
  endif
endif
" }}}

"---------------------------------------------------------------------------
" for nixprime/cpsm {{{2
" if s:bundled('cpsm')
"   let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
" endif
" }}}

"---------------------------------------------------------------------------
" for ntpeters/vim-better-whitespace {{{2
if s:bundled('vim-better-whitespace')
  let g:better_whitespace_filetypes_blacklist = [
    \ 'diff',
    \ 'gitcommit',
    \ 'dirvish',
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
" for rhysd/vim-clang-format {{{2
if s:bundled('vim-clang-format')
  command! -range=% -nargs=0 VClangFormat call clang_format#replace(<line1>, <line2>)

  map <silent><Space>x <Plug>(operator-clang-format)
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

  nnoremap [Git]d :<C-u>Gvdiffsplit<CR>
  nnoremap [Git]s :<C-u>Git<CR>
  nnoremap [Git]a :<C-u>Gwrite<CR>
  nnoremap [Git]A :<C-u>Gwrite <cfile><CR>
  nnoremap [Git]c :<C-u>Git commit -v<CR>
  nnoremap [Git]C :<C-u>Git commit --amend<CR>
  nnoremap [Git]b :<C-u>Git blame<CR>
  nnoremap [Git]p :<C-u>Git push<Space>
endif
" }}}

"---------------------------------------------------------------------------
" for tyru/nextfile.vim {{{2
if s:bundled('nextfile.vim')
  let g:nf_map_next = ''
  let g:nf_map_previous = ''

  if s:bundled('vim-submode')
    call submode#enter_with('nextfile', 'n', 'r', '<Leader>j', '<Nop>')
    call submode#map('nextfile', 'n', 'r', 'j', '<Plug>(nextfile-next)')
    call submode#map('nextfile', 'n', 'r', 'k', '<Plug>(nextfile-previous)')
  else
    let g:nf_map_next = '<Leader>jj'
    let g:nf_map_previous = '<Leader>jk'
  endif
endif
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
" for tyru/eskk.vim {{{2
let g:eskk#large_dictionary = {
  \	'path': '~/.eskk/SKK-JISYO.L',
  \	'sorted': 1,
  \	'encoding': 'euc-jp',
  \}
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
  cmap <C-k>  <Plug>(cmdline-switch)
endif
" }}}

"---------------------------------------------------------------------------
" for deris/vim-fitcolumn {{{2
if s:bundled('vim-fitcolumn')
  let g:fitcolumn_no_default_key_mappings = 1
  inoremap <expr> <C-k><C-k>  fitcolumn#fitabovecolumn({
    \ 'insertchar': ' ',
    \ })
  inoremap <expr> <C-k><C-j>  fitcolumn#fitbelowcolumn({
    \ 'insertchar': ' ',
    \ })
  imap <C-k><C-h>  <Plug>(fitcolumn-abovecolumn)
  imap <C-k><C-l>  <Plug>(fitcolumn-belowcolumn)
endif
" }}}

"---------------------------------------------------------------------------
" for deris/vim-multi-replace {{{2
if s:bundled('vim-multi-replace')
  map <Space>c  <Plug>(operator-multi-replace)
  map <Space>C  <Plug>(operator-multi-replace-cycle)
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
" local vimrc {{{1
let s:local_vimrc = has('unix') ?
  \ '~/.local_vimrc' :
  \ '~/_local_vimrc'
let s:local_vimrc = expand(s:local_vimrc)
if filereadable(s:local_vimrc)
  execute 'source ' . s:local_vimrc
endif
" }}}

"---------------------------------------------------------------------------
" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
" }}}

