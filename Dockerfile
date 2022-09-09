FROM alpine:3.10
RUN /bin/sh -c set -ex \
    && echo "https://alpine.global.ssl.fastly.net/alpine/v3.10/main" >> /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    curl \
    git \
    jq \
    libc6-compat \
    openssl \
    perl \
    tzdata \
    util-linux \
    vim
COPY bin/ /usr/local/bin/
COPY bin/config.json /root/.bin/
ADD bin/.krew /root/.krew
ADD configs/.fzf /root/.fzf
RUN mkdir -p /root/.config/cheat/cheatsheets/personal /root/.kube && \
        cd /root/.config/cheat/cheatsheets/ && \
            git clone https://github.com/cheat/cheatsheets.git community && \
                cat '/usr/share/zoneinfo/Asia/Calcutta' > /etc/localtime
COPY configs/.bashrc configs/.fzf.bash \
        configs/.cheat-autocompletion configs/.bash-completion \
            configs/.bat_config /root/
COPY configs/cheat/conf.yaml /root/.config/cheat/conf.yml
COPY configs/cheat/personal /root/.config/cheat/cheatsheets/personal
WORKDIR /root
CMD ["bash"]
