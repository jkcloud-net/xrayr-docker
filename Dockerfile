FROM alpine:3

ENV NODE=0                     \
    MUKEY=6                    \
    WEBURL=0                   
    
COPY . /root/xrayr
WORKDIR /root/xrayr

RUN  apk --update --no-cache add tzdata ca-certificates unzip \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN unzip XrayR.zip
COPY  XrayR /usr/local/bin

ENTRYPOINT [ "XrayR", "--config", "config.yml"]
