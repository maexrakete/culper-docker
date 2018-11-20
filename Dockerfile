FROM alpine:3.8

WORKDIR /

RUN apk update && apk add gnupg

RUN mkdir /config
RUN mkdir /gpg

ADD https://github.com/maexrakete/culper/releases/download/0.1.4/culper /usr/bin/culper


RUN chmod +x /usr/bin/culper
RUN ls -la /usr/bin/culper

VOLUME ["/config", "/data"]

EXPOSE 8000
ENTRYPOINT ["culper", "--gpg_path=/gpg", "--config=/config", "server"]
