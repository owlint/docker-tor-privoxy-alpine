FROM alpine:latest

EXPOSE 8118 9050

RUN apk --update add privoxy tor runit tini

RUN addgroup -g 1000 -S torproxy && adduser -u 1000 -G torproxy -S torproxy

COPY --chown=torproxy:torproxy service /etc/service/

ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/service"]
