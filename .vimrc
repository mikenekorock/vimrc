"syntax on
" disp number on the left (setting <C-n> Toggle)
set number
" disp tab and trail
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
"タブ、空白、改行の可視化
set list
set listchars=tab:».,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
" マウス選択でvisualにしない
" neovim用
set mouse=

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
set clipboard=unnamed ",autoselect
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
" 上部に表示される情報を非表示
let g:netrw_banner = 1
" 表示形式をTreeViewに変更
let g:netrw_liststyle = 3
" 左右分割を右側に開く
let g:netrw_altv = 1
" 分割で開いたときに85%のサイズで開く
let g:netrw_winsize = 85

let mapleader = " "
" ↓プラグインをインストールする場合はこんな感じ
" $ mkdir -p ~/.vim/bundle
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" $ vim ←vimを開く
" :PluginInstall
if &compatible
  set nocompatible
endif
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" brew install denoとかでdenoをインストールする
Plugin ('vim-denops/denops.vim')
Plugin ('vim-denops/denops-helloworld.vim')
Plugin ('Shougo/ddu.vim')
Plugin ('Shougo/ddu-ui-ff')
Plugin ('Shougo/ddu-source-file_rec')
Plugin ('Shougo/ddu-kind-file')
Plugin ('Shougo/ddu-filter-matcher_substring')

" brew install ripgrep とか必要
" :checkhealth telescope で必要ライブラリを確認
Plugin ('nvim-lua/plenary.nvim')
Plugin ('nvim-telescope/telescope.nvim'), { 'tag': '0.1.3' }
" Find files using Telescope command-line sugar.
nnoremap ff :Telescope find_files<CR>
nnoremap fg :Telescope live_grep<cr>
nnoremap fb :Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"Plugin ('Shougo/ddu-ui-filer')
"Plugin ('shun/ddu-source-rg')
"Plugin ('Shougo/ddu-kind-file')
"Plugin ('Shougo/ddu-filter-matcher_substring')
Plugin ('Shougo/neomru.vim')
Plugin ('mattn/emmet-vim')
Plugin ('scrooloose/nerdtree')
"Plugin ('Xuyuanp/nerdtree-git-plugin')
Plugin ('posva/vim-vue')
"Plugin ('vim-scripts/rails.vim')
"Plugin ('vim-scripts/dbext.vim')
"Plugin ('thinca/vim-ref')
"Plugin ('vim-ruby/vim-ruby')
"Plugin ('sakuraiyuta/commentout.vim')
Plugin ('rking/ag.vim')
Plugin ('cohama/agit.vim')
"Plugin ('tpope/vim-rails')
"Plugin ('tpope/vim-endwise')
"Plugin ('kchmck/vim-coffee-script')
Plugin ('osyo-manga/vim-anzu')
"Plugin ('uupaa/ts.md')
"Plugin ('Shougo/neosnippet.vim')
"Plugin ('Shougo/neocomplcache')
"
"Plugin ('Shougo/context_filetype.vim')
"Plugin ('osyo-manga/vim-precious')
"
" visibility {{{
" 保存状態未保存状態で下のラインの色が違うようになる。どれがどういう役割なのか不明
Plugin ('nathanaelkane/vim-indent-guides')
Plugin ('bling/vim-airline') "保存状態未保存状態でステータスバーを色分けするプラグイン
"Plugin ('osyo-manga/vim-over') "一括置き換え 使い方   :%s/置き換える文字/置き換え後の文字   みたいな
" }}}
"
"
" git {{{
" Gblameとかで色々見れる
Plugin ('tpope/vim-fugitive')
" 更新箇所がリアルタイムで分かる
Plugin ('airblade/vim-gitgutter')
" }}}
"
"
"
" カラースキーム。:colorschemeなんちゃら〜で変えれる。
" 使いたい場合はコメントアウト外してインストールしてね。
" colorschemes plugin {{{
"Plugin ('baskerville/bubblegum')
Plugin ('nanotech/jellybeans.vim')
Plugin ('sjl/badwolf')
"Plugin ('vim-scripts/newspaper.vim')
"Plugin ('w0ng/vim-hybrid')
"Plugin ('vim-scripts/twilight')
"Plugin ('jonathanfilip/vim-lucius')
"Plugin ('jpo/vim-railscasts-theme')
"Plugin ('29decibel/codeschool-vim-theme')
Plugin ('lifepillar/vim-solarized8')
"Plugin ('altercation/vim-colors-solarized')
Plugin ('KKPMW/moonshine-vim')
"Plugin ('KKPMW/sacredforest-vim')
Plugin ('machakann/vim-colorscheme-tatami')
Plugin ('gmarik/Vundle.vim')
Plugin ('slim-template/vim-slim')
" }}}
Plugin ('vim-jp/vimdoc-ja')
" other programinng {{{
"Plugin ('scrooloose/syntastic') " シンタックスエラーチェック。スコープがおかしいと教えてくれたりする
" }}}


"新しいプラグインを入れた場合は→:call dein#install()
call vundle#end()
filetype plugin indent on
"----プラグインここまで----

"autocmd BufNewFile,BufRead *.vue set filetype=html
autocmd BufNewFile,BufRead *.ts set filetype=javascript
autocmd BufNewFile,BufRead *.eco set filetype=html
autocmd BufNewFile,BufRead *.jb set filetype=ruby

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
syntax enable
set background=light
set t_Co=256
" カラーリングを適用させる
"let g:solarized_use16 = 1
if stridx($TERM, 'xterm-256color') >= 0
  "colorscheme desert
  "colorscheme railscasts
  "colorscheme codeschool
  "colorscheme lucius
  "colorscheme bubblegum
  colorscheme jellybeans
  "colorscheme badwolf
 " colorscheme moonshine_lowcontrast
  "colorscheme tatami
  "let g:solarized_termcolors=256
 " colorscheme solarized8
  "colorscheme hybrid
  "colorscheme twilight
else
  "colorscheme hybrid
endif

filetype plugin on
filetype indent on

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" 開いてすぐに文字列を書いて絞り込める
let g:unite_enable_start_insert = 1

" NERDTreeのキーバインド。Ctrl + eで閉じたり開いたりできるよ
nmap <silent> <C-e>      :NERDTreeToggle<CR>

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
" Y キーで「カーソルから行末までコピー(Yank)」
nnoremap Y y$

"ウィンドウ間の移動
nnoremap <C-j> <ESC><C-w>j
nnoremap <C-k> <ESC><C-w>k
nnoremap <C-l> <ESC><C-w>l
nnoremap <C-h> <ESC><C-w>h

" Ctrl + sで保存（insert時）
inoremap <C-s> <C-o>:w<Enter>
" Ctrl + sで保存（normal時）
nnoremap <C-s> :w<Enter>

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
"nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
nnoremap sub <CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
"nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

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

" インデントを半角スペース4つにする。基本いらない
"set tabstop=4
"set autoindent
"set expandtab
"set shiftwidth=4
