export TERM=screen-256color

export HISTFILE=~/.hist-zsh
export HISTSIZE=100000
export SAVEHIST=100000
bindkey -e # emacs

autoload -U compinit
compinit

autoload -U select-word-style
select-word-style bash

bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey "^[f" forward-word
bindkey "^[b" backward-word
bindkey ' ' magic-space

# global alias
alias -g H='| head'
alias -g G='| grep'
alias -g Gi='| grep -i'
alias -g J='| python -mjson.tool'
alias -g L='| less -R'
alias -g P='| peco'
alias -g T='| tail'
alias -g TE='| tee tee.log'

source ~/.bashrc.alias

case $(uname -s) in
    Darwin|FreeBSD)
        alias ls="ls -hFG"
        ;;
    Linux)
        alias ls="ls --color=always -hF"
        ;;
    NetBSD|OpenBSD)
        alias ls="ls -hF"
        ;;
esac

## common prompt
# PROMPT="%m:%n%% "
PROMPT=$'%{\e[$[31+RANDOM%6]m%}%m:%n%{\e[m%}%% '
RPROMPT="[%~]"
SPROMPT="correct: %R -> %r ? "

autoload -U is-at-least
if is-at-least 4.3.10; then
    autoload -Uz promptinit
    promptinit
    prompt adam2
fi
zstyle :compinstall filename '/home/masaru/.zshrc'
zstyle ':completion:*' list-colors ''
# complete even if using sudo
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
zstyle ':completion:*:date:*' fake \
    '+%Y-%m-%d:西暦-月-日' \
    '+%Y/%m/%d %H\:%M\:%S: 西暦/月/日 時\:分\:秒'
zstyle ':completion:*:date:*' menu yes select=2

#zstyle ':completion:*:gisty:*' list help post sync_delete sync about private_post pull_all
#   '*:tail:_files'

# setopt/unsetopt
# no/little side effect - Mr.Hirose
# default.zshrc - Mr.Hirose
setopt auto_cd auto_name_dirs auto_pushd # $cd - [tab]
setopt extended_history hist_ignore_dups hist_ignore_space prompt_subst
#setopt extended_glob
setopt list_types no_beep always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys pushd_ignore_dups
setopt noclobber # prevents you from accidentally overwriting an existing file.

# Chapter3. History
setopt hist_no_store hist_reduce_blanks hist_save_no_dups share_history

setopt correct
# 補完
setopt auto_list magic_equal_subst
setopt list_packed
setopt auto_remove_slash    # 好みが分かれるところ

# id:secondlife
# http://hatena.g.hatena.ne.jp/hatenatech/20060517
setopt append_history
setopt auto_menu
setopt auto_param_slash
setopt brace_ccl # enable expand {a-c} => a b c
setopt equals # expand: =command => `which command`
setopt autopushd # pushd by 'cd -[tab]

export DOTFILES=~/.dotfiles
export EDITOR="vim"
export LESS='-R'
export PATH=/usr/local/bin:"$PATH":~/bin
export JAVA_FONTS=/usr/share/fonts/TTF
export DROPBOX=~/Dropbox
export GISTY_DIR="$HOME/dev/gists"
export GISTY_SSL_VERIFY="NONE"
export PAGER=less

function mkcd() {
    mkdir -p $@ && cd $@
}

function google() {
    local str opt
    if [ $# != 0 ]; then # 引数が存在すれば
        for i in $*; do
            str="$str+$i"
        done
        str=`echo $str | sed 's/^\+//'` #先頭の「+」を削除
        opt='search?num=30&hl=ja&lr=lang_ja'
        opt="${opt}&q=${str}"
    fi
    w3m http://www.google.co.jp/$opt #引数がなければ $opt は空になる
}
alias ggl=google

function l(){
  if [ $# -lt 1 ]
  then
      ls
  else
      if [ -f "$1" ]
      then
          less "$1"
      else
          ls "$1"
      fi
  fi
}

# http://signalboxes.net/configs/bashrc-for-linux-and-mac/
ex () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xjf $1 ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       rar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xf $1        ;;
            *.tbz2)      tar xjf $1      ;;
            *.tgz)       tar xzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *) echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

## http://d.hatena.ne.jp/mollifier/20100906
# gitの作業ディレクトリに変更があるか。
if is-at-least 4.3.10; then
    autoload -Uz add-zsh-hook
    autoload -Uz colors
    colors
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git hg  # bzr svn
    zstyle ':vcs_info:*' formats '(%s)-[%b]'
    zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
    #zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
    zstyle ':vcs_info:bzr:*' use-simple true

    autoload -Uz is-at-least
    # この check-for-changes が今回の設定するところ
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
    zstyle ':vcs_info:git:*' unstagedstr "-"  # 適当の文字列に変更する
    zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
    zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'

    function _update_vcs_info_msg() {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    }
    add-zsh-hook precmd _update_vcs_info_msg
    RPROMPT="%1(v|%F{green}%1v%f|)"
fi

function gittips {
    cat <<EOH
  stash save -u,--include-untracked
EOH
}

function ta(){
    exists=`tmux ls|grep window|wc -l`
    if [ $exists -eq 0 ] ; then
        tmux -2 -u
    elif [ $exists -gt 0 ] ; then
        tmux -2 -u attach -d
    fi
}
# zsh-competions
# fpath=(/usr/local/share/zsh-completions $fpath)
#
# Enable C-s after C-r (search-history-backward)
stty stop undef

# Report CPU usage for commands running longer than 10 seconds
REPORTTIME=10

# peco

function peco-select-history() {
    typeset tac
    if which tac > /dev/null; then
        tac=tac
    else
        tac='tail -r'
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle redisplay
}

function peco-pkill() {
    for pid in `ps aux | peco | awk '{ print $2 }'`
    do
        kill $pid
        echo "Killed ${pid}"
    done
}
alias pk="peco-pkill"

## tmux (auto start)
is_screen_running() {
  [ ! -z "$WINDOW" ]
}

is_tmux_running() {
  [ ! -z "$TMUX" ]
}

is_screen_or_tmux_running() {
  is_screen_running || is_tmux_running
}

shell_has_started_interactively() {
  [ ! -z "$PS1" ]
}

resolve_alias() {
  cmd="$1"
  while
    whence "$cmd" >/dev/null 2>/dev/null \
    && [ "$(whence "$cmd")" != "$cmd" ]
  do
    cmd=$(whence "$cmd")
  done
  echo "$cmd"
}

exist_tmux() {
    which tmux >/dev/null 2>&1
}

tmux_attach_or_launch() {
    if ! exist_tmux ; then
        echo tmux is not found... >&2
        return
    fi

    count=$(tmux ls |wc -l)
    if [ "$count" -eq "0" ] ; then
        # -u flag explicitly informs tmux that UTF-8 is supported.
        tmux -u
    else
        tmux -u attach
    fi
}

if ! is_screen_or_tmux_running && shell_has_started_interactively; then
    if whence tmux >/dev/null 2>/dev/null; then
      # $(resolve_alias "$cmd")
      # Fix to show CJK chars on MSYS2
      # $(resolve_alias "$cmd") -u
      tmux_attach_or_launch
    fi
fi

[ -f $DOTFILES/zsh/http_status_codes.zsh ] && source $DOTFILES/zsh/http_status_codes.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh
[ -f $HOME/.asdf/completions/asdf.bash ] && source $HOME/.asdf/completions/asdf.bash

source $DOTFILES/zsh/zplug-init.zsh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# profiling
if (which zprof >/dev/null 2>&1) ;then
    zprof | less
fi
