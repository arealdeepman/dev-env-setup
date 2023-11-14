### NAVIGATION/DIRECTORY ALIASES ### 
alias workspace="~/Workspace"
alias tools="~/Documents/Tools"
alias downloads="~/Downloads"
alias documents="~/Documents"
alias desktop="~/Desktop"

### K8S ALIASES ###
alias k="kubectl $@"
alias kctx="kubectl config get-contexts"

### DOCKER ALIASES ###
alias d="docker $@"
alias dps="docker ps $@"

### PYTHON ALIASES ###
alias ae="deactivate &> /dev/null; source ./venv/bin/activate"
alias de="deactivate"
alias venv="python3 -m virtualenv"
alias python="python3 $@"
alias pip="pip3 $@"

### ZSHRC EDITS ###
alias ec="nvim $HOME/.zshrc"
alias ecc="nvim $HOME/.oh-my-zsh/custom/"
alias sc="source $HOME/.zshrc"

### GIT ALIASES ###
alias gc="git clone $@"

### MISC ALIASES ###
alias mkdir="mkdir -pv"
alias ll="ls --color=auto -llho"

