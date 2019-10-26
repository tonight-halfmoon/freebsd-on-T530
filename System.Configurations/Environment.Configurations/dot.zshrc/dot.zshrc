#export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# Path to your oh-my-zsh installation.
export ZSH="/home/Amado2/.oh-my-zsh"

ZSH_THEME="gentoo_cyan" #"robbyrussell" # "gentoo" "takashiyoshida" "gianu" "sunaku" "maran" "essembeh" "jtriley"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
