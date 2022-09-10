/bin/cat << EOF

 /\  |__/ |__|  /\  |\ |
/~~\ |  \ |  | /~~\ | \|

    Authorized access only!

EOF

# PROMPT STATEMENT ONE
PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]: \[\033[01;34m\]\w\[\033[00m\] $ '

# BAT
export BAT_PAGER='less -RF'

# CHEAT WITH FZF
export CHEAT_USE_FZF=true

# FZF
export FZF_DEFAULT_OPTS='--height 50% --color=dark --layout=reverse --border'

# KREW PATH
export PATH="${PATH}:${HOME}/.krew/bin:${HOME}/.config/bin/"

# TZ TIMEZONE
# export TZ_LIST='UTC;America/Chicago;America/Los_Angeles;America/New_York, America/New_York'
export TZ_LIST='UTC;America/New_York, America/New_York'

# OTHERS
alias cat='bat'
alias vi='vim'
alias ls='exa'
alias 1linejson='jq -c . '

# USEFUL ALIAS AND FUNCTIONS FOR KUBECTL
alias k='kubectl'

# FUNCTION FOR LISTING ALL ALIASES IN COLUMNAR FORMAT
all(){
        grep ^alias ~/.bashrc | awk '{print $2}' | awk '-F=' '{print $1}' | sort | column
}

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

init(){
    unzip /root/.cache/all_config.zip -d /root/.config
    mv /root/.config/configs/.fzf /root
    cd /root/.config/configs/cheatsheets/ && git clone https://github.com/cheat/cheatsheets.git community && cd
    # CONF LOCATION
    export CHEAT_CONFIG_PATH="/root/.config/configs/cheatsheets/conf.yaml"
    export BAT_CONFIG_PATH=/root/.config/configs/.bat_config
    # AUTOCOMPLETION's
    source /root/.config/configs/.bash-completion
    source /root/.config/configs/.cheat-autocompletion
    [ -f ~/.config/configs/.fzf.bash ] && source /root/.config/configs/.fzf.bash

    # INSTALL KREW
    cd "$(mktemp -d)" &&
    OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
    ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
    KREW="krew-${OS}_${ARCH}" &&
    curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
    tar zxvf "${KREW}.tar.gz" &&
    ./"${KREW}" install krew

    # INSTALL SOME KREW PLUGINS
    k krew install fleet example explore neat custom-cols && cd
    cp -rpf /root/.config/configs/templates /root/.krew/store/custom-cols/v0.0.5/
}
time init &> ${HOME}/.init.logs
