export ZSH="$HOME/.oh-my-zsh"
export FZF_DEFAULT_COMMAND='find . -type f'

source $ZSH/oh-my-zsh.sh

bindkey ';' fzf-file-widget
alias ,ez="nvim ~/.zshrc"
alias ,sz="source ~/.zshrc"
alias ,ev="nvim /Users/mihailiurco/.config/nvim/init.vim"
alias ,sv="source /Users/mihailiurco/.config/nvim/init.vim"
