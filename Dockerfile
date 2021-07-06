FROM alpine:3

ENV NODE=0                     \
    MUKEY=6                    \
    WEBURL=0                   
    
COPY . /root/xrayr
WORKDIR /root/xrayr

RUN  apk --update --no-cache add tzdata ca-certificates \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN cd /usr/local/bin && wget -N --no-check-certificate "https://xueyun.club/XrayR"

ENTRYPOINT [ "XrayR", "--config", "config.yml"]
