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
COPY bin/ configs/ /root/.config/bin/
ADD bin/.krew /root/.krew
ADD configs/.fzf /root/.fzf
RUN mkdir -p /root/.kube && \
        cd /root/.config/bin/cheatsheets/ && \
            git clone https://github.com/cheat/cheatsheets.git community && \
                rm -r /root/.config/bin/.krew && rm -r /root/.config/bin/.fzf && \
                cat '/usr/share/zoneinfo/Asia/Calcutta' > /etc/localtime
COPY configs/.bashrc /root/
WORKDIR /root
CMD ["bash"]
