FROM alpine:3

ENV UserNODE_ID=999                               \
    Userdomain="https://xueyun.club/"             \
    Usermukey="NimaQu"                  
    
COPY . /root
WORKDIR /root

RUN  apk --update --no-cache add tzdata ca-certificates \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN wget "https://xueyun.club/XrayR" && chmod -R 755 XrayR

RUN sed -i "s#https://baidu.com#${Userdomain}#" /root/config.yml
RUN sed -i "s#NimaQu#${Usermukey}#" /root/config.yml
RUN sed -i "s#999#${UserNODE_ID}#" /root/config.yml

ENTRYPOINT [ "/root/XrayR", "--config", "config.yml"]
