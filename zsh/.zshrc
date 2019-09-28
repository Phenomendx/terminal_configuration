# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/xxxx/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
docker
docker-compose
git
copyfile
copydir
copybuffer
mvn
aws
terraform
themes
jump
spring
zsh-autosuggestions
kubectl
helm
httpie
minikube
golang
)

source $ZSH/oh-my-zsh.sh

# User configuration

export GOPATH=$HOME/go
export GOBIN=~/devtools/vim-go-bin
export PATH=$PATH:$GOBIN

# Language Service Protocol implementations
export PATH=$PATH:~/devtools/terraform-lsp

export M2_CLASSPATH=~/.m2/repository
#export CLASSPATH=~/.m2/repository/org/mockito/mockito-core/2.23.4/mockito-core-2.23.4.jar

aws-login() {
  ACCOUNTS=""
  ACCOUNT_ROLES=""
  ROLES=$(saml2aws list-roles --skip-prompt)
  ACCOUNT_FOUND=false
  while IFS= read -r line
  do
    if [[ "$ACCOUNT_FOUND" == "true" ]]
    then
      ACCOUNT_ROLES="$ACCOUNT_ROLES$line\n"
      ACCOUNT_FOUND=false
    fi
    if [ -z $BASH ];
    then
      if [[ "$line" =~ "^Account: ([a-z\-]+) .*$" ]];
      then
        ACCOUNTS="$ACCOUNTS$match\n"
        ACCOUNT_FOUND=true
      fi
    else
      REG="^Account: ([a-z\-]+) .*$"
      if [[ "$line" =~ $REG ]];
      then
        ACCOUNTS="$ACCOUNTS${BASH_REMATCH[1]}\n"
        ACCOUNT_FOUND=true
      fi
    fi
  done < <(printf '%s\n' "$ROLES")
  export AWS_PROFILE=$(printf $ACCOUNTS | sed '/^$/d' | fzf --reverse --border --height 10%)
  ROLE=$(echo $ACCOUNT_ROLES | sed -n $(printf $ACCOUNTS | grep -Fn "$AWS_PROFILE" | cut -d : -f 1)p)
  saml2aws login --skip-prompt --profile=$AWS_PROFILE --force --session-duration=14400 --role=$ROLE &> /dev/null
  echo "Using $AWS_PROFILE"
}

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias er="nvim ~/.zshrc"

export PYENV_ROOT="$HOME/.pyenv" 
export KUBECONFIG=~/.kube/config

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

autoload -Uz compinit && compinit -i

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/xxxxx/.sdkman"
[[ -s "/Users/xxxxx/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/xxxxx/.sdkman/bin/sdkman-init.sh"

