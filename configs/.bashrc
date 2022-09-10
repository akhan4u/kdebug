# SET PROMPT
PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]: \[\033[01;34m\]\w\[\033[00m\] $ '

# SET KREW PATH
export PATH="${PATH}:${HOME}/.krew/bin:${HOME}/.config/bin/"

# TZ TIMEZONE
# export TZ_LIST='UTC;America/Chicago;America/Los_Angeles;America/New_York, America/New_York'
export TZ_LIST='UTC;America/New_York, America/New_York'

# FZF
export FZF_DEFAULT_OPTS='--height 50% --color=dark --layout=reverse --border'
[ -f ~/.config/bin/.fzf.bash ] && source /root/.config/bin/.fzf.bash

# CHEAT AUTOCOMPLETION WITH FZF
export CHEAT_CONFIG_PATH="/root/.config/bin/cheatsheets/conf.yaml"
export CHEAT_USE_FZF=true
source /root/.config/bin/.cheat-autocompletion

# BASH AUTOCOMPLETION
source /root/.config/bin/.bash-completion

# USEFUL ALIAS AND FUNCTIONS FOR KUBECTL
alias k='kubectl'

kns(){
    kubectl get ns
}

kn(){
    namespace=$1
    export KUBE_NAMESPACE="${1}"
    kubectl config set-context --current --namespace="${namespace}"
}

kc(){
    kubectl config get-contexts
}

# BAT
export BAT_CONFIG_PATH=/root/.config/bin/.bat_config
export BAT_PAGER='less -RF'

# OTHERS
alias cat='bat'
alias vi='vim'
alias ls='exa'
alias 1linejson='jq -c . '
