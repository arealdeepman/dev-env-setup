### NAVIGATION/DIRECTORY ALIASES ###
alias workspace="~/Workspace"
alias tools="~/Documents/Tools"
alias downloads="~/Downloads"
alias documents="~/Documents"
alias desktop="~/Desktop"

### K8S ALIASES ###
alias k="kubectl $@"
alias kgs="kubectl config get-contexts"

### DOCKER ALIASES ###
alias d="docker"
alias dps="docker ps"

### TMUX ALIASES ###
alias tn="tmux new -s"
alias tk="tmux kill-sess -t"
alias ta="tmux attach -t"
alias td="tmux detach"
alias tl="tmux ls"

### PYTHON ALIASES ###
alias ae="deactivate &> /dev/null; source ./venv/bin/activate"
alias de="deactivate"
alias venv="python3 -m virtualenv"
alias python="python3"
alias pip="pip3"

### ZSHRC EDITS ###
alias ec="nvim $HOME/.zshrc"
alias ecc="nvim $HOME/.oh-my-zsh/custom/custom.zsh"
alias sc="source $HOME/.zshrc"

### GIT ALIASES ###
alias gc="git clone"

### MISC ALIASES ###
alias mkdir="mkdir -pv"
alias ll="ls --color=auto -llho"
alias ls="eza --color=always --icons=always -w=150 -x --group-directories-first"
alias cd="z"

### PATH ###
export PATH=/opt/homebrew/bin:$PATH
