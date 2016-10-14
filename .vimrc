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
"set whichwrap=b,s,h,l,<,>,[,]
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
"set nocompatible
filetype off

" git clone https://github.com/Shougo/neobundle.vim ~/.vim/.bundle/neobundle.vim
if &compatible
  set nocompatible
endif
set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim
" ↓のディレクトリにプラグインのデータが入る
call dein#begin(expand('~/.vim/dein/'))

" :NeoBundleInstall
" Let NeoBundle manage NeoBundle
" Required:
call dein#add('Shougo/dein.vim')

" My Bundles here:

" unite grep に必要
call dein#add ('Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ })

call dein#add ('Shougo/unite.vim')
call dein#add ('Shougo/neomru.vim')
call dein#add ('scrooloose/nerdtree')
call dein#add ('rails.vim')
call dein#add ('vim-scripts/dbext.vim')
call dein#add ('thinca/vim-ref')
call dein#add ('vim-ruby/vim-ruby')
call dein#add ('sakuraiyuta/commentout.vim')
call dein#add ('rking/ag.vim')
call dein#add ('cohama/agit.vim')
call dein#add ('tpope/vim-rails')
call dein#add ('tpope/vim-endwise')
call dein#add ('tpope/vim-fugitive')
call dein#add ('kchmck/vim-coffee-script')
call dein#add ('osyo-manga/vim-anzu')


" visibility {{{
" 保存状態未保存状態で下のラインの色が違うようになる。どれがどういう役割なのか不明
call dein#add ('nathanaelkane/vim-indent-guides')
"call dein#add 'LeafCage/foldCC'
call dein#add ('bling/vim-airline') "これが保存状態未保存状態でステータスバーを色分けするプラグインみたいだ
call dein#add ('osyo-manga/vim-over') "一括置き換え 使い方   :%s/置き換える文字/置き換え後の文字   みたいな
" }}}


"更新箇所がリアルタイムで分かる
" git {{{
call dein#add ('tpope/vim-fugitive')
call dein#add ('airblade/vim-gitgutter')
" }}}



"色を変える。とりあえずいらないのでそのまま行こう
" colorschemes plugin {{{
call dein#add ('altercatiVon/vim-colors-solarized')
call dein#add ('baskerville/bubblegum')
call dein#add ('nanotech/jellybeans.vim')
call dein#add ('w0ng/vim-hybrid')
call dein#add ('vim-scripts/twilight')
call dein#add ('jonathanfilip/vim-lucius')
call dein#add ('jpo/vim-railscasts-theme')
call dein#add ('29decibel/codeschool-vim-theme')
" }}}




" other programinng {{{
call dein#add ('scrooloose/syntastic')
" }}}

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
" デフォルトでツリーを表示させる
"autocmd VimEnter * execute 'NERDTree'
"↓古いバージョンのnerdtree??まあ不要だと思う
"NeoBundle 'The-NERD-tree'
" NERDTree {{{


"新しいプラグインを入れた場合は→::call dein#install()
call dein#end()
"----ネオバンドルのプラグインここまで----
set background=dark
" 上のカラーリングを適用させる。この条件はよくわからん
if stridx($TERM, 'xterm-256color') >= 0
  "colorscheme desert
  "colorscheme railscasts
  "colorscheme codeschool
  "colorscheme lucius
  "colorscheme solarized
  "colorscheme bubblegum
  colorscheme jellybeans
  "colorscheme hybrid
  "colorscheme twilight
else
  colorscheme hybrid
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

" HTML(とXML?)に閉じタグを自動で入れる
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-n-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
augroup END
