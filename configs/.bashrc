# SET PROMPT
PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]: \[\033[01;34m\]\w\[\033[00m\] $ '

# SET KREW PATH
export PATH="${PATH}:${HOME}/.krew/bin:~/.local/bin"

# TZ TIMEZONE
# export TZ_LIST='UTC;America/Chicago;America/Los_Angeles;America/New_York, America/New_York'
export TZ_LIST='UTC;America/New_York, America/New_York'

# FZF
export FZF_DEFAULT_OPTS='--height 50% --color=dark --layout=reverse --border'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# CHEAT AUTOCOMPLETION WITH FZF
export CHEAT_USE_FZF=true
source /root/.cheat-autocompletion

# BASH AUTOCOMPLETION
source /root/.bash-completion

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
export BAT_CONFIG_PATH=/root/.bat_config
export BAT_PAGER='less -RF'

# OTHERS
alias cat='bat'
alias vi='vim'
alias ls='exa'
alias 1linejson='jq -c . '

# GITHUB AUTH TOKEN FOR AUTHENTICATED REQUESTS (APPLICATION: BIN) (REMOVING GITHUB RATE LIMITS)
export GITHUB_AUTH_TOKEN=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
