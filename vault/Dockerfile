FROM vault:latest

##
# ---------- env settings ----------
##
# --build-arg timezone=Asia/Shanghai
ARG timezone

COPY config.hcl /vault/config/config.hcl

ENV TIMEZONE=${timezone:-"Asia/Shanghai"}

RUN set -ex \
    && echo "http://mirrors.aliyun.com/alpine/v3.10/main/" > /etc/apk/repositories \
    && apk update \
    && apk add --no-cache libstdc++ openssl git bash make \
    # - config timezone
    && ln -sf /usr/share/zoneinfo/${TIMEZONEs} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \
    # ---------- clear works ----------
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man \
    && echo -e "\033[42;37m Build Completed :).\033[0m\n"

WORKDIR /home
VOLUME [ "/vault/file", "/vault/logs" ]

EXPOSE 8200