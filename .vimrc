" color
"syntax on
" disp number on the left (setting <C-n> Toggle)
set number
" disp tab and trail
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
"タブ、空白、改行の可視化
set list
set listchars=tab:».,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

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
"ファイル変更中でも他のファイルを開けるようにする
set hidden
"ファイル内容が変更されると自動読み込みする
set autoread
"検索結果をハイライトする
set hlsearch
" 1文字検索ごとに検索を行う
set incsearch
" クリップボードの共有
set clipboard=unnamed,autoselect
" set paste on/off
"set pastetoggle=<C-P>
" delete key effect on insrt mode
set backspace=start,eol,indent
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2

"swpファイルを作成しない
set noswapfile

" ESCキー2回で検索結果ハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" % move do <-> end
source $VIMRUNTIME/macros/matchit.vim
" n, N キーで「次の（前の）検索候補」を画面の中心に表示する
nnoremap n nzz
nnoremap N Nzz

filetype off

let g:dein#auto_recache = 1
" ↓プラグインをインストールする場合はこんな感じ
" $ mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
" $ git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim
" $ vim ←vimを開く
" :call dein#install()
if &compatible
  set nocompatible
endif
set runtimepath^=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
" ↓のディレクトリにプラグインのデータが入る
  call dein#begin('~/.cache/dein/')

 " Required:
  call dein#add('Shougo/dein.vim')


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
  ":Unite -auto-preview colorschemeでカラースキームのリアルプレビュー、しゅごい・・・
  call dein#add ('ujihisa/unite-colorscheme')
  call dein#add ('Shougo/neomru.vim')
  call dein#add ('scrooloose/nerdtree')
  call dein#add ('Xuyuanp/nerdtree-git-plugin')
  call dein#add ('posva/vim-vue')
  "call dein#add ('vim-scripts/rails.vim')
  "call dein#add ('vim-scripts/dbext.vim')
  "call dein#add ('thinca/vim-ref')
  "call dein#add ('vim-ruby/vim-ruby')
  "call dein#add ('sakuraiyuta/commentout.vim')
  call dein#add ('rking/ag.vim')
  call dein#add ('cohama/agit.vim')
  "call dein#add ('tpope/vim-rails')
  "call dein#add ('tpope/vim-endwise')
  "call dein#add ('kchmck/vim-coffee-script')
  call dein#add ('osyo-manga/vim-anzu')
  "call dein#add ('uupaa/ts.md')

  "call dein#add ('Shougo/neosnippet.vim')
  "call dein#add ('Shougo/neocomplcache')

  "call dein#add ('Shougo/context_filetype.vim')
  "call dein#add ('osyo-manga/vim-precious')

  " visibility {{{
  " 保存状態未保存状態で下のラインの色が違うようになる。どれがどういう役割なのか不明
  call dein#add ('nathanaelkane/vim-indent-guides')
  call dein#add ('bling/vim-airline') "保存状態未保存状態でステータスバーを色分けするプラグイン
 " call dein#add ('osyo-manga/vim-over') "一括置き換え 使い方   :%s/置き換える文字/置き換え後の文字   みたいな
  " }}}


  " git {{{
  " Gblameとかで色々見れる
  call dein#add ('tpope/vim-fugitive')
  " 更新箇所がリアルタイムで分かる
  call dein#add ('airblade/vim-gitgutter')
  " }}}



  " カラースキーム。:colorschemeなんちゃら〜で変えれる。
  " 使いたい場合はコメントアウト外してインストールしてね。
  " colorschemes plugin {{{
  "call dein#add ('baskerville/bubblegum')
  call dein#add ('nanotech/jellybeans.vim')
  call dein#add ('sjl/badwolf')
  call dein#add ('nightsense/stellarized')
  "call dein#add ('vim-scripts/newspaper.vim')
  "call dein#add ('w0ng/vim-hybrid')
  "call dein#add ('vim-scripts/twilight')
  "call dein#add ('jonathanfilip/vim-lucius')
  call dein#add ('jpo/vim-railscasts-theme')
  "call dein#add ('29decibel/codeschool-vim-theme')
  call dein#add ('lifepillar/vim-solarized8')
  "call dein#add ('altercation/vim-colors-solarized')
  call dein#add ('KKPMW/moonshine-vim')
  call dein#add ('KKPMW/sacredforest-vim')
  call dein#add ('machakann/vim-colorscheme-tatami')
  " }}}

  " other programinng {{{
  "call dein#add ('scrooloose/syntastic') " シンタックスエラーチェック。スコープがおかしいと教えてくれたりする
  " }}}


  "新しいプラグインを入れた場合は→:call dein#install()
  call dein#end()
  call dein#save_state()
endif
"----プラグインここまで----

" プラグインを削除するとキャッシュを更新しないと反映されない
"call map(dein#check_clean(), "delete(v:val, 'rf')")
"call dein#recache_runtimepath()
autocmd BufNewFile,BufRead *.vue set filetype=html
autocmd BufNewFile,BufRead *.ts set filetype=javascript
autocmd BufNewFile,BufRead *.eco set filetype=html

  let g:NERDTreeDirArrows = 1
  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'
  " 隠しファイルをデフォルトで表示させる
  let NERDTreeShowHidden = 1
syntax enable
set background=light
"set t_Co=256
" カラーリングを適用させる
"let g:solarized_use16 = 1
if stridx($TERM, 'xterm-256color') >= 0
  "colorscheme desert
  "colorscheme railscasts
  "colorscheme codeschool
  "colorscheme lucius
  "colorscheme bubblegum
  "colorscheme jellybeans
  "colorscheme badwolf
 " colorscheme moonshine_lowcontrast
 " colorscheme stellarized
  "colorscheme tatami
  "let g:solarized_termcolors=256
  colorscheme solarized8
  "colorscheme hybrid
  "colorscheme twilight
else
  "colorscheme hybrid
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
noremap fm :Unite bookmark:*<CR>
" add book-mark
noremap ba :UniteBookmarkAdd<CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" 開いてすぐに文字列を書いて絞り込める
let g:unite_enable_start_insert = 1

" NERDTreeのキーバインド。Ctrl + eで閉じたり開いたりできるよ
nmap <silent> <C-e>      :NERDTreeToggle<CR>
"vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
"omap <silent> <C-e>      :NERDTreeToggle<CR>
"imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
"cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
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

"ウィンドウ間の移動
nnoremap <C-j> <ESC><C-w>j
nnoremap <C-k> <ESC><C-w>k
nnoremap <C-l> <ESC><C-w>l
nnoremap <C-h> <ESC><C-w>h
"noremap <S-k>   {
"noremap <S-l>   $

"タブウインドウの拡大縮小
noremap <C-o>  <C-w>>
noremap <C-i>  <C-w><

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
"let OSTYPE = system('uname')
"if OSTYPE == "Linux\n"
"  noremap y y:wv<CR>
"  noremap p :rv!<CR>p
"endif

"set viminfo='50,\"3000,:0,n~/.viminfo
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

" vim-anzuのキーバインド
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
