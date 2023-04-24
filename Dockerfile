FROM golang:1.19 as builder

WORKDIR /app

RUN go install github.com/cosmtrek/air@latest

ENV GO111MODULE=auto

COPY go.mod go.sum ./

RUN go mod download

CMD ["air"]