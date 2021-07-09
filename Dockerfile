FROM alpine:3.9

ENV UserNODE_ID="97"                               \
    Userdomain="https://xueyun.club/"             \
    Usermukey="NimaQu"                  
    
COPY . /root
WORKDIR /root

RUN  apk --update --no-cache add tzdata ca-certificates \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apk --no-cache add gettext \
    && cp  /usr/bin/envsubst  /usr/local/bin/

RUN wget "https://xueyun.club/XrayR" && chmod -R 755 XrayR

RUN envsubst < /root/config.yml > /root/userconfig.yml

ENTRYPOINT [ "/root/XrayR", "--config", "/root/userconfig.yml"]
