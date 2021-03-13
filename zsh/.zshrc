export ZSH="$HOME/.oh-my-zsh"

# Some tweak, theme, and plugins
ZLE_REMOVE_SUFFIX_CHARS=""
ZSH_THEME="test2"

plugins=(git
        docker
        docker-compose
        kubectl
        gcloud
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# My aliases
alias turnoff="sudo shutdown -h now"
alias cleanup="sync;sudo sysctl -w vm.drop_caches=3"
alias myip="curl -s ipinfo.io | jq"
alias reload=". ~/.zshrc && exec $SHELL -l"
# alias ls="ls -F --color=auto"
alias k="kubectl"
alias bye="clear; exit"

# Gothings
export GOPATH=$HOME/playground/go
export PATH=$PATH:$(go env GOPATH)/bin
# export GOROOT=/usr/local/go
# export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Krew Path
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Code
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/riski.wahyu/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/riski.wahyu/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/riski.wahyu/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/riski.wahyu/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
