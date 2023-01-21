FROM golang:1.15-alpine AS builder

RUN mkdir /app

ADD . /app

WORKDIR /app

RUN go build -o /app/hello-world .

FROM scratch

WORKDIR /app
COPY --from=builder /app/hello-world ./hello-world

ENTRYPOINT [ "./hello-world" ]