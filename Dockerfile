FROM golang:1.18.3-alpine3.16 AS build

WORKDIR /app

COPY /hello.go .

RUN go mod init hellogo \
    && go build -o ./bin/hello hello.go

FROM scratch
WORKDIR /app
COPY --from=build /app .
CMD ["bin/hello"]

