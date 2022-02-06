FROM golang:1.17-alpine3.15 AS builder

WORKDIR /app
COPY . .
RUN go build -o lemon cmd/server/*.go

FROM alpine:3.15

WORKDIR /app
COPY --from=builder /app/lemon lemon

CMD ["lemon"]
