FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o /app/hello

FROM scratch

COPY --from=builder /app/hello /hello

CMD ["./hello"]