export ZSH="/home/federico/.oh-my-zsh"

# https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="cypher"
plugins=(git common-aliases sublime sudo colored-man-pages)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR=$(which nvim)
export BAT_STYLE="numbers,grid"
alias cat=bat

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
