export ZSH="$HOME/.oh-my-zsh"
# Local variable zsh
ZLE_REMOVE_SUFFIX_CHARS=""
ZSH_THEME="test2"
# Magic happen for completion
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi
zmodload -i zsh/complist
# plugin here
plugins=(git
        docker
        docker-compose
        kubectl
        gcloud
        zsh-completions
)
source $ZSH/oh-my-zsh.sh
# Load all all dep's
for file in ~/.{aliases,path,exports,options}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		source "$file"
	fi
done
unset file


