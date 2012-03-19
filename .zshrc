# Lines configured by zsh-newuser-install
HISTFILE=~/.hist-zsh
HISTSIZE=100000
SAVEHIST=100000
bindkey -e # emacs
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

autoload -U compinit
compinit
# End of lines added by compinstall
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
alias -g L='| less -R'
alias -g T='| tail'
alias -g TE='| tee tee.log'

alias calc='xcalc'
#alias cp -r = 'cp -rp'
alias df='df -h'
alias du='du -h'
alias d0='du -0'
alias lessn='less -N'
#alias l='ls'
alias ls='ls -F -h --color=always'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias lt='ls -lrt'
alias llt='ls -lrt'
alias llat='ls -lart'
alias rl='rlwrap'
alias sl='ls'
alias so='source $HOME/.zshrc'
alias vi='vim'
alias wrap='rlwrap'
alias xcalc='xcalc -rpn'
alias yc='yaourt -Sc'
alias ycc='yaourt -Scc'
alias yh='echo_yaourt_aliases'
alias yi='yaourt -S'
alias yr='yaourt -R'
alias ys='yaourt -Ss'
alias yy='yaourt -Sy'
alias yyy='sudo rm /var/lib/pacman/db.lck'
echo_yaourt_aliases(){
echo "List of aliases
alias yc='yaourt -Sc'
alias ycc='yaourt -Scc'
alias yh='echo_yaourt_aliases'
alias yi='yaourt -S'
alias yqo='yaourt -Qo'
alias yr='yaourt -R'
alias ys='yaourt -Ss'
alias yy='yaourt -Sy'
alias yyy='sudo rm /var/lib/pacman/db.lck'"

#    echo "yi: install (yaourt -S)\nys: update&search (yaourt -Ss)\nyy: update&install (yaourt -Sy)\nyc: clean (yaourt -Sc)\nycc: clean (yaourt -Scc)\nremove : yaourt -R"
}

## interpreter
alias clj='rlwrap clj'
alias clojure='clj'
alias gosh='rlwrap gosh'
alias sbcl='rlwrap sbcl'

## perl
alias perl='perl -w'
# input/output
# alias perl_o='perl -wl'
# alias perl_io='perl -wln'
# alias perl_iop='perl -wlp'
alias perltest='prove -lr t'
# git
alias gg='git grep -n'

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
zstyle ':completion:*' hosts \
    proxy.kuins.net:8080 \
    182.163.78.215
#compdef for gisty
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

export EDITOR="vim"
export LESS='-R'
export PATH=$PATH:~/.gem/ruby/1.9.1/bin:~/bin
export JAVA_FONTS=/usr/share/fonts/TTF
export DROPBOX=~/Dropbox
export GISTY_DIR="$HOME/dev/gists"
export GISTY_SSL_VERIFY="NONE"
export PAGER=less

proxy(){
    export http_proxy='http://proxy.kuins.net:8080'
    export https_proxy='http://proxy.kuins.net:8080'
    export ftp_proxy='http://proxy.kuins.net:8080'
    echo 'use_proxy=on' > ~/.wgetrc
}
unproxy(){
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    echo 'use_proxy=off' > ~/.wgetrc
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

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/perl5/perlbrew/etc/bashrc ] && source ~/perl5/perlbrew/etc/bashrc
[ -f ~/.rvm/scripts/rvm ] && source ~/.rvm/scripts/rvm

