FROM golang:1.7-alpine

RUN apk add --update git \
&& go get sourcegraph.com/sourcegraph/appdash \
&& cd /go/src/sourcegraph.com/sourcegraph/appdash/cmd/appdash \
&& go get ./... \
&& go build -o appdash \
&& cp appdash /usr/local/bin \
&& apk del git \
&& rm -rf /go/*

WORKDIR /

EXPOSE 7700 7701
ENTRYPOINT ["appdash", "serve"]