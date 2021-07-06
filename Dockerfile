FROM alpine:3

ENV NODE=0                     \
    MUKEY=6                    \
    WEBURL=0                   
    
COPY . /root
WORKDIR /root

RUN  apk --update --no-cache add tzdata ca-certificates \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN wget "https://xueyun.club/XrayR" && chmod -R 755 XrayR

ENTRYPOINT [ "/root/XrayR", "--config", "config.yml"]
