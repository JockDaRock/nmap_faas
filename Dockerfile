FROM alpine

ADD https://github.com/openfaas-incubator/of-watchdog/releases/download/0.1.0/of-watchdog /usr/bin

RUN chmod +x /usr/bin/of-watchdog

RUN apk update && apk add nmap

WORKDIR /root/

ENV fprocess="xargs nmap"

HEALTHCHECK --interval=1s CMD [ -e /tmp/.lock ] || exit 1

CMD ["of-watchdog"]
