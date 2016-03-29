alias yum='sudo yum'
alias yi='yum install -y'
alias ys='yum search'
alias yu='yum update'
alias yyu='yum upgrade'

function yh {
  cat $DOTFILES/zsh/centos.zsh
}

function _epel {
  yum install epel-release
}

function _install_devel {
  sudo yum groupinstall "Development Tools"
}

function setup_centos {
    _epel
    _install_devel
}
