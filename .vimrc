" color
syntax on
" disp number on the left (setting <C-n> Toggle)
set number
" disp tab and trail
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set list
set listchars=tab:»-,trail:-
set tags=~/.tags
" disp zenkakuspace
highlight ZenkakuSpace cterm=bold,reverse ctermfg=red guibg=red
match ZenkakuSpace /　/
" fuzzyfinder's popup menu's color
highlight Pmenu ctermfg=Gray ctermbg=DarkGray
highlight PmenuSel ctermfg=White ctermbg=Gray
" insert space insted of tab
set expandtab
set softtabstop=2
set shiftwidth=2
" show insite tab line
set showtabline=2
" for ○★etc
set ambiwidth=single
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"ファイル変更中でも他のファイルを開けるようにする
set hidden
"ファイル内容が変更されると自動読み込みする
set autoread
"検索結果をハイライトする
set hlsearch
" クリップボードの共有
set clipboard=unnamed,autoselect
" set paste on/off
"set pastetoggle=<C-P>
" delete key effect on insrt mode
set backspace=start,eol,indent
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
"swpファイルを作成しない
set noswapfile

" ESCキー2回で検索結果ハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" % move do <-> end
source /usr/share/vim/vim73/macros/matchit.vim
" n, N キーで「次の（前の）検索候補」を画面の中心に表示する
nnoremap n nzz
nnoremap N Nzz

" neobundle
set nocompatible
filetype off

" git clone https://github.com/Shougo/neobundle.vim ~/.vim/.bundle/neobundle.vim
if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/.bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/.bundle/'))

" :NeoBundleInstall
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:

" unite grep に必要
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'rails.vim'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'sakuraiyuta/commentout.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'cohama/agit.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'



" visibility {{{
" 保存状態未保存状態で下のラインの色が違うようになる。どれがどういう役割なのか不明
NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'LeafCage/foldCC'
NeoBundle 'bling/vim-airline' "これが保存状態未保存状態でステータスバーを色分けするプラグインみたいだ
NeoBundle 'osyo-manga/vim-over' "一括置き換え 使い方   :%s/置き換える文字/置き換え後の文字   みたいな
" }}}


"更新箇所がリアルタイムで分かる
" git {{{
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
" }}}



"色を変える。とりあえずいらないのでそのまま行こう
" colorschemes plugin {{{
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'baskerville/bubblegum'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle '29decibel/codeschool-vim-theme'
" }}}




" other programinng {{{
NeoBundle 'scrooloose/syntastic'
" }}}

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
" デフォルトでツリーを表示させる
"autocmd VimEnter * execute 'NERDTree'
NeoBundle 'The-NERD-tree'
" NERDTree {{{



call neobundle#end()
"----ネオバンドルのプラグインここまで----


" 上のカラーリングを適用させる。この条件はよくわからん
if stridx($TERM, 'xterm-256color') >= 0
  colorscheme hybrid
else
  colorscheme desert
endif



filetype plugin on
filetype indent on

" unite
" buffer file list
noremap fb :Unite buffer<CR>
" current directory file list <C-h> up directory, <CR> select directory
noremap fa :Unite file<CR>
" same directory file list <C-h> up directory, <CR> select directory
noremap ff :UniteWithBufferDir -buffer-name=files file<CR>
" recent file list
noremap fr :Unite file_mru<CR>
" recent and buffer file list
noremap fu :Unite buffer file_mru<CR>
" register(yank) list
noremap fy :Unite -buffer-name=register register<CR>
" book-mark list
noremap fm :Unite bookmark<CR>
" add book-mark
noremap ba :UniteBookmarkAdd<CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" 開いてすぐに文字列を書いて絞り込める
let g:unite_enable_start_insert = 1

" NERDTree
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
"autocmd vimenter * if !argc() | NERDTree | endif

" fugitive
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

" original
" 挿入モードで改行した時に # を自動挿入しない
" ノーマルモードで o や O をした時に # を自動挿入しない
autocmd FileType * setlocal formatoptions-=ro
" 挿入モードにならずに改行する
nnoremap <unique> <C-o> o<Esc><Down>
" shortcut key
nmap <C-n> :set invnumber<CR>
"nmap <C-h> :hide<CR>
nmap <C-w>a :vertical res 50
" Y キーで「カーソルから行末までコピー(Yank)」
nnoremap Y y$

" nmap <Leader>e :NERDTreeToggle<CR>

"ctrl + eでNERDtree表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"ウィンドウ間の移動
nnoremap <C-j> <ESC><C-w>j
nnoremap <C-k> <ESC><C-w>k
nnoremap <C-l> <ESC><C-w>l
nnoremap <C-h> <ESC><C-w>h


"http://qiita.com/mizukmb/items/ddb5a5bfa2ce223057cb ← ここをぱくった
"Shift + h で左端、 Shift + lで右端にカーソル移動。いちいち $ とか ^ を押す必要がない。 めっちゃ便利。
"noremap <S-h>   ^
"noremap <S-j>   }
"noremap <S-k>   {
"noremap <S-l>   $

"タブウインドウの拡大縮小
noremap <C-o>  <C-w>>
noremap <C-i>  <C-w><

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
"Linuxの場合はviminfoを用いてヤンクデータを共有
let OSTYPE = system('uname')
if OSTYPE == "Linux\n"
  noremap y y:wv<CR>
  noremap p :rv!<CR>p

  set viminfo='50,\"3000,:0,n~/.viminfo
endif
" 全角スペースをハイライト
"MyAutocmd ColorScheme * highlight ZenkakuSpace ctermbg=239 guibg=#405060
"MyAutocmd VimEnter,WinEnter * call matchadd('ZenkakuSpace', '　')
" ポップアップメニューのカラーを設定
"MyAutocmd Syntax * hi Pmenu ctermfg=15 ctermbg=18 guibg=#666666
"MyAutocmd Syntax * hi PmenuSel ctermbg=39 ctermfg=0 guibg=#8cd0d3 guifg=#666666
"MyAutocmd Syntax * hi PmenuSbar guibg=#333333
