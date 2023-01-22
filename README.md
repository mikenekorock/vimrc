## .vimrc
↓プラグインをインストールする場合はこんな感じ 
```bash
$ mkdir -p ~/.vim/bundle
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ vim
※vimが起動してエラーがいっぱい出るけど気にしない。normalモードで下記を打つ
:PluginInstall
```

## .screenrc
なんとなく作った。

## シンボリックリンクを作って共有する(macの場合)
```bash
# 前提：/Users/{ユーザー名}/work_space/ にgit cloneしている
# vimに反映させたい
$ ln -s /Users/{ユーザー名}/work_space/vimrc/.vimrc .vimrc

# neovimに反映させたい
$ ln -s /Users/{ユーザー名}/work_space/vimrc/.vimrc .config/nvim/init.vim
```
