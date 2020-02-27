FROM golang:alpine3.7 as builder

WORKDIR /go/src/github.com/YAGER-Development/simple-app

ENV GO111MODULE=on

RUN apk add git --no-cache

COPY . .

RUN go mod tidy && go mod vendor

RUN CGO_ENABLED=0 GOOS=linux go build -o simple-app

FROM alpine:3.7

RUN addgroup -S simple-app && adduser -S -g simple-app simple-app

USER simple-app

COPY --from=builder /go/src/github.com/YAGER-Development/simple-app/simple-app /usr/bin/simple-app

EXPOSE 8080

CMD ["simple-app"]