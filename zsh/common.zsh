HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

## 補完機能の強化
autoload -U compinit
compinit

## プロンプトの設定
autoload colors
colors

precmd () {
  PROMPT=$'%{\e[0;33m%}%* %%%{\e[m%} '
}
RPROMPT=$'%{\e[32m%}%/%{\e[m%}'

## コアダンプサイズを制限
limit coredumpsize 102400

## 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr

## 色を使う
setopt prompt_subst

## ビープを鳴らさない
setopt nobeep

## 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs

## 補完候補一覧でファイルの種別をマーク表示
setopt list_types

## サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume

## 補完候補を一覧表示
setopt auto_list

## 補完候補を詰めて表示
setopt list_packed

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

## cd 時に自動で push
setopt autopushd

## 同じディレクトリを pushd しない
setopt pushd_ignore_dups

## ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob

## TAB で順に補完候補を切り替える
setopt auto_menu

## zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt extended_history

## =command を command のパス名に展開する
setopt equals

## --prefix=/usr などの = 以降も補完
setopt magic_equal_subst

## ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify

# ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort

## 出力時8ビットを通す
setopt print_eight_bit

## ヒストリを共有
setopt share_history

setopt auto_pushd 

## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1


## 補完候補の色づけ
#eval `dircolors`
export LSCOLORS=gxfxxxxxcxxxxxxxxxxxxx

export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;36:cd=43;36:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## ディレクトリ名だけで cd
setopt auto_cd

## カッコの対応などを自動的に補完
setopt auto_param_keys

## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

## スペルチェック
setopt correct

## エイリアス
setopt complete_aliases

case "${OSTYPE}" in
freebsd*|darwin*)
alias ls="ls -G -w"
;;
linux*)
alias ls="ls --color"
;;
esac
alias la="ls -a"
alias lf="ls -F"
alias ll='ls -Flh --time-style=+" %Y/%m/%d %H:%M:%S "'
alias du="du -h"
alias df="df -h"

## 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash

alias rgrep='find . -type f -print0 | xargs -0 grep'
alias ntpdate='sudo ntpdate -v ntp.nict.jp'
alias vi=vim
alias cp='cp -p'
