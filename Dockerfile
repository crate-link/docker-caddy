FROM golang:1.12

COPY root/ /root

ENV GO111MODULE=on

RUN /root/build.sh


FROM gcr.io/distroless/base

COPY --from=0 /root/caddy/caddy /usr/local/bin/caddy

EXPOSE 80 443
VOLUME /home
WORKDIR /home

ENTRYPOINT [ "caddy" ]
CMD [ "-agree" ]

