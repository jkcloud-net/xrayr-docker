FROM alpine:3.9

ENV UserNODE_ID="97"                               \
    Userdomain="https://xueyun.club/"             \
    Usermukey="NimaQu"                  
    
COPY . /root
WORKDIR /root

RUN  apk --update --no-cache add tzdata ca-certificates \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apk --no-cache add gettext \
    && cp  /usr/bin/envsubst  /usr/local/bin && chmod -R 755 /usr/local/bin/envsubst

RUN wget "https://xueyun.club/XrayR" && chmod -R 755 XrayR

CMD envsubst < config.yml > userconfig.yml

ENTRYPOINT [ "/root/XrayR", "--config", "/root/userconfig.yml"]
