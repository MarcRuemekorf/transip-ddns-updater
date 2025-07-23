FROM alpine:3.22

ENV LANG C.UTF-8

RUN apk add --no-cache bash curl jq openssl python3 py3-requests

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
