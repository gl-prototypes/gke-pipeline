FROM golang:1.9-alpine AS builder
RUN apk add -U git
COPY . /src
WORKDIR /src/cmd/demo
RUN go get github.com/gliderlabs/ssh
RUN go build

FROM alpine:3.6
COPY --from=builder /src/cmd/demo/demo /demo
EXPOSE 2222
ENTRYPOINT ["/demo"]
