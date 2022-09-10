FROM alpine:3.10
RUN /bin/sh -c set -ex \
    && echo "https://alpine.global.ssl.fastly.net/alpine/v3.10/main" >> /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    curl \
    git \
    jq \
    unzip \
    libc6-compat \
    openssl \
    perl \
    tzdata \
    util-linux \
    vim
COPY all_config.zip /root/.cache/
RUN mkdir -p /root/.kube && cat '/usr/share/zoneinfo/Asia/Calcutta' > /etc/localtime
COPY configs/.bashrc /root/
WORKDIR /root
CMD ["bash"]
