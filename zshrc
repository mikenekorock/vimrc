export LSCOLORS="dxfxcxdxbxegedabagacad"
export LS_COLORS='di=33;:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export GREP_COLOR='1;33'

# PROMPTテーマ
setopt prompt_subst #プロンプト表示する度に変数を展開
local BLACK=$'%{\e[30m%}'
local RED=$'%{\e[31m%}'
local GREEN=$'%{\e[32m%}'
local YELLOW=$'%{\e[33m%}'
local BLUE=$'%{\e[34m%}'
local PURPLE=$'%{\e[35m%}'
local CYAN=$'%{\e[36m%}'
local GRAY=$'%{\e[37m%}'
local WHITE=$'%{\e[1;37m%}'
local DEFAULT=$'%{\e[1;m%}'
local RAINBOW=$'%{\e[$[color=$[31+$RANDOM%6]]m%}'
PROMPT="
${CYAN}%~${reset_color}
$ "

autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true      # formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{red}"         # commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{red}"       # add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{green}%b %c%u%m %f" # 通常
zstyle ':vcs_info:*' actionformats '[%b|%a]'         # rebase 途中,merge コンフリクト等 formats 外の表示
precmd () { vcs_info }
PROMPT="
${CYAN}%~${reset_color}"
PROMPT=$PROMPT'  ${vcs_info_msg_0_}
${GRAY}$ ${reset_color}'

zstyle ':vcs_info:git+set-message:*' hooks git-is_clean git-untracked
# 状態がクリーンか判定
function +vi-git-is_clean(){
    if [ -z "$(git status --short 2>/dev/null)" ];then
        hook_com[misc]+="✔"
    fi
}
# unstaged, untrackedの検知
function +vi-git-untracked() {
    if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
        hook_com[unstaged]+='%F{red}✗%f'
    fi
}
#PROMPT="%F{010}%~%f %#
#"
colorlist() {
  for color in {000..015}; do
    print -nP "%F{$color}$color %f"
  done
  printf "\n"
  for color in {016..255}; do
    print -nP "%F{$color}$color %f"
    if [ $(($((color-16))%6)) -eq 5 ]; then
      printf "\n"
    fi
  done
}
# cd などでの選択時、カーソルで移動できたり色付きになったり
autoload -U compinit && compinit
# Tabで選択できるように
zstyle ':completion:*:default' menu select=2
# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
setopt auto_param_slash       # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs              # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt auto_menu              # 補完キー連打で順に補完候補を自動で補完
#setopt interactive_comments   # コマンドラインでも # 以降をコメントと見なす
#setopt magic_equal_subst      # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt complete_in_word       # 語の途中でもカーソル位置で補完
setopt print_eight_bit        # 日本語ファイル名等8ビットを通す
#setopt extended_history       # record timestamp of command in HISTFILE
#setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt share_history          # 他のターミナルとヒストリーを共有
setopt histignorealldups      # ヒストリーに重複を表示しない
setopt hist_save_no_dups      # 重複するコマンドが保存されるとき、古い方を削除する。
setopt extended_history       # $HISTFILEに時間も記録
setopt print_eight_bit        # 日本語ファイル名を表示可能にする
setopt hist_ignore_all_dups   # 同じコマンドをヒストリに残さない
#setopt auto_cd                # ディレクトリ名だけでcdする
#setopt no_beep                # ビープ音を消す
## コマンドを途中まで入力後、historyから絞り込み
autoload -Uz history-search-end
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
alias l='ls -ltrG'
alias la='ls -laG'
alias ll='ls -lG'
alias ls='ls -G'

alias grep='grep --color=auto'
alias ...='cd ../../'
alias his='history -E -i 1'
