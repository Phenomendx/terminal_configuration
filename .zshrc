# customize search command within vim instance
export FZF_DEFAULT_COMMAND='find .'
# customize search command within shell instance
export FZF_CTRL_T_COMMAND='find .'

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
bindkey ';' fzf-file-widget

alias gb="git branch"
alias gc="git commit -m"
alias gch="git checkout"
alias gl="git log"
alias ga="git add"
alias gp="git pull"
alias gpu="git push"
alias gpu="git push --force"
alias gs="git status"


alias ,ez="nvim ~/.zshrc"
alias ,sz="source ~/.zshrc"
alias ,ev="nvim EDIT_VIMRC"
alias ,sv="source SOURCE_VIMRC "
