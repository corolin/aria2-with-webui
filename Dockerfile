FROM alpine:edge

RUN apk update && \
apk add --no-cache --update bash && \
apk add --no-cache --update openssl && \
mkdir -p /app && \
mkdir -p /conf && \
mkdir -p /data && \
apk add --no-cache --update darkhttpd && \
apk add --no-cache --update aria2

COPY files/start.sh /app/start.sh
COPY files/aria2.conf /app/aria2.conf
COPY files/aria-ng /app/aria-ng

RUN chmod +x /app/start.sh

WORKDIR /
VOLUME ["/data"]
VOLUME ["/conf"]
EXPOSE 6800
EXPOSE 80

CMD ["sh", "/app/start.sh"]
